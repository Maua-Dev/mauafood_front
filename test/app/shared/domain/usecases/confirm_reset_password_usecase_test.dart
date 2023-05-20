import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/confirm_reset_password_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'confirm_reset_password_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late IConfirmResetPasswordUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();
  String email = '';
  String confirmationCode = '';
  String newPassword = '';

  setUp(() {
    useCase = ConfirmResetPasswordUsecase(repository: repository);
  });

  test('[TEST] - confirm reset password returns success void', () async {
    when(repository.confirmResetPassword(email, newPassword, confirmationCode))
        .thenAnswer(
      (realInvocation) async => const Right(null),
    );
    var result = await useCase(email, newPassword, confirmationCode);
    expect(result.fold((l) => l, (r) => null), isA<void>());
  });

  test('[TEST] - confirm reset password returns error', () async {
    when(repository.confirmResetPassword(email, newPassword, confirmationCode))
        .thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase(email, newPassword, confirmationCode);
    expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
  });
}
