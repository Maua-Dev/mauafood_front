import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class RegisterUserInterface {
  Future<Either<RegisterError, bool>> call(UserModel user);
}

class RegisterUserImpl extends RegisterUserInterface {
  final AuthRepositoryInterface repository;

  RegisterUserImpl({required this.repository});

  @override
  Future<Either<RegisterError, bool>> call(UserModel user) async {
    var result = await repository.registerUser(user);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
