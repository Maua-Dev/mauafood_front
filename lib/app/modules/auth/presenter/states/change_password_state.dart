import '../../../../shared/domain/errors/auth_errors.dart';

abstract class ChangePasswordState {
  const ChangePasswordState();
}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {
  const ChangePasswordSuccessState();
}

class ChangePasswordErrorState extends ChangePasswordState {
  final AuthErrors error;

  const ChangePasswordErrorState({required this.error});
}
