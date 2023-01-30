import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ForgotPasswordInterface {
  Future<Either<ForgotPasswordError, bool>> call(String email);
}

class ForgotPasswordImpl extends ForgotPasswordInterface {
  final AuthRepositoryInterface repository;

  ForgotPasswordImpl({required this.repository});

  @override
  Future<Either<ForgotPasswordError, bool>> call(String email) async {
    var result = await repository.forgotPassword(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
