import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/domain/entities/user_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';

import '../infra/auth_repository_interface.dart';

abstract class RegisterUserInterface {
  Future<Either<Failure, bool>> call(User user);
}

class RegisterUserImpl extends RegisterUserInterface {
  final AuthRepositoryInterface repository;

  RegisterUserImpl({required this.repository});

  @override
  Future<Either<Failure, bool>> call(User user) async {
    var result = await repository.registerUser(user);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
