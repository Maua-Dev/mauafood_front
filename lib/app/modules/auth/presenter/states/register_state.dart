import '../../domain/errors/auth_errors.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  const RegisterSuccessState();
}

class RegisterErrorState extends RegisterState {
  final AuthErrors error;

  const RegisterErrorState({required this.error});
}
