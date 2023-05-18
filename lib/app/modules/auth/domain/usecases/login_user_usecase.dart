import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class ILoginUserUsecase {
  Future<Either<SignUpError, CognitoAuthSession>> call(
      String email, String password);
}

class LoginUserUsecase extends ILoginUserUsecase {
  final AuthRepositoryInterface repository;

  LoginUserUsecase({required this.repository});

  @override
  Future<Either<SignUpError, CognitoAuthSession>> call(
      String email, String password) async {
    var result = await repository.loginUser(email, password);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}