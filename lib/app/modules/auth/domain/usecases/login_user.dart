import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../errors/auth_errors.dart';
import '../infra/auth_repository_interface.dart';

abstract class LoginUserInterface {
  Future<Either<SignUpError, CognitoAuthSession>> call(
      String email, String password);
}

class LoginUserImpl extends LoginUserInterface {
  final AuthRepositoryInterface repository;

  LoginUserImpl({required this.repository});

  @override
  Future<Either<SignUpError, CognitoAuthSession>> call(
      String email, String password) async {
    var result = await repository.loginUser(email, password);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}