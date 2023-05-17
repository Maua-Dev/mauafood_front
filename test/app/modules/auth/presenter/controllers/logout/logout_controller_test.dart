import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mauafood_front/app/modules/auth/presenter/controllers/logout/logout_controller.dart';
import 'package:mauafood_front/app/modules/auth/presenter/states/logout_state.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_controller_test.mocks.dart';

@GenerateMocks([LogoutUserInterface, AuthStorageInterface])
void main() {
  late LogoutController controller;
  LogoutUserInterface usecase = MockLogoutUserInterface();
  AuthStorageInterface storage = MockAuthStorageInterface();

  setUp(() async {
    controller = LogoutController(usecase, storage);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - logoutUser', () {
    test('must return LogoutSuccessState', () async {
      when(usecase.call()).thenAnswer((_) async => const Right(null));
      await controller.logoutUser();
      expect(controller.state, isA<LogoutSuccessState>());
    });

    test('must return LogoutErrorState', () async {
      when(usecase.call())
          .thenAnswer((_) async => Left(LogoutError(message: '')));
      await controller.logoutUser();
      expect(controller.state, isA<LogoutErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(const LogoutSuccessState());
      expect(controller.state, isA<LogoutSuccessState>());
    });
  });
}