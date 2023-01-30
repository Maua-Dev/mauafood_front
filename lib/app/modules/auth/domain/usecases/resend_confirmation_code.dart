import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ResendConfirmationCodeInterface {
  Future<Either<ResendCodeError, void>> call(String email);
}

class ResendConfirmationCodeImpl extends ResendConfirmationCodeInterface {
  final AuthRepositoryInterface repository;

  ResendConfirmationCodeImpl({required this.repository});

  @override
  Future<Either<ResendCodeError, void>> call(String email) async {
    var result = await repository.postResendCode(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
