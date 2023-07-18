import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/profile_module.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurant_module.dart';
import 'package:mauafood_front/app/shared/datasource/external/http/menu_datasource.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/contact/contact_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/pages/user_menu_page.dart';
import '../../shared/datasource/external/http/contact_datasource.dart';
import '../../shared/domain/repositories/contact_repository_interface.dart';
import '../../shared/domain/usecases/contact_usecase.dart';
import '../../shared/helpers/services/dio/dio_http_request.dart';
import '../../shared/helpers/services/dio/options/product_base_options.dart';
import '../../shared/helpers/services/http/http_request_interface.dart';
import '../../shared/helpers/services/http_service.dart';
import '../../shared/infra/datasource/external/http/contact_datasource_interface.dart';
import '../../shared/infra/repositories/contact_repository.dart';
import '../product-info/product_info_module.dart';
import '../../shared/domain/repositories/menu_repository_interface.dart';
import '../../shared/infra/datasource/external/http/menu_datasource_interface.dart';
import '../../shared/infra/repositories/menu_repository.dart';

class UserMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IGetRestaurantProductUsecase>(
            (i) => GetRestaurantProductUsecase(repository: i())),
        Bind<MenuRestaurantController>(
          (i) => MenuRestaurantController(i(), i.args.data),
        ),
        Bind((i) => Dio(productBaseOptions)),
        Bind<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>())),
        Bind<IContactUsecase>((i) => ContactUsecase(i())),
        Bind<IContactRepository>((i) => ContactRepository(datasource: i())),
        Bind<IContactDatasource>((i) => ContactDatasource()),
        Bind<ContactController>(
          (i) => ContactController(i()),
        ),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
        Bind<HttpService>((i) => HttpService(httpRequest: i())),
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
          child: (context, args) => const UserMenuPage(),
          // guards: [UserAuthGuard()],
        ),
        ModuleRoute(
          '/product-info',
          module: ProductInfoModule(),
          // guards: [UserAuthGuard()],
        ),
        ModuleRoute(
          '/profile',
          module: ProfileModule(),
          // guards: [UserAuthGuard()],
        ),
      ];
}
