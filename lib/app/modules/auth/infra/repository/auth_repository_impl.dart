import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/errors/auth_errors.dart';
import '../../domain/infra/auth_repository_interface.dart';
import '../datasources/auth_datasouce_interface.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final AuthDatasourceInterface datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<SignInError, bool>> loginUser(
      String email, String password) async {
    bool result;
    try {
      result = await datasource.postLoginUser(email, password);
    } catch (e) {
      return left(SignInError(message: 'Erro ao tentar autenticar.'));
    }

    if (result) {
      return right(result);
    }
    return left(
        SignInError(message: 'E-mail ou senha incorretos ou inexistentes.'));
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
}
