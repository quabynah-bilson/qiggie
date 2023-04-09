import 'package:dartz/dartz.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

@Injectable(as: BaseAuthRepository)
class QiggyAuthRepository extends BaseAuthRepository {
  final AuthServiceClient client;
  final BaseLocalStorageRepository storage;

  QiggyAuthRepository({required this.client, required this.storage});

  @override
  Future<Either<Account, String>> createAccount({
    required String username,
    required String displayName,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      var request = CreateAccountRequest(
        username: username,
        password: password,
        displayName: displayName,
        phoneNumber: phoneNumber,
      );
      var authResponse = await client.create_account(request);
      await storage.saveSession(authResponse.session);
      await storage.saveAccount(authResponse.account);
      return left(authResponse.account);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> login({
    required String username,
    required String password,
  }) async {
    try {
      var request = LoginRequest(password: password, username: username);
      var authResponse = await client.login(request);
      await storage.saveSession(authResponse.session);
      await storage.saveAccount(authResponse.account);
      return left(authResponse.account);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      var either = await storage.getCurrentSession();
      var session = either.fold((l) => l, (r) => null);
      if (session == null) {
        throw GrpcError.unauthenticated(
            'Your session has expired. Please sign in again');
      }
      await client.logout(StringValue(value: session.sessionId));
      await storage.clearSessionAndAccount();
      return left('Signed out successfully');
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<AuthCodeResponse, String>> sendVerificationCode(
      String phoneNumber) async {
    try {
      var response =
          await client.send_auth_code(StringValue(value: phoneNumber));
      return left(response);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<String, String>> updatePassword(String newPassword) async {
    try {
      var response =
          await client.update_password(StringValue(value: newPassword));
      return left(response.value);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<AuthCodeResponse, String>> verifyCode({
    required String phoneNumber,
    required int code,
  }) async {
    try {
      var response = await client.verify_auth_code(
          VerifyAuthCode(code: code, phoneNumber: phoneNumber));
      return left(response);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> getCurrentAccount() async {
    try {
      var either = await storage.getCurrentAccount();
      var account = either.fold((l) => l, (r) => null);
      if (account == null) {
        throw GrpcError.unauthenticated(
            'Your session has expired. Please sign in again');
      }
      return left(account);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<Account, String>> updateAccount(Account account) async {
    try {
      var updatableAccount = await client.update_account(account);
      await storage.saveAccount(updatableAccount);
      return left(updatableAccount);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }
}
