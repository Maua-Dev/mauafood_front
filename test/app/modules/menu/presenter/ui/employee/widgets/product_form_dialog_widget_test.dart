import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/product_form/product_form_state.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/employee/widgets/product_form_dialog_widget.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  late ProductFormController controller;
  Product productMock = const Product(
    available: true,
    description: 'description',
    name: 'name',
    photo: 'photo',
    price: 10,
    type: ProductEnum.ALL,
  );

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    controller = ProductFormController();
  });

  testWidgets(
      '[WIDGETS TEST] - ProductFormDialogWidget must show widgets when initialize',
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
                home: const ProductFormDialogWidget(
                    title: 'Criar produto',
                    buttonText: 'Criar',
                    snackBarText: 'Produto criado com sucesso!'),
              )));
      await widgetTester.runAsync(
          () async => controller.changeState(ProductFormInitialState()));
      await widgetTester.pump();
    });
  });
}
