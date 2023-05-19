import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../../helpers/errors/auth_errors.dart';

abstract class IAuthRepository {
  Future<Either<AuthErrors, bool>> registerUser(UserModel user);
  Future<Either<AuthErrors, CognitoAuthSession>> loginUser(
      String email, String password);
  Future<Either<AuthErrors, bool>> confirmEmail(
      String email, String confirmationCode);
  Future<Either<AuthErrors, void>> logoutUser();
  Future<Either<AuthErrors, bool>> forgotPassword(String email);
  Future<Either<AuthErrors, void>> confirmResetPassword(
      String email, String newPassword, String confirmationCode);
  Future<Either<AuthErrors, void>> postResendCode(String email);
  Future<Either<AuthErrors, List<AuthUserAttribute>>> getUserAttributes();
}
