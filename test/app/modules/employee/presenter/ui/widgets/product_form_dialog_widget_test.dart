import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/employee_menu_module.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-form/product_form_state.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/widgets/product_form_dialog_widget.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/update_product_usecase.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'product_form_dialog_widget_test.mocks.dart';

@GenerateMocks([IUpdateProductUsecase, ICreateProductUsecase])
void main() {
  late ProductFormController controller;
  IUpdateProductUsecase updateProductUsecase = MockIUpdateProductUsecase();
  ICreateProductUsecase createProductUsecase = MockICreateProductUsecase();

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    controller =
        ProductFormController(updateProductUsecase, createProductUsecase);
    initModules([
      EmployeeMenuModule()
    ], replaceBinds: [
      modular.Bind<ProductFormController>((i) => controller),
    ]);
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
                  snackBarText: 'Produto criado com sucesso!',
                  restaurant: RestaurantEnum.biba,
                ),
              )));
      await widgetTester.runAsync(
          () async => controller.changeState(ProductFormInitialState()));
      await widgetTester.pump();
    });
  });
}
