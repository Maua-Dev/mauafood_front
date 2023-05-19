import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IConfirmResetPasswordUsecase {
  Future<Either<ForgotPasswordError, void>> call(
      String email, String newPassword, String confirmationCode);
}

class ConfirmResetPasswordUsecase extends IConfirmResetPasswordUsecase {
  final AuthRepositoryInterface repository;

  ConfirmResetPasswordUsecase({required this.repository});

  @override
  Future<Either<ForgotPasswordError, void>> call(
      String email, String newPassword, String confirmationCode) async {
    var result = await repository.confirmResetPassword(
        email, newPassword, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
