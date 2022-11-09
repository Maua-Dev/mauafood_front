part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmail extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmail({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LogoutUser extends AuthEvent {
  const LogoutUser();
}

class ForgotPassword extends AuthEvent {
  final String email;
  const ForgotPassword({required this.email});

  @override
  List<Object> get props => [email];
}

class ConfirmResetPassword extends AuthEvent {
  final String email;
  final String newPassword;
  final String confirmationCode;
  const ConfirmResetPassword(
      {required this.newPassword,
      required this.confirmationCode,
      required this.email});

  @override
  List<Object> get props => [email, newPassword, confirmationCode];
}
