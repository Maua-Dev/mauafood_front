import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/user_menu_state.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/add_favorite_product.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/remove_favorite_product.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/user/presenter/models/product_viewmodel.dart';
import 'package:mauafood_front/app/modules/user/presenter/ui/pages/user_menu_page.dart';
import 'package:mauafood_front/app/modules/user/presenter/ui/widgets/product_card_widget.dart';
import 'package:mauafood_front/app/modules/user/user_menu_module.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/widgets/error_loading_menu_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import 'user_menu_page_test.mocks.dart';

@GenerateMocks([
  IGetRestaurantProductUsecase,
  AddFavoriteProduct,
  RemoveFavoriteProduct,
  GetFavorites
])
void main() {
  late UserMenuRestaurantController controller;
  IGetRestaurantProductUsecase usecase = MockIGetRestaurantProductUsecase();
  AddFavoriteProduct addFavoriteProduct = MockAddFavoriteProduct();
  RemoveFavoriteProduct removeFavoriteProduct = MockRemoveFavoriteProduct();
  GetFavorites getFavorites = MockGetFavorites();
  ProductViewModel testMock = ProductViewModel(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: ProductEnum.CANDIES,
    photo: '',
    available: true,
  );
  var listMock = [
    testMock,
    ProductViewModel(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
    ),
  ];

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    HttpOverrides.global = null;
    // when(usecase(RestaurantEnum.souza_de_abreu))
    //     .thenAnswer((realInvocation) async => Right(listMock));
    controller = UserMenuRestaurantController(
        usecase,
        RestaurantEnum.souza_de_abreu,
        addFavoriteProduct,
        removeFavoriteProduct,
        getFavorites);
    initModules([
      UserMenuModule()
    ], replaceBinds: [
      modular.Bind<IGetRestaurantProductUsecase>((i) => usecase),
      modular.Bind<UserMenuRestaurantController>((i) => controller),
    ]);
  });
  testWidgets('[WIDGETS TEST] - UserMenuPage must show widgets when initialize',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: const UserMenuPage(),
              )));

      await widgetTester
          .runAsync(() async => controller.changeState(UserMenuInitialState()));
      await widgetTester.pump();

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      final loading = find.byType(CircularProgressIndicator);
      expect(loading, findsNothing);
      final listViewVertical = find.byType(ListView);
      expect(listViewVertical, findsNothing);
      final gridView = find.byType(GridView);
      expect(gridView, findsNothing);
      final productCards = find.byType(ProductCardWidget);
      expect(productCards, findsNWidgets(0));
    });
  });

  testWidgets('[WIDGETS TEST] - UserMenuPage must show widgets when Success',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: const UserMenuPage(),
              )));

      // when(usecase(RestaurantEnum.souza_de_abreu))
      //     .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(() async => controller.loadRestaurantMenu());
      await widgetTester.runAsync(() async => controller.changeState(
          UserMenuLoadedSuccessState(index: 2, listProduct: listMock)));
      await widgetTester.pump();

      expect(find.byType(ProductCardWidget), findsNWidgets(2));
    });
  });

  testWidgets('[WIDGETS TEST] - UserMenuPage must show widgets when Loading',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: const UserMenuPage(),
              )));

      await widgetTester
          .runAsync(() async => controller.changeState(UserMenuLoadingState()));
      await widgetTester.pump();

      expect(find.byType(CircularProgressIndicator), findsNWidgets(1));
    });
  });

  testWidgets('[WIDGETS TEST] - UserMenuPage must show widgets when Error',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(MaterialApp(
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: const UserMenuPage(),
              )));

      // when(usecase(RestaurantEnum.souza_de_abreu))
      //     .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(() async => controller.changeState(
          UserMenuErrorState(failure: Failure(message: 'message'))));
      await widgetTester.pump();

      expect(find.byType(ErrorLoadingMenuWidget), findsNWidgets(1));
      expect(find.text('message'), findsOneWidget);
    });
  });
}
