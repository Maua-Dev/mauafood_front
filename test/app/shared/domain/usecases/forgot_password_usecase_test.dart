import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/forgot_password_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forgot_password_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late IForgotPasswordUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();
  String email = '';

  setUp(() {
    useCase = ForgotPasswordUsecase(repository: repository);
  });

  test('[TEST] - forgot password returns success bool', () async {
    when(repository.forgotPassword(email)).thenAnswer(
      (realInvocation) async => const Right(null),
    );
    var result = await useCase(email);
    expect(result.fold((l) => l, (r) => null), isA<void>());
  });

  test('[TEST] - forgot password returns error', () async {
    when(repository.forgotPassword(email)).thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase(email);
    expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
  });
}
