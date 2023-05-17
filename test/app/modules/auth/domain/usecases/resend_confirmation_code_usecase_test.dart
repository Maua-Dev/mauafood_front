import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'resend_confirmation_code_usecase_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late IResendConfirmationCodeUsecase useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();
  String email = '';

  setUp(() {
    useCase = ResendConfirmationCodeUsecase(repository: repository);
  });

  test('[TEST] - resend confirmation code returns success void', () async {
    when(repository.postResendCode(email)).thenAnswer(
      (realInvocation) async => const Right(null),
    );
    var result = await useCase(email);
    expect(result.fold((l) => l, (r) => null), isA<void>());
  });

  test('[TEST] - resend confirmation code returns error', () async {
    when(repository.postResendCode(email)).thenAnswer(
      (realInvocation) async => Left(ResendCodeError(message: '')),
    );
    var result = await useCase(email);
    expect(result.fold((l) => l, (r) => null), isA<ResendCodeError>());
  });
}
