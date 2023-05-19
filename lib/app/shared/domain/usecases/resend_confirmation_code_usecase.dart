import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IResendConfirmationCodeUsecase {
  Future<Either<ResendCodeError, void>> call(String email);
}

class ResendConfirmationCodeUsecase extends IResendConfirmationCodeUsecase {
  final AuthRepositoryInterface repository;

  ResendConfirmationCodeUsecase({required this.repository});

  @override
  Future<Either<ResendCodeError, void>> call(String email) async {
    var result = await repository.postResendCode(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
