import 'dart:collection';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/get_user_attributes.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/login_user.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/login/login_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/login_state.dart';
import 'package:mauafood_front/app/shared/infra/user_roles_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([
  LoginUserInterface,
  AuthStorageInterface,
  GetUserAttributesInterface,
  AuthUserAttribute
])
void main() {
  late LoginController controller;
  LoginUserInterface usecase = MockLoginUserInterface();
  AuthStorageInterface storage = MockAuthStorageInterface();
  GetUserAttributesInterface getUserAttributes =
      MockGetUserAttributesInterface();
  AuthUserAttribute authUser = MockAuthUserAttribute();

  setUp(() async {
    controller = LoginController(usecase, storage, getUserAttributes);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });
  LinkedHashMap map = LinkedHashMap.of(
      {'refreshToken': '123', 'accessToken': '123', 'idToken': '123'});

  AuthUserAttribute user = const AuthUserAttribute(
      userAttributeKey: CognitoUserAttributeKey.custom('custom:role'),
      value: 'student');

  CognitoAuthSession cognitoAuthSession = CognitoAuthSession(
      isSignedIn: true,
      credentials: AWSCredentials.init(creds: {
        'awsAccessKey': '123',
        'awsSecretKey': '123',
        'sessionToken': '123',
      }),
      identityId: '123',
      userSub: '123',
      userPoolTokens: AWSCognitoUserPoolTokens.init(tokens: map));

  group('[TEST] - loginWithEmail', () {
    test('must return LoginSuccessState', () async {
      when(usecase.call('', ''))
          .thenAnswer((_) async => Right(cognitoAuthSession));
      when(getUserAttributes.call()).thenAnswer((_) async => Right([user]));
      await controller.loginWithEmail();
      expect(controller.state, isA<LoginSuccessState>());
    });

    test('must return LoginErrorState', () async {
      when(usecase.call('', ''))
          .thenAnswer((_) async => Left(SignUpError(message: '')));
      when(getUserAttributes.call()).thenAnswer((_) async => Right([user]));
      await controller.loginWithEmail();
      expect(controller.state, isA<LoginErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });

    test('setPassword', () {
      controller.setPassword('password');
      expect(controller.password, 'password');
    });

    test('changeState', () {
      controller
          .changeState(LoginSuccessState(authSession: cognitoAuthSession));
      expect(controller.state, isA<LoginSuccessState>());
    });
  });
}
