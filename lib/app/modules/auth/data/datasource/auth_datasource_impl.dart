import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/infra/datasources/auth_datasouce_interface.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

import '../../domain/errors/auth_errors.dart';

class AuthDatasourceImpl extends AuthDatasourceInterface {
  @override
  Future<Either<SignUpError, CognitoAuthSession>> postLoginUser(
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
      return right(result);
    } on SignedOutException {
      return left(SignUpError(message: 'E-mail ou senha incorretos.'));
    } on NotAuthorizedException {
      return left(SignUpError(message: 'E-mail ou senha incorretos.'));
    } on UserNotConfirmedException {
      return left(SignUpError(message: 'E-mail não confirmado, confirme-o.'));
    } on UserNotFoundException {
      return left(SignUpError(
          message: 'E-mail ou senha incorretos ou e-mail não cadastrado.'));
    } catch (e) {
      return left(
          SignUpError(message: 'Algo deu errado, tente novamente mais tarde.'));
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
      return left(RegisterError(
          message:
              'Ocorreu algum erro ao tentar cadastrar, tente novamente mais tarde.'));
    }
  }

  @override
  Future<Either<ConfirmationEmailError, bool>> postEmailConfirmation(
      String email, String confirmationCode) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );
      return right(res.isSignUpComplete);
    } on TooManyFailedAttemptsException {
      return left(ConfirmationEmailError(
        message:
            'Parece que você tentou errou o código muitas vezes, entre em contato.',
        email: email,
      ));
    } on UserNotFoundException {
      return left(ConfirmationEmailError(
        message: 'Não encontramos um e-mail cadastrado para $email',
        email: email,
      ));
    } on InternalErrorException {
      return left(ConfirmationEmailError(
        message: 'Estamos com problemas internos, tente mais tarde.',
        email: email,
      ));
    } on CodeMismatchException {
      return left(ConfirmationEmailError(
        message: 'Código fornecido está errado, tente novamente.',
        email: email,
      ));
    } catch (e) {
      throw ConfirmationEmailError(
          message: 'Ocorreu algum erro ao confirmar e-mail.', email: email);
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
