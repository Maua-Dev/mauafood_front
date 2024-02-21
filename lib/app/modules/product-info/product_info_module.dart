import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/presenter/controllers/landing_controller.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/controllers/product_info_controller.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page.dart';

class ProductInfoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<ProductInfoController>((i) => ProductInfoController(
            product: i.args.data[0], restaurant: i.args.data[2])),
        Bind<LandingController>((i) => i()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ProductInfoPage(
            productInfo: args.data[0],
            recommendedProductList: args.data[1],
          ),
        ),
      ];
}
