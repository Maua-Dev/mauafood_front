import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/meal_info_page.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';

import '../error/presenter/ui/error_page.dart';

class MealInfoModule extends Module {
  late Meal mealinfo;
  @override
  List<Bind> get binds => [
        Bind<Meal>((i) => mealinfo),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => MealInfoPage(mealInfo: args.data),
        ),
        WildcardRoute(
            child: (context, args) => const ErrorPage(
                  errorMessage: "Page not found! :(",
                ))
      ];
}
