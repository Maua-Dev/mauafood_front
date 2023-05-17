import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/contact/contact_controller.dart';
import 'package:mauafood_front/generated/l10n.dart';

void main() {
  ContactController controller = ContactController();

  setUp(() async {
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
}
