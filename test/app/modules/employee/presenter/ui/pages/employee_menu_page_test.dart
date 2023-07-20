import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/employee_menu_state.dart';
import 'package:mauafood_front/app/shared/domain/usecases/delete_product_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/modules/employee/employee_menu_module.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/pages/employee_menu_page.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/widgets/error_loading_menu_widget.dart';
import 'package:mauafood_front/app/shared/widgets/filter_button_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import 'employee_menu_page_test.mocks.dart';

@GenerateMocks([IGetRestaurantProductUsecase, IDeleteProductUsecase])
void main() {
  late EmployeeMenuRestaurantController controller;
  IGetRestaurantProductUsecase getRestaurantProductUsecase =
      MockIGetRestaurantProductUsecase();
  IDeleteProductUsecase deleteProductUsecase = MockIDeleteProductUsecase();

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
    when(getRestaurantProductUsecase(RestaurantEnum.souza_de_abreu))
        .thenAnswer((realInvocation) async => Right(listMock));
    controller = EmployeeMenuRestaurantController(
        getRestaurantProductUsecase, RestaurantEnum.souza_de_abreu, deleteProductUsecase);
    initModules([
      EmployeeMenuModule()
    ], replaceBinds: [
      modular.Bind<IGetRestaurantProductUsecase>(
          (i) => getRestaurantProductUsecase),
      modular.Bind<EmployeeMenuRestaurantController>((i) => controller),
    ]);
  });

  testWidgets(
      '[WIDGETS TEST] - EmployeeMenuPage must show widgets when initialize',
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
                home: const EmployeeMenuPage(restaurant: RestaurantEnum.souza_de_abreu),
              )));
      await widgetTester.runAsync(
          () async => controller.changeState(EmployeeMenuInitialState()));
      await widgetTester.pump();
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text(RestaurantEnum.souza_de_abreu.restaurantName), findsOneWidget);
    });
  });

  testWidgets(
      '[WIDGETS TEST] - EmployeeMenuPage must show widgets when Success',
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
                home: const EmployeeMenuPage(restaurant: RestaurantEnum.souza_de_abreu),
              )));

      when(getRestaurantProductUsecase(RestaurantEnum.souza_de_abreu))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(() async => controller.changeState(
          EmployeeMenuLoadedSuccessState(listProduct: listMock, index: 0)));
      await widgetTester.pump();

      expect(find.byType(FilterButtonWidget), findsNWidgets(10));
      expect(find.byType(ListView), findsNWidgets(2));
    });
  });

  testWidgets(
      '[WIDGETS TEST] - EmployeeMenuPage must show widgets when Loading',
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
                home: const EmployeeMenuPage(restaurant: RestaurantEnum.souza_de_abreu),
              )));

      when(getRestaurantProductUsecase(RestaurantEnum.souza_de_abreu))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(
          () async => controller.changeState(EmployeeMenuLoadingState()));
      await widgetTester.pump();

      expect(find.byType(CircularProgressIndicator), findsNWidgets(1));
    });
  });

  testWidgets('[WIDGETS TEST] - EmployeeMenuPage must show widgets when Error',
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
                home: const EmployeeMenuPage(restaurant: RestaurantEnum.souza_de_abreu),
              )));

      when(getRestaurantProductUsecase(RestaurantEnum.souza_de_abreu))
          .thenAnswer((realInvocation) async => Right(listMock));

      await widgetTester.runAsync(() async => controller.changeState(
          EmployeeMenuErrorState(failure: Failure(message: 'message'))));
      await widgetTester.pump();

      expect(find.byType(ErrorLoadingMenuWidget), findsNWidgets(1));
      expect(find.text('message'), findsOneWidget);
    });
  });
}
