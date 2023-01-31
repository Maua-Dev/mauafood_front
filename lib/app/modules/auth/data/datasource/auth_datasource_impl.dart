import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/auth/infra/datasources/auth_datasouce_interface.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:mauafood_front/generated/l10n.dart';

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
    } on LimitExceededException {
      return left(SignUpError(
        message: S.current.loginErrorsSchema('limitExceeded'),
      ));
    } on SignedOutException {
      return left(
          SignUpError(message: S.current.loginErrorsSchema('signedOut')));
    } on NotAuthorizedException {
      return left(
          SignUpError(message: S.current.loginErrorsSchema('notAuthorized')));
    } on UserNotConfirmedException {
      return left(SignUpError(
          message: S.current.loginErrorsSchema('userNotConfirmed')));
    } on UserNotFoundException {
      return left(
          SignUpError(message: S.current.loginErrorsSchema('userNotFound')));
    } catch (e) {
      return left(SignUpError(message: S.current.loginErrorsSchema('other')));
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
    } on LimitExceededException {
      return left(RegisterError(
        message: S.current.registerErrorsSchema('limitExceeded'),
      ));
    } on UsernameExistsException {
      return left(RegisterError(
          message: S.current.registerErrorsSchema('usernameExists')));
    } on InvalidParameterException {
      return left(RegisterError(
          message: S.current.registerErrorsSchema('invalidParameter')));
    } on InternalErrorException {
      return left(RegisterError(
          message: S.current.registerErrorsSchema('internalError')));
    } catch (e) {
      return left(
          RegisterError(message: S.current.registerErrorsSchema('other')));
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
    } on InvalidParameterException {
      return left(ConfirmationEmailError(
        message: S.current.emailConfirmationErrorsSchema('invalidParameter'),
        email: email,
      ));
    } on LimitExceededException {
      return left(ConfirmationEmailError(
        message: S.current.emailConfirmationErrorsSchema('limitExceeded'),
        email: email,
      ));
    } on TooManyFailedAttemptsException {
      return left(ConfirmationEmailError(
        message:
            S.current.emailConfirmationErrorsSchema('tooManyFailedAttempts'),
        email: email,
      ));
    } on UserNotFoundException {
      return left(ConfirmationEmailError(
        message: S.current.emailConfirmationErrorsSchema('userNotFound'),
        email: email,
      ));
    } on InternalErrorException {
      return left(ConfirmationEmailError(
        message: S.current.emailConfirmationErrorsSchema('internalError'),
        email: email,
      ));
    } on CodeMismatchException {
      return left(ConfirmationEmailError(
        message: S.current.emailConfirmationErrorsSchema('codeMismatch'),
        email: email,
      ));
    } catch (e) {
      throw ConfirmationEmailError(
        message: S.current.emailConfirmationErrorsSchema('other'),
        email: email,
      );
    }
  }

  @override
  Future<Either<LogoutError, void>> postLogout() async {
    try {
      await Amplify.Auth.signOut();
      return const Right(null);
    } on LimitExceededException {
      return left(LogoutError(
        message: S.current.logoutErrorsSchema('limitExceeded'),
      ));
    } on InternalErrorException {
      return left(LogoutError(
        message: S.current.logoutErrorsSchema('internalError'),
      ));
    } catch (e) {
      return left(LogoutError(
        message: S.current.logoutErrorsSchema('other'),
      ));
    }
  }

  @override
  Future<Either<ForgotPasswordError, bool>> postForgotPassword(
      String email) async {
    try {
      var result = await Amplify.Auth.resetPassword(
        username: email,
      );
      return right(result.isPasswordReset);
    } on LimitExceededException {
      return left(ForgotPasswordError(
        message: S.current.forgotPasswordErrorsSchema('limitExceeded'),
      ));
    } on UserNotConfirmedException {
      return left(ForgotPasswordError(
        message: S.current.forgotPasswordErrorsSchema('userNotConfirmed'),
      ));
    } on UserNotFoundException {
      return left(ForgotPasswordError(
        message: S.current.forgotPasswordErrorsSchema('userNotFound'),
      ));
    } on InvalidParameterException {
      return left(ForgotPasswordError(
        message: S.current.forgotPasswordErrorsSchema('invalidParameter'),
      ));
    } on InternalErrorException {
      return left(ForgotPasswordError(
        message: S.current.forgotPasswordErrorsSchema('internalError'),
      ));
    } catch (e) {
      return left(ForgotPasswordError(
        message: S.current.forgotPasswordErrorsSchema('other'),
      ));
    }
  }

  @override
  Future<Either<ForgotPasswordError, void>> postConfirmResetPassword(
      String email, String newPassword, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: newPassword,
        confirmationCode: confirmationCode,
      );
      return const Right(null);
    } on LimitExceededException {
      return left(ForgotPasswordError(
        message: S.current.confirmResetPasswordErrorsSchema('limitExceeded'),
      ));
    } on CodeMismatchException {
      return left(ForgotPasswordError(
        message: S.current.confirmResetPasswordErrorsSchema('codeMismatch'),
      ));
    } on UserNotConfirmedException {
      return left(ForgotPasswordError(
        message: S.current.confirmResetPasswordErrorsSchema('userNotConfirmed'),
      ));
    } on InternalErrorException {
      return left(ForgotPasswordError(
        message: S.current.confirmResetPasswordErrorsSchema('internalError'),
      ));
    } catch (e) {
      return left(ForgotPasswordError(
        message: S.current.confirmResetPasswordErrorsSchema('other'),
      ));
    }
  }

  @override
  Future<Either<ResendCodeError, void>> postResendCode(String email) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: email);
      return const Right(null);
    } on InvalidParameterException {
      return left(ResendCodeError(
        message: S.current.resendCodeErrorsSchema('invalidParameter'),
      ));
    } on UserNotFoundException {
      return left(ResendCodeError(
        message: S.current.resendCodeErrorsSchema('userNotFound'),
      ));
    } on LimitExceededException {
      return left(ResendCodeError(
        message: S.current.resendCodeErrorsSchema('limitExceeded'),
      ));
    } on InternalErrorException {
      return left(ResendCodeError(
        message: S.current.resendCodeErrorsSchema('internalError'),
      ));
    } on CodeDeliveryFailureException {
      return left(ResendCodeError(
        message: S.current.resendCodeErrorsSchema('codeDeliveryFailure'),
      ));
    } catch (e) {
      return left(ResendCodeError(
        message: S.current.resendCodeErrorsSchema('other'),
      ));
    }
  }

  @override
  Future<Either<GetUserAttributesError, List<AuthUserAttribute>>>
      getUserAttributes() async {
    try {
      late List<AuthUserAttribute> result;
      result = await Amplify.Auth.fetchUserAttributes();
      return right(result);
    } on LimitExceededException {
      return left(GetUserAttributesError(
        message: S.current.getUserAtribbutesErrorsSchema('limitExceeded'),
      ));
    } on SignedOutException {
      return left(GetUserAttributesError(
          message: S.current.getUserAtribbutesErrorsSchema('signedOut')));
    } on NotAuthorizedException {
      return left(GetUserAttributesError(
          message: S.current.getUserAtribbutesErrorsSchema('notAuthorized')));
    } on UserNotConfirmedException {
      return left(GetUserAttributesError(
          message:
              S.current.getUserAtribbutesErrorsSchema('userNotConfirmed')));
    } on UserNotFoundException {
      return left(GetUserAttributesError(
          message: S.current.getUserAtribbutesErrorsSchema('userNotFound')));
    } catch (e) {
      return left(GetUserAttributesError(
          message: S.current.getUserAtribbutesErrorsSchema('other')));
    }
  }
}
