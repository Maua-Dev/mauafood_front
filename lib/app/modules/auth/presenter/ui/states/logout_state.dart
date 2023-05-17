import '../../../domain/errors/auth_errors.dart';

abstract class LogoutState {
  const LogoutState();
}

class LogoutInitialState extends LogoutState {}

class LogoutLoadingState extends LogoutState {}

class LogoutSuccessState extends LogoutState {
  const LogoutSuccessState();
}

class LogoutErrorState extends LogoutState {
  final AuthErrors error;

  const LogoutErrorState(this.error);
}
