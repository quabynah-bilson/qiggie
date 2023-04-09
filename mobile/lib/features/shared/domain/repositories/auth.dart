import 'package:dartz/dartz.dart';
import 'package:mobile/protos/auth.pb.dart';

abstract class BaseAuthRepository {
  Future<Either<Account, String>> login({
    required String username,
    required String password,
  });

  Future<Either<Account, String>> createAccount({
    required String username,
    required String displayName,
    required String password,
    required String phoneNumber,
  });

  Future<Either<String, String>> logout();

  Future<Either<String, String>> sendVerificationCode(String phoneNumber);

  Future<Either<String, String>> updatePassword(String newPassword);

  Future<Either<String, String>> verifyCode({
    required String phoneNumber,
    required int code,
  });
}
