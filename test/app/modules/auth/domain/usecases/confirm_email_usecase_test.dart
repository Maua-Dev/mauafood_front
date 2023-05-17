import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_email_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'confirm_email_usecase_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late IConfirmEmailUsecase useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();
  String email = '';
  String confirmationCode = '';

  setUp(() {
    useCase = ConfirmEmailUsecase(repository: repository);
  });

  test('[TEST] - confirm email returns success bool', () async {
    when(repository.confirmEmail(email, confirmationCode)).thenAnswer(
      (realInvocation) async => const Right(true),
    );
    var result = await useCase(email, confirmationCode);
    expect(result.fold(id, id), isA<bool>());
  });

  test('[TEST] - confirm email returns error', () async {
    when(repository.confirmEmail(email, confirmationCode)).thenAnswer(
      (realInvocation) async =>
          Left(ConfirmationEmailError(email: email, message: '')),
    );
    var result = await useCase(email, confirmationCode);
    expect(result.fold(id, id), isA<ConfirmationEmailError>());
  });
}
