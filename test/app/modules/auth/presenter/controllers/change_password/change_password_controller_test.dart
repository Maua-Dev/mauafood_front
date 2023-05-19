import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/confirm_reset_password_usecase.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/change_password/change_password_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/change_password_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_controller_test.mocks.dart';

@GenerateMocks([IConfirmResetPasswordUsecase])
void main() {
  late ChangePasswordController controller;
  IConfirmResetPasswordUsecase usecase = MockIConfirmResetPasswordUsecase();

  setUp(() async {
    controller = ChangePasswordController(usecase);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - changePassword', () {
    test('must return ChangePasswordSuccessState', () async {
      when(usecase.call('', '', '')).thenAnswer((_) async => const Right(null));
      await controller.changePassword();
      expect(controller.state, isA<ChangePasswordSuccessState>());
    });

    test('must return ChangePasswordErrorState', () async {
      when(usecase.call('', '', ''))
          .thenAnswer((_) async => Left(AuthErrors(message: '')));
      await controller.changePassword();
      expect(controller.state, isA<ChangePasswordErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(const ChangePasswordSuccessState());
      expect(controller.state, isA<ChangePasswordSuccessState>());
    });

    test('setCode', () {
      controller.setCode('code');
      expect(controller.code, 'code');
    });

    test('setNewPassword', () {
      controller.setNewPassword('code');
      expect(controller.newPassword, 'code');
    });

    test('setConfirmNewPassword', () {
      controller.setConfirmNewPassword('code');
      expect(controller.confirmNewPassword, 'code');
    });
  });
}
