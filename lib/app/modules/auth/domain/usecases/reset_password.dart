import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ResetPasswordInterface {
  Future<Either<ResetPasswordError, void>> call(String email);
}

class ResetPasswordImpl extends ResetPasswordInterface {
  final AuthRepositoryInterface repository;

  ResetPasswordImpl({required this.repository});

  @override
  Future<Either<ResetPasswordError, void>> call(String email) async {
    var result = await repository.resetPassword(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
