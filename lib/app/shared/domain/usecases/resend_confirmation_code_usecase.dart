import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IResendConfirmationCodeUsecase {
  Future<Either<AuthErrors, void>> call(String email);
}

class ResendConfirmationCodeUsecase extends IResendConfirmationCodeUsecase {
  final IAuthRepository repository;

  ResendConfirmationCodeUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, void>> call(String email) async {
    var result = await repository.postResendCode(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
