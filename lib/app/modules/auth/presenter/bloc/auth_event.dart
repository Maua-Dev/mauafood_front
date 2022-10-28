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
  final UserModel user;

  const RegisterUser({required this.user});

  @override
  List<Object> get props => [user];
}

class LogoutUser extends AuthEvent {
  const LogoutUser();
}
