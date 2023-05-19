import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/resend_confirmation/resend_confirmation_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/resend_confirmation_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'resend_confirmation_controller_test.mocks.dart';

@GenerateMocks([IResendConfirmationCodeUsecase])
void main() {
  late ResendConfirmationController controller;
  IResendConfirmationCodeUsecase usecase = MockIResendConfirmationCodeUsecase();

  setUp(() async {
    controller = ResendConfirmationController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - resendConfirmationCode', () {
    test('must return ResendConfirmationSuccessState', () async {
      when(usecase.call('')).thenAnswer((_) async => const Right(null));
      await controller.resendConfirmationCode();
      expect(controller.state, isA<ResendConfirmationSuccessState>());
    });

    test('must return ResendConfirmationErrorState', () async {
      when(usecase.call(''))
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
      await controller.resendConfirmationCode();
      expect(controller.state, isA<ResendConfirmationErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });

    test('changeState', () {
      controller.changeState(const ResendConfirmationSuccessState());
      expect(controller.state, isA<ResendConfirmationSuccessState>());
    });
  });
}
