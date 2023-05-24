import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/menu_state.dart';
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

void main() {
  late MenuRestaurantController controller;
  IGetRestaurantProductUsecase usecaseSuccess =
      GetRestaurantProductMockSuccess();
  IGetRestaurantProductUsecase usecaseFailed = GetRestaurantProductMockFailed();
  RestaurantEnum restaurantInfo = RestaurantEnum.biba;
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
      controller = MenuRestaurantController(usecaseSuccess, restaurantInfo);
      await controller.loadRestaurantMenu();
      expect(controller.listAllProduct, isNotEmpty);
    });

    test('must return MenuErrorState', () async {
      controller = MenuRestaurantController(usecaseFailed, restaurantInfo);
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - searchProduct', () {
    test('must return MenuErrorState', () async {
      controller = MenuRestaurantController(usecaseFailed, restaurantInfo);
      await controller.searchProduct('');
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - filterProduct', () {
    test('must return MenuErrorState', () async {
      controller = MenuRestaurantController(usecaseFailed, restaurantInfo);
      await controller.filterProduct(ProductEnum.SNACKS);
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller
          .changeState(MenuLoadedSuccessState(listProduct: listMock, index: 0));
      expect(controller.state, isA<MenuLoadedSuccessState>());
    });
  });
}
