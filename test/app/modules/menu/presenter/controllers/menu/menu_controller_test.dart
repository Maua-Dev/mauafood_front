import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/menu_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'menu_controller_test.mocks.dart';

@GenerateMocks([IGetRestaurantProductUsecase])
void main() {
  late MenuRestaurantController controller;
  IGetRestaurantProductUsecase usecase = MockIGetRestaurantProductUsecase();
  RestaurantEnum restaurantInfo = RestaurantEnum.biba;
  var failure = Failure(message: '');
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
    controller = MenuRestaurantController(usecase, restaurantInfo);
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - loadRestaurantMenu', () {
    test('must return MenuLoadedSuccessState', () async {
      when(usecase.call(restaurantInfo))
          .thenAnswer((_) async => Right(listMock));
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<MenuLoadedSuccessState>());
    });

    test('must return MenuErrorState', () async {
      when(usecase.call(restaurantInfo)).thenAnswer((_) async => Left(failure));
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - searchProduct', () {
    test('must return MenuLoadedSuccessState', () async {
      controller
          .changeState(MenuLoadedSuccessState(listProduct: listMock, index: 0));
      when(usecase.call(restaurantInfo))
          .thenAnswer((_) async => Right(listMock));
      await controller.searchProduct('name');
      var successState = controller.state as MenuLoadedSuccessState;
      expect(successState.listProduct, [testMock]);
    });

    test('must return MenuErrorState', () async {
      controller.changeState(MenuErrorState(failure: failure));
      when(usecase.call(restaurantInfo)).thenAnswer((_) async => Left(failure));
      await controller.searchProduct('');
      expect(controller.state, isA<MenuErrorState>());
    });
  });

  group('[TEST] - filterProduct', () {
    test('must return MenuLoadedSuccessState', () async {
      controller
          .changeState(MenuLoadedSuccessState(listProduct: listMock, index: 0));
      when(usecase.call(restaurantInfo))
          .thenAnswer((_) async => Right(listMock));
      await controller.filterProduct(ProductEnum.DRINKS);
      var successState = controller.state as MenuLoadedSuccessState;
      expect(successState.listProduct, [testMock]);
    });

    test('must return MenuErrorState', () async {
      controller.changeState(MenuErrorState(failure: failure));
      when(usecase.call(restaurantInfo)).thenAnswer((_) async => Left(failure));
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
