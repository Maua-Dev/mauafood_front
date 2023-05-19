import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import '../../infra/models/user_model.dart';
import '../../helpers/errors/auth_errors.dart';

abstract class IAuthRepository {
  Future<Either<RegisterError, bool>> registerUser(UserModel user);
  Future<Either<SignUpError, CognitoAuthSession>> loginUser(
      String email, String password);
  Future<Either<ConfirmationEmailError, bool>> confirmEmail(
      String email, String confirmationCode);
  Future<Either<LogoutError, void>> logoutUser();
  Future<Either<ForgotPasswordError, bool>> forgotPassword(String email);
  Future<Either<ForgotPasswordError, void>> confirmResetPassword(
      String email, String newPassword, String confirmationCode);
  Future<Either<ResendCodeError, void>> postResendCode(String email);
  Future<Either<GetUserAttributesError, List<AuthUserAttribute>>>
      getUserAttributes();
}
