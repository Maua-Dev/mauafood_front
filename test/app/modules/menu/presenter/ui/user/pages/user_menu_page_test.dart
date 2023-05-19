import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/product_model.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/menu_state.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/pages/user_menu_page.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/error_loading_menu_widget.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/product_card_widget.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import 'user_menu_page_test.mocks.dart';

@GenerateMocks([IGetRestaurantProductUsecase])
void main() {
  late MenuController controller;
  IGetRestaurantProductUsecase usecase = MockIGetRestaurantProductUsecase();

  ProductModel testMock = ProductModel(
    id: '0',
    name: 'name',
    description: 'description',
    price: 10,
    type: ProductEnum.CANDIES,
    photo: '',
    available: true,
    lastUpdate: DateTime.now(),
  );
  var listMock = [
    testMock,
    ProductModel(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
  ];

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    HttpOverrides.global = null;
    controller = MenuController(usecase, RestaurantEnum.biba);
    initModules([
      UserMenuModule()
    ], replaceBinds: [
      modular.Bind<IGetRestaurantProductUsecase>((i) => usecase),
      modular.Bind<MenuController>((i) => controller),
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
                home: const UserMenuPage(restaurantInfo: RestaurantEnum.biba),
              )));

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
      final floatingButton = find.byType(FloatingActionButton);
      expect(floatingButton, findsOneWidget);
      final iconFloatingButton = find.byIcon(Icons.mail);
      expect(iconFloatingButton, findsOneWidget);
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
                home: const UserMenuPage(restaurantInfo: RestaurantEnum.biba),
              )));

      when(usecase(RestaurantEnum.biba))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(() async => controller.loadRestaurantMenu());
      await widgetTester.pump();

      expect(find.byType(ProductCardWidget), findsNWidgets(2));
      expect(find.byType(GridView), findsOneWidget);
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
                home: const UserMenuPage(restaurantInfo: RestaurantEnum.biba),
              )));

      when(usecase(RestaurantEnum.biba))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester
          .runAsync(() async => controller.changeState(MenuLoadingState()));
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
                home: const UserMenuPage(restaurantInfo: RestaurantEnum.biba),
              )));

      when(usecase(RestaurantEnum.biba))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(() async => controller
          .changeState(MenuErrorState(failure: Failure(message: 'message'))));
      await widgetTester.pump();

      expect(find.byType(ErrorLoadingMenuWidget), findsNWidgets(1));
      expect(find.text('message'), findsOneWidget);
    });
  });
}
