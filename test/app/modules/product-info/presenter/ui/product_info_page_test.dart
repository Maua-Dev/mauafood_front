import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/landing/landing_module.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/controllers/product_info_controller.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page.dart';
import 'package:mauafood_front/app/modules/product-info/product_info_module.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/cart/cart_controller.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/cart_product_model.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'product_info_page_test.mocks.dart';

@GenerateMocks([ProductInfoController, CartController])
void main() {
  var recommendedProductList = [
    Product(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
    Product(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    ),
    Product(
      id: '0',
      name: 'name',
      description: 'description',
      price: 10,
      type: ProductEnum.CANDIES,
      photo: '',
      available: true,
      lastUpdate: DateTime.now(),
    )
  ];
  ProductInfoController productInfoController = MockProductInfoController();
  CartController cartController = MockCartController();
  setUpAll(() {
    HttpOverrides.global = null;
    initModules([
      AppModule(),
      LandingModule(),
      ProductInfoModule(),
    ], replaceBinds: [
      Bind<ProductInfoController>((i) => productInfoController),
      Bind<CartController>((i) => cartController),
    ]);
  });

  testWidgets('[WIDGETS TEST] - ProductInfoPage', (widgetTester) async {
    mockNetworkImagesFor(() async {
      when(productInfoController.productCart)
          .thenReturn(CartProductModel.newInstance());
      await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: ProductInfoPage(
          productInfo: recommendedProductList[0],
          recommendedProductList: recommendedProductList,
        ),
      ));

      await widgetTester.pump();

      final center = find.byType(Center);
      expect(center, findsWidgets);
      final sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsAtLeastNWidgets(5));
      final texts = find.byType(Text);
      expect(texts, findsAtLeastNWidgets(4));
    });
  });
}
