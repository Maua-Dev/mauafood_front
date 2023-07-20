import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/employee_menu_state.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/usecases/delete_product_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/mockito.dart';

class GetRestaurantProductMockSuccess extends Mock
    implements IGetRestaurantProductUsecase {
  @override
  Future<Either<Failure, List<Product>>> call(
      RestaurantEnum restaurantInfo) async {
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
    var listMock = [
      testMock,
      ProductModel(
        id: '0',
        name: '123',
        description: 'description',
        price: 10,
        type: ProductEnum.CANDIES,
        photo: '',
        available: true,
        lastUpdate: DateTime.now(),
      ),
    ];
    return right(listMock);
  }
}

class GetRestaurantProductMockFailed extends Mock
    implements IGetRestaurantProductUsecase {
  @override
  Future<Either<Failure, List<Product>>> call(
      RestaurantEnum restaurantInfo) async {
    return left(Failure(message: ''));
  }
}

class DeleteProductMockSuccess extends Mock implements IDeleteProductUsecase {
  @override
  Future<Either<Failure, void>> call(
      String id, RestaurantEnum restaurant) async {
    return right(null);
  }
}

class DeleteProductMockFailed extends Mock implements IDeleteProductUsecase {
  @override
  Future<Either<Failure, bool>> call(
      String id, RestaurantEnum restaurant) async {
    return left(Failure(message: ''));
  }
}

void main() {
  late EmployeeMenuRestaurantController controller;
  IGetRestaurantProductUsecase getRestaurantProductSuccessUsecase =
      GetRestaurantProductMockSuccess();
  IDeleteProductUsecase deleteProductSuccessUsecase =
      DeleteProductMockSuccess();
  IGetRestaurantProductUsecase getRestaurantProductFailedUsecase =
      GetRestaurantProductMockFailed();
  IDeleteProductUsecase deleteProductFailedUsecase = DeleteProductMockFailed();
  RestaurantEnum restaurantInfo = RestaurantEnum.souza_de_abreu;
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
  var listMock = [
    testMock,
    ProductModel(
      id: '0',
      name: '123',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
  ];
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - loadRestaurantMenu', () {
    test('must return MenuLoadedSuccessState', () async {
      controller = EmployeeMenuRestaurantController(
          getRestaurantProductSuccessUsecase,
          restaurantInfo,
          deleteProductSuccessUsecase);
      await controller.loadRestaurantMenu();
      expect(controller.listAllProduct, isNotEmpty);
    });

    test('must return MenuErrorState', () async {
      controller = EmployeeMenuRestaurantController(
          getRestaurantProductFailedUsecase,
          restaurantInfo,
          deleteProductFailedUsecase);
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<EmployeeMenuErrorState>());
    });
  });

  group('[TEST] - searchProduct', () {
    test('must return MenuErrorState', () async {
      controller = EmployeeMenuRestaurantController(
          getRestaurantProductFailedUsecase,
          restaurantInfo,
          deleteProductFailedUsecase);
      await controller.searchProduct('');
      expect(controller.state, isA<EmployeeMenuErrorState>());
    });
  });

  group('[TEST] - filterProduct', () {
    test('must return MenuErrorState', () async {
      controller = EmployeeMenuRestaurantController(
          getRestaurantProductFailedUsecase,
          restaurantInfo,
          deleteProductFailedUsecase);
      await controller.filterProduct(ProductEnum.SNACKS);
      expect(controller.state, isA<EmployeeMenuErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(
          EmployeeMenuLoadedSuccessState(listProduct: listMock, index: 0));
      expect(controller.state, isA<EmployeeMenuLoadedSuccessState>());
    });
  });
}
