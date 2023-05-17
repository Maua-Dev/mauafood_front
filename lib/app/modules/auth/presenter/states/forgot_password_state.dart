import '../../domain/errors/auth_errors.dart';

abstract class ForgotPasswordState {
  const ForgotPasswordState();
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  const ForgotPasswordSuccessState();
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final AuthErrors error;

  const ForgotPasswordErrorState(this.error);
}
