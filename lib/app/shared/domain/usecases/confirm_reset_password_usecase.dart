import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IConfirmResetPasswordUsecase {
  Future<Either<AuthErrors, void>> call(
      String email, String newPassword, String confirmationCode);
}

class ConfirmResetPasswordUsecase extends IConfirmResetPasswordUsecase {
  final IAuthRepository repository;

  ConfirmResetPasswordUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, void>> call(
      String email, String newPassword, String confirmationCode) async {
    var result = await repository.confirmResetPassword(
        email, newPassword, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
