import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/employee/pages/employee_menu_page.dart';
import '../employee_auth_guard.dart';
import '../restaurants/domain/infra/restaurant_enum.dart';
import 'data/datasource/menu_datasource_impl.dart';
import 'domain/infra/menu_repository_interface.dart';
import 'domain/usecases/get_restaurant_meal.dart';
import 'infra/datasources/menu_datasource_interface.dart';
import 'infra/repository/menu_repository_impl.dart';

class EmployeeMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetRestaurantMealInterface>(
            (i) => GetRestaurantMealImpl(repository: i())),
        Bind<MenuController>(
          (i) => MenuController(i(), i.args.data),
        ),
        Bind<MenuRepositoryInterface>(
            (i) => MenuRepositoryImpl(datasource: i())),
        Bind<MenuDatasourceInterface>((i) => MenuDatasourceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) =>
                EmployeeMenuPage(restaurant: args.data as RestaurantEnum),
            guards: [EmployeeAuthGuard()]),
      ];
}
