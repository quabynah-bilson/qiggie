part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class UpdateAccountAuthEvent extends AuthEvent {
  final Account account;

  const UpdateAccountAuthEvent(this.account);
}

class LoginAuthEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginAuthEvent({required this.username, required this.password});
}

class CreateAccountAuthEvent extends AuthEvent {
  final String username;
  final String password;
  final String phoneNumber;
  final String displayName;

  const CreateAccountAuthEvent({
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.displayName,
  });
}

class SendVerificationCodeAuthEvent extends AuthEvent {
  final String phoneNumber;

  const SendVerificationCodeAuthEvent(this.phoneNumber);
}

class VerifyCodeAuthEvent extends AuthEvent {
  final String phoneNumber;
  final int code;

  const VerifyCodeAuthEvent({required this.phoneNumber, required this.code});
}

class UpdatePasswordAuthEvent extends AuthEvent {
  final String newPassword;

  const UpdatePasswordAuthEvent(this.newPassword);
}

class GetAccountAuthEvent extends AuthEvent {}

class LogoutAuthEvent extends AuthEvent {}
