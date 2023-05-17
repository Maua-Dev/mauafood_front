import '../../../domain/errors/auth_errors.dart';

abstract class ConfirmEmailState {
  const ConfirmEmailState();
}

class ConfirmEmailInitialState extends ConfirmEmailState {}

class ConfirmEmailLoadingState extends ConfirmEmailState {}

class ConfirmEmailSuccessState extends ConfirmEmailState {
  const ConfirmEmailSuccessState();
}

class ConfirmEmailErrorState extends ConfirmEmailState {
  final AuthErrors error;

  const ConfirmEmailErrorState({required this.error});
}
