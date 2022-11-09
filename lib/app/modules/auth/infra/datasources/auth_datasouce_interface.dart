import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

import '../../domain/errors/auth_errors.dart';

abstract class AuthDatasourceInterface {
  Future<CognitoAuthSession> postLoginUser(String email, String password);
  Future<Either<RegisterError, bool>> postRegisterUser(UserModel user);
  Future<bool> postEmailConfirmation(String email, String confirmationCode);
  Future<void> postLogout();
  Future<bool> postForgotPassword(String email);
  Future<void> postConfirmResetPassword(
      String email, String newPassword, String confirmationCode);
}
