import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'resend_confirmation_code_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late IResendConfirmationCodeUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();
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
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase(email);
    expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
  });
}
