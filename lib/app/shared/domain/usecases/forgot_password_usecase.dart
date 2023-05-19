import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<ForgotPasswordError, bool>> call(String email);
}

class ForgotPasswordUsecase extends IForgotPasswordUsecase {
  final AuthRepositoryInterface repository;

  ForgotPasswordUsecase({required this.repository});

  @override
  Future<Either<ForgotPasswordError, bool>> call(String email) async {
    var result = await repository.forgotPassword(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
