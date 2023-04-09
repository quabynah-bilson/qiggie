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
      if (session == null) throw GrpcError.unauthenticated();
      await client.logout(StringValue(value: session.sessionId));
      return left('Signed out successfully');
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }

  @override
  Future<Either<String, String>> sendVerificationCode(
      String phoneNumber) async {
    try {
      var response = await client.send_otp(StringValue(value: phoneNumber));
      return left(response.value);
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
  Future<Either<String, String>> verifyCode({
    required String phoneNumber,
    required int code,
  }) async {
    try {
      var response = await client.verify_otp(Int32Value(value: code));
      return left(response.value);
    } on GrpcError catch (e) {
      logger.e(e);
      return right(e.message ?? e.codeName);
    }
  }
}
