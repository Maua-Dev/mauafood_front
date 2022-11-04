import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../errors/auth_errors.dart';

abstract class AuthRepositoryInterface {
  Future<Either<RegisterError, bool>> registerUser(UserModel user);
  Future<Either<SignUpError, CognitoAuthSession>> loginUser(
      String email, String password);
  Future<Either<ConfirmationEmailError, bool>> confirmEmail(
      String email, String confirmationCode);
}
