import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mauafood_front/app/shared/domain/usecases/send_email.dart';
import 'package:mauafood_front/app/shared/domain/usecases/user_send_email.dart';
import 'package:mauafood_front/app/shared/widgets/contact/contact_controller.dart';

import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contact_controller_test.mocks.dart';

@GenerateMocks([ISendEmail, IUserSendEmail, UserController])
void main() {
  late ContactController controller;
  ISendEmail sendEmailMock = MockISendEmail();
  IUserSendEmail userSendEmailMock = MockIUserSendEmail();
  UserController userControllerMock = MockUserController();
  setUp(() async {
    controller =
        ContactController(sendEmailMock, userSendEmailMock, userControllerMock);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - setter', () {
    test('setMessage', () {
      controller.setMessage('message');
      expect(controller.message, 'message');
    });

    test('setEmail', () {
      controller.setEmail('email');
      expect(controller.email, 'email');
    });

    test('setName', () {
      controller.setName('name');
      expect(controller.name, 'name');
    });
  });

  test('validateMessage', () {
    expect(controller.validateMessage(''), S.current.requiredFieldAlert);
    expect(controller.validateMessage('123445'), null);
  });
  test('validate sendEmail is invoke', () {
    when(userControllerMock.isLogged).thenReturn(false);
    when(sendEmailMock('name', 'email', 'message'))
        .thenAnswer((_) async => const Right(null));

    controller.setEmail('email');
    controller.setName('name');
    controller.setMessage('message');

    controller.sendEmail();
    verify(sendEmailMock('name', 'email', 'message'));
  });
  test('validate userSendEmail is invoke', () {
    when(userControllerMock.isLogged).thenReturn(true);
    when(userSendEmailMock('message'))
        .thenAnswer((_) async => const Right(null));

    controller.setMessage('message');

    controller.sendEmail();
    verify(userSendEmailMock('message'));
  });
}
