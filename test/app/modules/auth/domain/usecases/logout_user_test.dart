import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_user_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late LogoutUserInterface useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();

  setUp(() {
    useCase = LogoutUserImpl(repository: repository);
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
      (realInvocation) async => Left(LogoutError(message: '')),
    );
    var result = await useCase();
    expect(result.fold((l) => l, (r) => null), isA<LogoutError>());
  });
}
