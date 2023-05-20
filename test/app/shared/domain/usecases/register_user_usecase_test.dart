import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/domain/entities/user.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/register_user_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/user_model.dart';
import 'package:mockito/mockito.dart';

class AuthRepositoryMockSuccess extends Mock implements IAuthRepository {
  @override
  Future<Either<AuthErrors, User>> registerUser(UserModel user) async {
    return right(const UserModel(
      id: '',
      fullName: '',
      cpf: '',
      isStudent: false,
      email: '',
      password: '',
      appNotifications: false,
      emailNotifications: false,
      acceptTerms: false,
    ));
  }
}

class AuthRepositoryMockFailed extends Mock implements IAuthRepository {
  @override
  Future<Either<AuthErrors, User>> registerUser(UserModel user) async {
    return left(AuthErrors(message: ''));
  }
}

void main() {
  late IRegisterUserUsecase usecase;
  IAuthRepository repositorySuccess = AuthRepositoryMockSuccess();
  IAuthRepository repositoryFailed = AuthRepositoryMockFailed();

  test('[TEST] - register returns success user', () async {
    usecase = RegisterUserUsecase(repository: repositorySuccess);
    var result = await usecase('', '', false, '', '', false, false, false);
    expect(result.fold(id, id), isA<User>());
  });

  test('[TEST] - register returns error', () async {
    usecase = RegisterUserUsecase(repository: repositoryFailed);
    var result = await usecase('', '', false, '', '', false, false, false);
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
