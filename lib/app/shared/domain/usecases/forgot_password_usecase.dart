import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<AuthErrors, void>> call(String email);
}

class ForgotPasswordUsecase extends IForgotPasswordUsecase {
  final IAuthRepository repository;

  ForgotPasswordUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, void>> call(String email) async {
    var result = await repository.forgotPassword(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
