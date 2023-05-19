import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/infra/models/user_model.dart';

import '../../../../helpers/errors/auth_errors.dart';

abstract class IAuthDatasource {
  Future<Either<AuthErrors, CognitoAuthSession>> postLoginUser(
      String email, String password);
  Future<Either<AuthErrors, bool>> postRegisterUser(UserModel user);
  Future<Either<AuthErrors, bool>> postEmailConfirmation(
      String email, String confirmationCode);
  Future<Either<AuthErrors, void>> postLogout();
  Future<Either<AuthErrors, bool>> postForgotPassword(String email);
  Future<Either<AuthErrors, void>> postConfirmResetPassword(
      String email, String newPassword, String confirmationCode);
  Future<Either<AuthErrors, void>> postResendCode(String email);
  Future<Either<AuthErrors, List<AuthUserAttribute>>> getUserAttributes();
}
