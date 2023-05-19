import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:mauafood_front/app/shared/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/errors/auth_errors.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../external/http/auth_datasouce_interface.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final AuthDatasourceInterface datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<SignUpError, CognitoAuthSession>> loginUser(
      String email, String password) async {
    var result = await datasource.postLoginUser(email, password);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<RegisterError, bool>> registerUser(UserModel user) async {
    var result = await datasource.postRegisterUser(user);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<ConfirmationEmailError, bool>> confirmEmail(
      String email, String confirmationCode) async {
    var result =
        await datasource.postEmailConfirmation(email, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<LogoutError, void>> logoutUser() async {
    var result = await datasource.postLogout();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<ForgotPasswordError, bool>> forgotPassword(String email) async {
    var result = await datasource.postForgotPassword(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<ForgotPasswordError, void>> confirmResetPassword(
      String email, String newPassword, String confirmationCode) async {
    var result = await datasource.postConfirmResetPassword(
        email, newPassword, confirmationCode);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<ResendCodeError, void>> postResendCode(String email) async {
    var result = await datasource.postResendCode(email);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }

  @override
  Future<Either<GetUserAttributesError, List<AuthUserAttribute>>>
      getUserAttributes() async {
    var result = await datasource.getUserAttributes();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
