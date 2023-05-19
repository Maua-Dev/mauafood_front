import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/register_user_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/user_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_user_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late IRegisterUserUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();
  UserModel user = const UserModel(
    id: '',
    fullName: 'fullName',
    cpf: 'cpf',
    isStudent: true,
    email: 'email',
    password: 'password',
    appNotifications: true,
    emailNotifications: true,
    acceptTerms: true,
  );

  setUp(() {
    useCase = RegisterUserUsecase(repository: repository);
  });

  test('[TEST] - register returns success bool', () async {
    when(repository.registerUser(user)).thenAnswer(
      (realInvocation) async => const Right(true),
    );
    var result = await useCase(
        user.fullName,
        user.cpf,
        user.isStudent,
        user.email,
        user.password,
        user.emailNotifications,
        user.appNotifications,
        user.acceptTerms);
    expect(result.fold(id, id), isA<bool>());
  });

  test('[TEST] - register returns error', () async {
    when(repository.registerUser(user)).thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase(
        user.fullName,
        user.cpf,
        user.isStudent,
        user.email,
        user.password,
        user.emailNotifications,
        user.appNotifications,
        user.acceptTerms);
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
