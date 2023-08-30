import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-form/product_form_state.dart';
import 'package:mauafood_front/app/modules/employee/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/modules/employee/usecases/update_product_usecase.dart';
import 'package:mauafood_front/app/modules/employee/usecases/upload_photo_to_s3_usecase.dart';
import 'package:mauafood_front/app/modules/employee/usecases/upload_product_photo_usecase.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_form_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EmployeeMenuRestaurantController>()])
class CreateProductMockFailed extends Mock implements ICreateProductUsecase {
  @override
  Future<Either<Failure, ProductModel>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    return left(Failure(message: ''));
  }
}

class CreateProductMockSuccess extends Mock implements ICreateProductUsecase {
  @override
  Future<Either<Failure, ProductModel>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    ProductModel testMock = ProductModel(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.DRINKS,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    );
    return right(testMock);
  }
}

class UpdateProductMockFailed extends Mock implements IUpdateProductUsecase {
  @override
  Future<Either<Failure, ProductModel>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    return left(Failure(message: ''));
  }
}

class UpdateProductMockSuccess extends Mock implements IUpdateProductUsecase {
  @override
  Future<Either<Failure, ProductModel>> call(
      ProductModel product, RestaurantEnum restaurant) async {
    ProductModel testMock = ProductModel(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.DRINKS,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    );
    return right(testMock);
  }
}

class UploadProductPhotoMockFailed extends Mock
    implements IUploadProductPhotoUsecase {}

class UploadProductPhotokSuccess extends Mock
    implements IUploadProductPhotoUsecase {}

class IUploadPhotoToS3MockFailed extends Mock
    implements IUploadPhotoToS3Usecase {}

class UIUploadPhotoToS3Success extends Mock
    implements IUploadPhotoToS3Usecase {}

void main() {
  final employeeMenuRestaurantController =
      MockEmployeeMenuRestaurantController();
  late ProductFormController controller;
  IUpdateProductUsecase updateProductSuccessUsecase =
      UpdateProductMockSuccess();
  ICreateProductUsecase createProductSuccessUsecase =
      CreateProductMockSuccess();
  IUploadPhotoToS3Usecase uploadPhotoToS3Usecase = UIUploadPhotoToS3Success();
  IUploadProductPhotoUsecase uploadProductPhotoUsecase =
      UploadProductPhotokSuccess();
  ProductModel testMock = ProductModel(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: ProductEnum.DRINKS,
    photo: '',
    available: true,
    lastUpdate: DateTime.now(),
  );

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - state', () {
    test('changeState', () {
      controller = ProductFormController(
          updateProductSuccessUsecase,
          createProductSuccessUsecase,
          employeeMenuRestaurantController,
          uploadProductPhotoUsecase,
          uploadPhotoToS3Usecase);
      controller.changeState(ProductFormLoadingState());
      expect(controller.state, isA<ProductFormLoadingState>());
    });
    test('changeState', () {
      controller = ProductFormController(
          updateProductSuccessUsecase,
          createProductSuccessUsecase,
          employeeMenuRestaurantController,
          uploadProductPhotoUsecase,
          uploadPhotoToS3Usecase);
      controller.changeState(ProductFormSuccessState(product: testMock));
      expect(controller.state, isA<ProductFormSuccessState>());
    });

    test('changeState', () {
      controller = ProductFormController(
          updateProductSuccessUsecase,
          createProductSuccessUsecase,
          employeeMenuRestaurantController,
          uploadProductPhotoUsecase,
          uploadPhotoToS3Usecase);
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

    test('validateProductPrice', () {
      expect(controller.validateProductPrice(''), S.current.requiredFieldAlert);
      expect(controller.validateProductPrice('123445'), null);
    });
  });
}
