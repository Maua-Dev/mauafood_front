import '../../../../shared/infra/user_roles_enum.dart';
import '../../domain/errors/auth_errors.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final bool isLogged;
  final UserRolesEnum userRole;

  const LoginSuccessState({required this.userRole, required this.isLogged});
}

class LoginErrorState extends LoginState {
  final AuthErrors error;

  const LoginErrorState(this.error);
}
