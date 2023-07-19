import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-form/product_form_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/update_product_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/mockito.dart';

class CreateProductMockFailed extends Mock implements ICreateProductUsecase {
  @override
  Future<Either<Failure, void>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    return left(Failure(message: ''));
  }
}

class CreateProductMockSuccess extends Mock implements ICreateProductUsecase {
  @override
  Future<Either<Failure, void>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    return right(null);
  }
}

class UpdateProductMockFailed extends Mock implements IUpdateProductUsecase {
  @override
  Future<Either<Failure, void>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    return left(Failure(message: ''));
  }
}

class UpdateProductMockSuccess extends Mock implements IUpdateProductUsecase {
  @override
  Future<Either<Failure, void>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    return right(null);
  }
}

void main() {
  late ProductFormController controller;
  IUpdateProductUsecase updateProductSuccessUsecase =
      UpdateProductMockSuccess();
  ICreateProductUsecase createProductSuccessUsecase =
      CreateProductMockSuccess();

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - state', () {
    test('changeState', () {
      controller = ProductFormController(
          updateProductSuccessUsecase, createProductSuccessUsecase);
      controller.changeState(ProductFormLoadingState());
      expect(controller.state, isA<ProductFormLoadingState>());
    });
    test('changeState', () {
      controller = ProductFormController(
          updateProductSuccessUsecase, createProductSuccessUsecase);
      controller.changeState(ProductFormSuccessState());
      expect(controller.state, isA<ProductFormSuccessState>());
    });

    test('changeState', () {
      controller = ProductFormController(
          updateProductSuccessUsecase, createProductSuccessUsecase);
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
