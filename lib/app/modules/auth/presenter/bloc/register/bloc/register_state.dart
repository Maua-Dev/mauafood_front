part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  const RegisterLoadedState();
}

class ConfirmLoadedState extends RegisterState {
  final bool isConfirmed;

  const ConfirmLoadedState({required this.isConfirmed});

  @override
  List<Object> get props => [isConfirmed];
}

class RegisterErrorState extends RegisterState {
  final AuthErrors error;

  const RegisterErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
