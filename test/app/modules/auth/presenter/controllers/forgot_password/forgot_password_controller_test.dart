import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/forgot_password.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/forgot_password/forgot_password_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/forgot_password_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forgot_password_controller_test.mocks.dart';

@GenerateMocks([ForgotPasswordInterface, AuthStorageInterface])
void main() {
  late ForgotPasswordController controller;
  ForgotPasswordInterface usecase = MockForgotPasswordInterface();
  AuthStorageInterface storage = MockAuthStorageInterface();

  setUp(() async {
    controller = ForgotPasswordController(storage, usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - forgotPasswordUser', () {
    test('must return ForgotPasswordSuccessState', () async {
      when(usecase.call('')).thenAnswer((_) async => const Right(true));
      await controller.forgotPasswordUser();
      expect(controller.state, isA<ForgotPasswordSuccessState>());
    });

    test('must return ForgotPasswordErrorState', () async {
      when(usecase.call(''))
          .thenAnswer((_) async => Left(ForgotPasswordError(message: '')));
      await controller.forgotPasswordUser();
      expect(controller.state, isA<ForgotPasswordErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(const ForgotPasswordSuccessState());
      expect(controller.state, isA<ForgotPasswordSuccessState>());
    });

    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });
  });
}
