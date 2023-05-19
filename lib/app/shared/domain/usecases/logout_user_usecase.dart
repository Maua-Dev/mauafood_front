import 'package:dartz/dartz.dart';

import '../../helpers/errors/auth_errors.dart';
import '../repositories/auth_repository_interface.dart';

abstract class ILogoutUserUsecase {
  Future<Either<AuthErrors, void>> call();
}

class LogoutUserUsecase extends ILogoutUserUsecase {
  final IAuthRepository repository;

  LogoutUserUsecase({required this.repository});

  @override
  Future<Either<AuthErrors, void>> call() async {
    var result = await repository.logoutUser();
    return result.fold(
        (failureResult) => result, (successResult) => const Right(null));
  }
}
