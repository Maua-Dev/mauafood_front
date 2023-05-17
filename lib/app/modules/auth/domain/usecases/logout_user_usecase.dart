import 'package:dartz/dartz.dart';

import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ILogoutUserUsecase {
  Future<Either<LogoutError, void>> call();
}

class LogoutUserUsecase extends ILogoutUserUsecase {
  final AuthRepositoryInterface repository;

  LogoutUserUsecase({required this.repository});

  @override
  Future<Either<LogoutError, void>> call() async {
    var result = await repository.logoutUser();
    return result.fold(
        (failureResult) => result, (successResult) => const Right(null));
  }
}
