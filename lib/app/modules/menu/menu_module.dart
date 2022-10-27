import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/data/datasource/menu_datasource_impl.dart';
import 'package:mauafood_front/app/modules/menu/domain/usecases/get_restaurant_meal.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/menu_bloc.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/pages/menu_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../cart/cart_module.dart';
import '../cart/presenter/bloc/cart_bloc.dart';
import '../meal-info/meal_info_module.dart';
import 'domain/infra/menu_repository_interface.dart';
import 'infra/datasources/menu_datasource_interface.dart';
import 'infra/repository/menu_repository_impl.dart';

class MenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetRestaurantMealInterface>(
            (i) => GetRestaurantMealImpl(repository: i())),
        BlocBind.lazySingleton<MenuBloc>((i) =>
            MenuBloc(getRestaurantMeal: i(), restaurantInfo: i.args.data)),
        Bind<MenuRepositoryInterface>(
            (i) => MenuRepositoryImpl(datasource: i())),
        Bind<MenuDatasourceInterface>((i) => MenuDatasourceImpl()),
        Bind<MenuRepositoryInterface>(
            (i) => MenuRepositoryImpl(datasource: i())),
        BlocBind.lazySingleton<CartBloc>((i) => CartBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const MenuPage(),
        ),
        ModuleRoute('/meal-info/', module: MealInfoModule()),
        ModuleRoute('/cart/', module: CartModule()),
      ];
}
