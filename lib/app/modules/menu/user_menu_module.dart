import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/datasource/external/http/menu_datasource.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/contact/contact_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/pages/user_menu_page.dart';
import '../product-info/product_info_module.dart';
import '../restaurants/domain/infra/restaurant_enum.dart';
import '../restaurants/restaurant_module.dart';
import '../../shared/domain/repositories/menu_repository_interface.dart';
import '../../shared/infra/datasource/external/http/menu_datasource_interface.dart';
import '../../shared/infra/repositories/menu_repository.dart';

class UserMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IGetRestaurantProductUsecase>(
            (i) => GetRestaurantProductUsecase(repository: i())),
        Bind<MenuController>(
          (i) => MenuController(i(), i.args.data),
        ),
        Bind<ContactController>(
          (i) => ContactController(),
        ),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IMenuDatasource>((i) => MenuDatasource()),
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
          '/product-info',
          module: ProductInfoModule(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
