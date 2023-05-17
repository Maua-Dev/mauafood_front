import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_reset_password_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'confirm_reset_password_usecase_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late IConfirmResetPasswordUsecase useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();
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
      (realInvocation) async => Left(ForgotPasswordError(message: '')),
    );
    var result = await useCase(email, newPassword, confirmationCode);
    expect(result.fold((l) => l, (r) => null), isA<ForgotPasswordError>());
  });
}
