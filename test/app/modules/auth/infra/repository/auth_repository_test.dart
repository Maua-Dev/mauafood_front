import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/auth/auth_module.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/auth_datasouce_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/user_model.dart';
import 'package:mauafood_front/app/shared/infra/repositories/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([IAuthDatasource])
void main() {
  initModules([AppModule(), AuthModule()]);
  IAuthDatasource datasource = MockIAuthDatasource();
  late IAuthRepository repository;
  String email = '';
  String password = '';
  String confirmationCode = '';
  String newPassword = '';
  UserModel user = const UserModel(
    id: '',
    fullName: 'fullName',
    cpf: 'cpf',
    isStudent: true,
    email: 'email',
    password: 'password',
    appNotifications: true,
    emailNotifications: true,
    acceptTerms: true,
  );

  setUp(() {
    repository = AuthRepository(datasource: datasource);
  });

  group('[TEST] - loginUser', () {
    test('returns success CognitoAuthSession', () async {
      when(datasource.postLoginUser(email, password)).thenAnswer(
          (realInvocation) async =>
              Right(CognitoAuthSession(isSignedIn: true)));
      var result = await repository.loginUser(email, password);
      expect(result.fold(id, id), isA<CognitoAuthSession>());
    });

    test('returns error', () async {
      when(datasource.postLoginUser(email, password))
          .thenAnswer((realInvocation) async => Left(SignUpError(message: '')));
      var result = await repository.loginUser(email, password);
      expect(result.fold(id, id), isA<SignUpError>());
    });
  });

  group('[TEST] - registerUser', () {
    test('returns success bool', () async {
      when(datasource.postRegisterUser(user))
          .thenAnswer((realInvocation) async => const Right(true));
      var result = await repository.registerUser(user);
      expect(result.fold(id, id), isA<bool>());
    });

    test('returns error', () async {
      when(datasource.postRegisterUser(user)).thenAnswer(
          (realInvocation) async => Left(RegisterError(message: '')));
      var result = await repository.registerUser(user);
      expect(result.fold(id, id), isA<RegisterError>());
    });
  });

  group('[TEST] - confirmEmail', () {
    test('returns success bool', () async {
      when(datasource.postEmailConfirmation(email, confirmationCode))
          .thenAnswer((realInvocation) async => const Right(true));
      var result = await repository.confirmEmail(email, confirmationCode);
      expect(result.fold(id, id), isA<bool>());
    });

    test('returns error', () async {
      when(datasource.postEmailConfirmation(email, confirmationCode))
          .thenAnswer((realInvocation) async =>
              Left(ConfirmationEmailError(message: '', email: email)));
      var result = await repository.confirmEmail(email, confirmationCode);
      expect(result.fold(id, id), isA<ConfirmationEmailError>());
    });
  });

  group('[TEST] - logoutUser', () {
    test('returns success void', () async {
      when(datasource.postLogout())
          .thenAnswer((realInvocation) async => const Right(null));
      var result = await repository.logoutUser();
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.postLogout())
          .thenAnswer((realInvocation) async => Left(LogoutError(message: '')));
      var result = await repository.logoutUser();
      expect(result.fold((l) => l, (r) => null), isA<LogoutError>());
    });
  });

  group('[TEST] - forgotPassword', () {
    test('returns success bool', () async {
      when(datasource.postForgotPassword(email))
          .thenAnswer((realInvocation) async => const Right(true));
      var result = await repository.forgotPassword(email);
      expect(result.fold(id, id), isA<bool>());
    });

    test('returns error', () async {
      when(datasource.postForgotPassword(email)).thenAnswer(
          (realInvocation) async => Left(ForgotPasswordError(message: '')));
      var result = await repository.forgotPassword(email);
      expect(result.fold(id, id), isA<ForgotPasswordError>());
    });
  });

  group('[TEST] - confirmResetPassword', () {
    test('returns success void', () async {
      when(datasource.postConfirmResetPassword(
              email, newPassword, confirmationCode))
          .thenAnswer((realInvocation) async => const Right(null));
      var result = await repository.confirmResetPassword(
          email, newPassword, confirmationCode);
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.postConfirmResetPassword(
              email, newPassword, confirmationCode))
          .thenAnswer(
              (realInvocation) async => Left(ForgotPasswordError(message: '')));
      var result = await repository.confirmResetPassword(
          email, newPassword, confirmationCode);
      expect(result.fold((l) => l, (r) => null), isA<ForgotPasswordError>());
    });
  });

  group('[TEST] - postResendCode', () {
    test('returns success void', () async {
      when(datasource.postResendCode(email))
          .thenAnswer((realInvocation) async => const Right(null));
      var result = await repository.postResendCode(email);
      expect(result.fold((l) => l, (r) => null), isA<void>());
    });

    test('returns error', () async {
      when(datasource.postResendCode(email)).thenAnswer(
          (realInvocation) async => Left(ResendCodeError(message: '')));
      var result = await repository.postResendCode(email);
      expect(result.fold((l) => l, (r) => null), isA<ResendCodeError>());
    });
  });
}
