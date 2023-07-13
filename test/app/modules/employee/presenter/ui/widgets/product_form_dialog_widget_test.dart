import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product_form/product_form_state.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/widgets/product_form_dialog_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  late ProductFormController controller;
  
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
