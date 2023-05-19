import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/confirm_email_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'confirm_email_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late IConfirmEmailUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();
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
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase(email, confirmationCode);
    expect(result.fold(id, id), isA<AuthErrors>());
  });
}
