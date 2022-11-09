import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/errors/auth_errors.dart';
import '../../domain/infra/auth_repository_interface.dart';
import '../datasources/auth_datasouce_interface.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final AuthDatasourceInterface datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<SignUpError, CognitoAuthSession>> loginUser(
      String email, String password) async {
    CognitoAuthSession result;
    try {
      result = await datasource.postLoginUser(email, password);
    } catch (e) {
      return left(SignUpError(
          message:
              'E-mail ou senha incorretos, inexistentes ou e-mail não confirmado.'));
    }

    return right(result);
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
    bool result;
    try {
      result = await datasource.postEmailConfirmation(email, confirmationCode);
    } catch (e) {
      return left(ConfirmationEmailError(
          message: 'Código errado ou e-mail não existente.', email: email));
    }

    return right(result);
  }

  @override
  Future<Either<LogoutError, void>> logoutUser() async {
    try {
      await datasource.postLogout();
    } catch (e) {
      return left(LogoutError(message: 'Erro ao fazer logout.'));
    }
    return const Right(null);
  }

  @override
  Future<Either<ForgotPasswordError, bool>> forgotPassword(String email) async {
    bool result;
    try {
      result = await datasource.postForgotPassword(email);
    } catch (e) {
      return left(ForgotPasswordError(
          message: 'Usuário não existe ou não confirmou e-mail.'));
    }
    return Right(result);
  }

  @override
  Future<Either<ForgotPasswordError, void>> confirmResetPassword(
      String email, String newPassword, String confirmationCode) async {
    try {
      await datasource.postConfirmResetPassword(
          email, newPassword, confirmationCode);
    } catch (e) {
      return left(ForgotPasswordError(message: 'Erro ao redefinir senha.'));
    }
    return const Right(null);
  }
}
