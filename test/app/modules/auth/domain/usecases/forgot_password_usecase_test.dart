import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forgot_password_usecase_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late IForgotPasswordUsecase useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();
  String email = '';

  setUp(() {
    useCase = ForgotPasswordUsecase(repository: repository);
  });

  test('[TEST] - forgot password returns success bool', () async {
    when(repository.forgotPassword(email)).thenAnswer(
      (realInvocation) async => const Right(true),
    );
    var result = await useCase(email);
    expect(result.fold(id, id), isA<void>());
  });

  test('[TEST] - forgot password returns error', () async {
    when(repository.forgotPassword(email)).thenAnswer(
      (realInvocation) async => Left(ForgotPasswordError(message: '')),
    );
    var result = await useCase(email);
    expect(result.fold(id, id), isA<ForgotPasswordError>());
  });
}
