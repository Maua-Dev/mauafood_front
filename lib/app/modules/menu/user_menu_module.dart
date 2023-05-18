import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/data/datasource/menu_datasource_impl.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/contact/contact_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/pages/user_menu_page.dart';
import '../meal-info/meal_info_module.dart';
import '../restaurants/domain/infra/restaurant_enum.dart';
import '../restaurants/restaurant_module.dart';
import 'domain/infra/menu_repository_interface.dart';
import 'infra/datasources/menu_datasource_interface.dart';
import 'infra/repository/menu_repository_impl.dart';

class UserMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetRestaurantMealInterface>(
            (i) => GetRestaurantMealImpl(repository: i())),
        Bind<MenuController>(
          (i) => MenuController(i(), i.args.data),
        ),
        Bind<ContactController>(
          (i) => ContactController(),
        ),
        Bind<MenuRepositoryInterface>(
            (i) => MenuRepositoryImpl(datasource: i())),
        Bind<MenuDatasourceInterface>((i) => MenuDatasourceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: RestaurantModule(),
          // guards: [UserAuthGuard()],
        ),
        ChildRoute(
          '/menu',
          child: (context, args) => UserMenuPage(
            restaurantInfo: args.data as RestaurantEnum,
          ),
          // guards: [UserAuthGuard()],
        ),
        ModuleRoute(
          '/meal-info',
          module: ProductInfoModule(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
