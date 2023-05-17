import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/register_user.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/register/register_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/register_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_controller_test.mocks.dart';

@GenerateMocks([RegisterUserInterface])
void main() {
  late RegisterController controller;
  RegisterUserInterface usecase = MockRegisterUserInterface();

  setUp(() async {
    controller = RegisterController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - registerUser', () {
    test('must return RegisterSuccessState', () async {
      when(usecase.call('', '', false, '', '', false, false, false))
          .thenAnswer((_) async => const Right(true));
      await controller.registerUser();
      expect(controller.state, isA<RegisterSuccessState>());
    });

    test('must return RegisterErrorState', () async {
      when(usecase.call('', '', false, '', '', false, false, false))
          .thenAnswer((_) async => Left(RegisterError(message: '')));
      await controller.registerUser();
      expect(controller.state, isA<RegisterErrorState>());
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

    test('setConfirmPassword', () {
      controller.setConfirmPassword('confirmPassword');
      expect(controller.confirmPassword, 'confirmPassword');
    });

    test('setFullName', () {
      controller.setFullName('fullName');
      expect(controller.fullName, 'fullName');
    });

    test('setCpf', () {
      controller.setCpf('cpf');
      expect(controller.cpf, 'cpf');
    });

    test('setIsStudent', () {
      controller.setIsStudent(true);
      expect(controller.isStudent, true);
    });

    test('setEmailNotification', () {
      controller.setEmailNotification(true);
      expect(controller.emailNotification, true);
    });

    test('setAppNotification', () {
      controller.setAppNotification(true);
      expect(controller.appNotification, true);
    });

    test('changeState', () {
      controller.changeState(const RegisterSuccessState());
      expect(controller.state, isA<RegisterSuccessState>());
    });
  });
}
