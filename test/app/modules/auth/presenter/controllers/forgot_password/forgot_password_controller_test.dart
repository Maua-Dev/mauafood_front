import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/storage/auth_storage_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/forgot_password_usecase.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/forgot_password/forgot_password_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/forgot_password_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forgot_password_controller_test.mocks.dart';

@GenerateMocks([IForgotPasswordUsecase, IAuthStorage])
void main() {
  late ForgotPasswordController controller;
  IForgotPasswordUsecase usecase = MockIForgotPasswordUsecase();
  IAuthStorage storage = MockIAuthStorage();

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
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
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
