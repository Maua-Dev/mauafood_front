import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_repository_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/login_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface])
void main() {
  late LoginUserInterface useCase;
  AuthRepositoryInterface repository = MockAuthRepositoryInterface();
  String email = '';
  String password = '';

  setUp(() {
    useCase = LoginUserImpl(repository: repository);
  });

  test('[TEST] - login returns success CognitoAuthSession', () async {
    when(repository.loginUser(email, password)).thenAnswer(
      (realInvocation) async => Right(CognitoAuthSession(isSignedIn: true)),
    );
    var result = await useCase(email, password);
    expect(result.fold(id, id), isA<CognitoAuthSession>());
  });

  test('[TEST] - login returns error', () async {
    when(repository.loginUser(email, password)).thenAnswer(
      (realInvocation) async => Left(SignUpError(message: '')),
    );
    var result = await useCase(email, password);
    expect(result.fold(id, id), isA<SignUpError>());
  });
}
