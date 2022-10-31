import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ConfirmEmailInterface {
  Future<Either<ConfirmationEmailError, bool>> call(
      String email, String confirmationCode);
}

class ConfirmEmailImpl extends ConfirmEmailInterface {
  final AuthRepositoryInterface repository;

  ConfirmEmailImpl({required this.repository});

  @override
  Future<Either<ConfirmationEmailError, bool>> call(
      String email, String confirmationCode) async {
    var result = await repository.confirmEmail(email, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
