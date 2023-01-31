import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

import '../../domain/errors/auth_errors.dart';

abstract class AuthDatasourceInterface {
  Future<Either<SignUpError, CognitoAuthSession>> postLoginUser(
      String email, String password);
  Future<Either<RegisterError, bool>> postRegisterUser(UserModel user);
  Future<Either<ConfirmationEmailError, bool>> postEmailConfirmation(
      String email, String confirmationCode);
  Future<Either<LogoutError, void>> postLogout();
  Future<Either<ForgotPasswordError, bool>> postForgotPassword(String email);
  Future<Either<ForgotPasswordError, void>> postConfirmResetPassword(
      String email, String newPassword, String confirmationCode);
  Future<Either<ResendCodeError, void>> postResendCode(String email);
  Future<Either<GetUserAttributesError, List<AuthUserAttribute>>>
      getUserAttributes();
}
