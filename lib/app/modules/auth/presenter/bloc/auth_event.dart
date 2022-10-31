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
  final bool isStudent;
  final bool notifications;

  const RegisterUser(
      {required this.email,
      required this.password,
      required this.cpf,
      required this.fullName,
      required this.isStudent,
      required this.notifications});

  @override
  List<Object> get props =>
      [email, password, cpf, fullName, isStudent, notifications];
}

class LogoutUser extends AuthEvent {
  const LogoutUser();
}
