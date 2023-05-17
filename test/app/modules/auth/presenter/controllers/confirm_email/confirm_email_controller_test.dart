import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_email.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/confirm_email/confirm_email_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/confirm_email_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'confirm_email_controller_test.mocks.dart';

@GenerateMocks([ConfirmEmailInterface])
void main() {
  late ConfirmEmailController controller;
  ConfirmEmailInterface usecase = MockConfirmEmailInterface();

  setUp(() async {
    controller = ConfirmEmailController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - confirmEmail', () {
    test('must return ConfirmEmailSuccessState', () async {
      when(usecase.call('', '')).thenAnswer((_) async => const Right(true));
      await controller.confirmEmail();
      expect(controller.state, isA<ConfirmEmailSuccessState>());
    });

    test('must return ConfirmEmailErrorState', () async {
      when(usecase.call('', '')).thenAnswer(
          (_) async => Left(ConfirmationEmailError(message: '', email: '')));
      await controller.confirmEmail();
      expect(controller.state, isA<ConfirmEmailErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(const ConfirmEmailSuccessState());
      expect(controller.state, isA<ConfirmEmailSuccessState>());
    });
    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });

    test('setCode', () {
      controller.setCode('code');
      expect(controller.code, 'code');
    });
  });
}
