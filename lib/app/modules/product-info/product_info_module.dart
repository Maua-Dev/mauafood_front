import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/pages/product_info_page.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product.dart';

class ProductInfoModule extends Module {
  late Product mealinfo;
  @override
  List<Bind> get binds => [
        Bind<Product>((i) => mealinfo),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ProductInfoPage(
              mealInfo: args.data[0], recommendedMealList: args.data[1]),
        ),
      ];
}
