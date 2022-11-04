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

class RegisterUser extends AuthEvent {
  final String email;
  final String password;
  final String cpf;
  final String fullName;
  final bool notifications;

  const RegisterUser(
      {required this.email,
      required this.password,
      required this.cpf,
      required this.fullName,
      required this.notifications});

  @override
  List<Object> get props => [email, password, cpf, fullName, notifications];
}

class LogoutUser extends AuthEvent {
  const LogoutUser();
}

class ConfirmEmail extends AuthEvent {
  final String email;
  final String code;

  const ConfirmEmail({required this.email, required this.code});

  @override
  List<Object> get props => [email, code];
}
