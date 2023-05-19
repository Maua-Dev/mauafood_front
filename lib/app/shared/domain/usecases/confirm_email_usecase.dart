import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IConfirmEmailUsecase {
  Future<Either<ConfirmationEmailError, bool>> call(
      String email, String confirmationCode);
}

class ConfirmEmailUsecase extends IConfirmEmailUsecase {
  final AuthRepositoryInterface repository;

  ConfirmEmailUsecase({required this.repository});

  @override
  Future<Either<ConfirmationEmailError, bool>> call(
      String email, String confirmationCode) async {
    var result = await repository.confirmEmail(email, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
