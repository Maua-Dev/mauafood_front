import '../../../../shared/domain/errors/auth_errors.dart';

abstract class ResendConfirmationState {
  const ResendConfirmationState();
}

class ResendConfirmationInitialState extends ResendConfirmationState {}

class ResendConfirmationLoadingState extends ResendConfirmationState {}

class ResendConfirmationSuccessState extends ResendConfirmationState {
  const ResendConfirmationSuccessState();
}

class ResendConfirmationErrorState extends ResendConfirmationState {
  final AuthErrors error;

  const ResendConfirmationErrorState({required this.error});
}
