import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product_form/product_form_state.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/generated/l10n.dart';

void main() {
  late ProductFormController controller;

  setUp(() async {
    controller = ProductFormController();
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - state', () {
    test('changeState', () {
      controller.changeState(ProductFormLoadingState());
      expect(controller.state, isA<ProductFormLoadingState>());
    });
    test('changeState', () {
      controller.changeState(ProductFormSuccessState());
      expect(controller.state, isA<ProductFormSuccessState>());
    });

    test('changeState', () {
      controller.changeState(
          ProductFormFailureState(failure: Failure(message: 'fail')));
      expect(controller.state, isA<ProductFormFailureState>());
    });
  });

  group('[TEST] - setters', () {
    test('setProductAvailability', () {
      controller.setProductAvailability(true);
      expect(controller.productAvailability, true);
    });

    test('setProductDescription', () {
      controller.setProductDescription('description');
      expect(controller.productDescription, 'description');
    });

    test('setProductName', () {
      controller.setProductName('name');
      expect(controller.productName, 'name');
    });

    test('setProductName', () {
      controller.setProductPrepareTime('12');
      expect(controller.productPrepareTime, 12);
    });

    test('setProductPrice', () {
      controller.setProductPrice('R\$ 10,00');
      expect(controller.productPrice, 10.00);
    });

    test('setProductPhoto', () {
      controller.setProductPhoto('photo');
      expect(controller.productPhoto, 'photo');
    });
  });

  group('[TEST] - validate', () {
    test('validateProductName', () {
      expect(controller.validateProductName(''), S.current.requiredFieldAlert);
      expect(controller.validateProductName('123445'), null);
    });

    test('validateProductPrepareTime', () {
      expect(controller.validateProductPrepareTime(''),
          S.current.requiredFieldAlert);
      expect(controller.validateProductPrepareTime('123445'), null);
    });

    test('validateProductPrice', () {
      expect(controller.validateProductPrice(''), S.current.requiredFieldAlert);
      expect(controller.validateProductPrice('123445'), null);
    });
  });

  
}
