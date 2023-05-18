import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/register_user_usecase.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_user_usecase_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late IRegisterUserUsecase useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();
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
      (realInvocation) async => Left(RegisterError(message: '')),
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
    expect(result.fold(id, id), isA<RegisterError>());
  });
}