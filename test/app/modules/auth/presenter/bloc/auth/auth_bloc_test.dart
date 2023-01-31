import 'dart:collection';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/auth/auth_module.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_reset_password.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/forgot_password.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/get_user_attributes.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/login_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';
import 'package:mauafood_front/app/shared/infra/user_roles_enum.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([
  LoginUserInterface,
  LogoutUserInterface,
  ForgotPasswordInterface,
  ConfirmResetPasswordInterface,
  AuthStorageInterface,
  GetUserAttributesInterface,
])
void main() {
  initModules([AppModule(), AuthModule()]);
  LoginUserInterface login = MockLoginUserInterface();
  LogoutUserInterface logout = MockLogoutUserInterface();
  ForgotPasswordInterface forgotPassword = MockForgotPasswordInterface();
  ConfirmResetPasswordInterface confirmResetPassword =
      MockConfirmResetPasswordInterface();
  GetUserAttributesInterface getUserAttributes =
      MockGetUserAttributesInterface();
  AuthStorageInterface storage = MockAuthStorageInterface();
  late AuthBloc bloc;
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    bloc = AuthBloc(
        login: login,
        logout: logout,
        confirmResetPassword: confirmResetPassword,
        forgotPassword: forgotPassword,
        storage: storage,
        getUserAttributes: getUserAttributes);
  });

  String email = 'gabriel.godoybz@hotmail.com';
  String password = 'Teste01@';
  String newPassword = 'Teste01@';
  String confirmationCode = '123';
  LinkedHashMap map = LinkedHashMap.of(
      {'refreshToken': '123', 'accessToken': '123', 'idToken': '123'});

  group('[TEST] - LoginWithEmail', () {
    var error = SignUpError(message: '');
    var errorGetUser = GetUserAttributesError(message: '');
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(login(email, password))
            .thenAnswer((realInvocation) async => Right(CognitoAuthSession(
                isSignedIn: true,
                credentials: AWSCredentials.init(creds: {
                  'awsAccessKey': '123',
                  'awsSecretKey': '123',
                  'sessionToken': '123',
                }),
                identityId: '123',
                userSub: '123',
                userPoolTokens: AWSCognitoUserPoolTokens.init(tokens: map))));
        when(getUserAttributes())
            .thenAnswer((realInvocation) async => Left(errorGetUser));
        bloc.add(LoginWithEmail(email: email, password: password));
      },
      expect: () => [
        AuthLoadingState(),
        AuthErrorState(errorGetUser),
        const AuthLoadedState(isLogged: true, userRole: UserRolesEnum.user),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(login(email, password))
            .thenAnswer((realInvocation) async => Left(error));
        when(getUserAttributes())
            .thenAnswer((realInvocation) async => Left(errorGetUser));
        bloc.add(LoginWithEmail(email: email, password: password));
      },
      expect: () => [
        AuthLoadingState(),
        AuthErrorState(errorGetUser),
        AuthErrorState(error),
      ],
    );
  });

  group('[TEST] - LogoutUser', () {
    var error = LogoutError(message: '');
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(logout()).thenAnswer((realInvocation) async => const Right(null));
        bloc.add(const LogoutUser());
      },
      expect: () => [
        AuthLoadingState(),
        const AuthLoadedState(isLogged: false, userRole: UserRolesEnum.user),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(logout()).thenAnswer((realInvocation) async => Left(error));
        bloc.add(const LogoutUser());
      },
      expect: () => [
        AuthLoadingState(),
        AuthErrorState(error),
      ],
    );
  });

  group('[TEST] - ForgotPassword', () {
    var error = ForgotPasswordError(message: '');
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(forgotPassword(email))
            .thenAnswer((realInvocation) async => const Right(true));
        bloc.add(ForgotPassword(email: email));
      },
      expect: () => [
        AuthLoadingState(),
        const AuthConfirmResetState(isReseted: true),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(forgotPassword(email))
            .thenAnswer((realInvocation) async => Left(error));
        bloc.add(ForgotPassword(email: email));
      },
      expect: () => [
        AuthLoadingState(),
        AuthErrorState(error),
      ],
    );
  });

  group('[TEST] - ChangePassword', () {
    var error = ForgotPasswordError(message: '');
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(confirmResetPassword(email, newPassword, confirmationCode))
            .thenAnswer((realInvocation) async => const Right(null));
        bloc.add(ChangePassword(
            email: email,
            confirmationCode: confirmationCode,
            newPassword: newPassword));
      },
      expect: () => [
        AuthLoadingState(),
        const AuthChangePasswordCompleteState(),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(confirmResetPassword(email, newPassword, confirmationCode))
            .thenAnswer((realInvocation) async => Left(error));
        bloc.add(ChangePassword(
            email: email,
            confirmationCode: confirmationCode,
            newPassword: newPassword));
      },
      expect: () => [
        AuthLoadingState(),
        AuthErrorState(error),
      ],
    );
  });

  group('[TEST] - verifyIfHaveTokens', () {
    test('return loggedIn false', () async {
      when(storage.getRefreshToken()).thenAnswer((realInvocation) async => '');
      when(storage.getAccessToken()).thenAnswer((realInvocation) async => '');
      await bloc.verifyIfHaveTokens();
      expect(bloc.isLoggedIn, false);
    });

    test('return loggedIn true', () async {
      when(storage.getRefreshToken())
          .thenAnswer((realInvocation) async => '123');
      when(storage.getAccessToken())
          .thenAnswer((realInvocation) async => '123');
      await bloc.verifyIfHaveTokens();
      expect(bloc.isLoggedIn, true);
    });
  });
}
