import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page.dart';

class ProductInfoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ProductInfoPage(
              productInfo: args.data[0], recommendedProductList: args.data[1]),
        ),
      ];
}
