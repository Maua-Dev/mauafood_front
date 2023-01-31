part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final bool isLogged;
  final String userRole;

  const AuthLoadedState({required this.userRole, required this.isLogged});

  @override
  List<Object> get props => [isLogged, userRole];
}

class AuthConfirmResetState extends AuthState {
  final bool isReseted;

  const AuthConfirmResetState({required this.isReseted});

  @override
  List<Object> get props => [isReseted];
}

class AuthChangePasswordCompleteState extends AuthState {
  const AuthChangePasswordCompleteState();
}

class AuthErrorState extends AuthState {
  final AuthErrors error;

  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}
