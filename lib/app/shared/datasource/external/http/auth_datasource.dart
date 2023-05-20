import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/entities/user.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/auth_datasouce_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/user_model.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../helpers/errors/auth_errors.dart';

class AuthDatasource extends IAuthDatasource {
  @override
  Future<Either<AuthErrors, CognitoAuthSession>> postLoginUser(
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
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, User>> postRegisterUser(UserModel user) async {
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
      await Amplify.Auth.signUp(
          username: user.email,
          password: user.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      return right(user);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, void>> postEmailConfirmation(
      String email, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );
      return right(null);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, void>> postLogout() async {
    try {
      await Amplify.Auth.signOut();
      return const Right(null);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, bool>> postForgotPassword(String email) async {
    try {
      var result = await Amplify.Auth.resetPassword(
        username: email,
      );
      return right(result.isPasswordReset);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, void>> postConfirmResetPassword(
      String email, String newPassword, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: newPassword,
        confirmationCode: confirmationCode,
      );
      return const Right(null);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, void>> postResendCode(String email) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: email);
      return const Right(null);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<AuthErrors, List<AuthUserAttribute>>>
      getUserAttributes() async {
    try {
      late List<AuthUserAttribute> result;
      result = await Amplify.Auth.fetchUserAttributes();
      return right(result);
    } catch (e) {
      return left(_handleError(e));
    }
  }

  AuthErrors _handleError(e) {
    if (e is InvalidParameterException) {
      return AuthErrors(
          message: S.current.authErrorsSchema('invalidParameter'));
    } else if (e is LimitExceededException) {
      return AuthErrors(message: S.current.authErrorsSchema('limitExceeded'));
    } else if (e is TooManyFailedAttemptsException) {
      return AuthErrors(
          message: S.current.authErrorsSchema('tooManyFailedAttempts'));
    } else if (e is UserNotFoundException) {
      return AuthErrors(message: S.current.authErrorsSchema('userNotFound'));
    } else if (e is InternalErrorException) {
      return AuthErrors(message: S.current.authErrorsSchema('internalError'));
    } else if (e is CodeMismatchException) {
      return AuthErrors(message: S.current.authErrorsSchema('codeMismatch'));
    } else if (e is SignedOutException) {
      return AuthErrors(message: S.current.authErrorsSchema('signedOut'));
    } else if (e is NotAuthorizedException) {
      return AuthErrors(message: S.current.authErrorsSchema('notAuthorized'));
    } else if (e is UserNotConfirmedException) {
      return AuthErrors(
          message: S.current.authErrorsSchema('userNotConfirmed'));
    } else if (e is UsernameExistsException) {
      return AuthErrors(message: S.current.authErrorsSchema('usernameExists'));
    } else if (e is InvalidParameterException) {
      return AuthErrors(
          message: S.current.authErrorsSchema('invalidParameter'));
    } else if (e is CodeMismatchException) {
      return AuthErrors(message: S.current.authErrorsSchema('codeMismatch'));
    } else if (e is CodeDeliveryFailureException) {
      return AuthErrors(
          message: S.current.authErrorsSchema('codeDeliveryFailure'));
    }
    return AuthErrors(
      message: S.current.authErrorsSchema('other'),
    );
  }
}
