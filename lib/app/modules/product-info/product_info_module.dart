import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/controllers/product_info_controller.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';

class ProductInfoModule extends Module {
  late Product productInfo;
  @override
  List<Bind> get binds => [
        Bind<Product>((i) => productInfo),
        Bind<ProductInfoController>((i) => ProductInfoController())
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
