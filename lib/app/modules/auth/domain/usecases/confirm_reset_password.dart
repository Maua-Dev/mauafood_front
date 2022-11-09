import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ConfirmResetPasswordInterface {
  Future<Either<ForgotPasswordError, void>> call(
      String email, String newPassword, String confirmationCode);
}

class ConfirmResetPasswordImpl extends ConfirmResetPasswordInterface {
  final AuthRepositoryInterface repository;

  ConfirmResetPasswordImpl({required this.repository});

  @override
  Future<Either<ForgotPasswordError, void>> call(
      String email, String newPassword, String confirmationCode) async {
    var result = await repository.confirmResetPassword(
        email, newPassword, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
