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
      return left(
          SignUpError(message: 'E-mail ou senha incorretos ou inexistentes.'));
    }

    return right(result);
  }

  @override
  Future<Either<RegisterError, bool>> registerUser(UserModel user) async {
    bool result;
    try {
      result = await datasource.postRegisterUser(user);
    } catch (e) {
      return left(
          RegisterError(message: 'Ocorreu algum erro ao tentar registro'));
    }

    if (result) {
      return right(result);
    }
    return left(
        RegisterError(message: 'Ocorreu algum erro ao tentar registro.'));
  }

  @override
  Future<Either<ConfirmationEmailError, bool>> confirmEmail(
      String email, String confirmationCode) async {
    bool result;
    try {
      result = await datasource.postEmailConfirmation(email, confirmationCode);
    } catch (e) {
      return left(ConfirmationEmailError(
          message: 'Ocorreu algum erro ao confirmar email: $email.',
          email: email));
    }

    if (result) {
      return right(result);
    }
    return left(ConfirmationEmailError(
        message: 'Ocorreu algum erro ao confirmar email: $email.',
        email: email));
  }
}
