import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/user_menu_state.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/add_favorite_product.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/remove_favorite_product.dart';
import 'package:mauafood_front/app/modules/user/presenter/models/product_viewmodel.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_menu_restaurant_controller_test.mocks.dart';

class GetRestaurantProductMockSuccess extends Mock
    implements IGetRestaurantProductUsecase {
  @override
  Future<Either<Failure, List<ProductModel>>> call(
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
  Future<Either<Failure, List<ProductModel>>> call(
      RestaurantEnum restaurantInfo) async {
    return left(Failure(message: ''));
  }
}

@GenerateMocks([AddFavoriteProduct, RemoveFavoriteProduct, GetFavorites])
void main() {
  late UserMenuRestaurantController controller;
  AddFavoriteProduct addFavoriteProduct = MockAddFavoriteProduct();
  RemoveFavoriteProduct removeFavoriteProduct = MockRemoveFavoriteProduct();
  GetFavorites getFavorites = MockGetFavorites();
  IGetRestaurantProductUsecase usecaseSuccess =
      GetRestaurantProductMockSuccess();
  IGetRestaurantProductUsecase usecaseFailed = GetRestaurantProductMockFailed();
  RestaurantEnum restaurantInfo = RestaurantEnum.souza_de_abreu;
  ProductViewModel testMock = ProductViewModel(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: ProductEnum.DRINKS,
    photo: '',
    available: true,
  );
  var listMock = [
    testMock,
    ProductViewModel(
      id: '0',
      name: '123',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
    ),
  ];
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  group('[TEST] - loadRestaurantMenu', () {
    test('must return MenuLoadedSuccessState', () async {
      controller = UserMenuRestaurantController(
        usecaseSuccess,
        restaurantInfo,
        addFavoriteProduct,
        removeFavoriteProduct,
        getFavorites,
      );
      await controller.loadRestaurantMenu();
      expect(controller.listAllProduct, isNotEmpty);
    });

    test('must return MenuErrorState', () async {
      controller = UserMenuRestaurantController(
        usecaseFailed,
        restaurantInfo,
        addFavoriteProduct,
        removeFavoriteProduct,
        getFavorites,
      );
      await controller.loadRestaurantMenu();
      expect(controller.state, isA<UserMenuErrorState>());
    });
  });

  group('[TEST] - setter', () {
    test('changeState', () {
      controller.changeState(
          UserMenuLoadedSuccessState(listProduct: listMock, index: 0));
      expect(controller.state, isA<UserMenuLoadedSuccessState>());
    });
  });
}
