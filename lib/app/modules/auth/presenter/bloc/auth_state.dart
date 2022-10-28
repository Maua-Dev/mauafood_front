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

  const AuthLoadedState({required this.isLogged});

  @override
  List<Object> get props => [isLogged];
}

class AuthErrorState extends AuthState {
  final AuthErrors error;

  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}
