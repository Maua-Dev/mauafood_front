import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/logout_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_user_usecase_test.mocks.dart';

@GenerateMocks([IAuthRepository])
void main() {
  late ILogoutUserUsecase useCase;
  IAuthRepository repository = MockIAuthRepository();

  setUp(() {
    useCase = LogoutUserUsecase(repository: repository);
  });

  test('[TEST] - logout user returns success void', () async {
    when(repository.logoutUser()).thenAnswer(
      (realInvocation) async => const Right(null),
    );
    var result = await useCase();
    expect(result.fold((l) => l, (r) => null), isA<void>());
  });

  test('[TEST] - logout user returns error', () async {
    when(repository.logoutUser()).thenAnswer(
      (realInvocation) async => Left(AuthErrors(message: '')),
    );
    var result = await useCase();
    expect(result.fold((l) => l, (r) => null), isA<AuthErrors>());
  });
}
