import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/infra/datasources/auth_datasouce_interface.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

import '../../domain/errors/auth_errors.dart';

class AuthDatasourceImpl extends AuthDatasourceInterface {
  @override
  Future<CognitoAuthSession> postLoginUser(
      String email, String password) async {
    try {
      late CognitoAuthSession result;
      await Amplify.Auth.signOut();
      await Amplify.Auth.signIn(
        username: email,
        password: password,
      ).whenComplete(() async {
        result = await Amplify.Auth.fetchAuthSession(
                options: CognitoSessionOptions(getAWSCredentials: true))
            as CognitoAuthSession;
      });
      return result;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Either<RegisterError, bool>> postRegisterUser(UserModel user) async {
    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: user.email,
      CognitoUserAttributeKey.name: user.fullName,
      const CognitoUserAttributeKey.custom('cpf'): user.cpf,
      CognitoUserAttributeKey.updatedAt:
          DateTime.now().millisecondsSinceEpoch.toString(),
      const CognitoUserAttributeKey.custom('isStudent'):
          user.isStudent.toString(),
      const CognitoUserAttributeKey.custom('appNotifications'):
          user.appNotifications.toString(),
      const CognitoUserAttributeKey.custom('emailNotifications'):
          user.emailNotifications.toString(),
      const CognitoUserAttributeKey.custom('acceptTerms'):
          user.acceptTerms.toString(),
    };
    try {
      SignUpResult res = await Amplify.Auth.signUp(
          username: user.email,
          password: user.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      return right(res.isSignUpComplete);
    } on UsernameExistsException {
      return left(
          RegisterError(message: 'Já existe um cadastro com este e-mail.'));
    } on InvalidParameterException {
      return left(
          RegisterError(message: 'Algum campo preenchido de forma errada.'));
    } on InternalErrorException {
      return left(RegisterError(
          message: 'Estamos com problemas internos, tente mais tarde.'));
    } catch (e) {
      throw RegisterError(message: 'Ocorreu algum erro ao tentar cadastrar.');
    }
  }

  @override
  Future<bool> postEmailConfirmation(
      String email, String confirmationCode) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );
      return res.isSignUpComplete;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> postLogout() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> postForgotPassword(String email) async {
    try {
      var result = await Amplify.Auth.resetPassword(
        username: email,
      );
      return result.isPasswordReset;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> postConfirmResetPassword(
      String email, String newPassword, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: newPassword,
        confirmationCode: confirmationCode,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
