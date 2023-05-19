import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/menu/menu_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/employee/pages/employee_menu_page.dart';
import 'package:mauafood_front/app/shared/helpers/services/dio/options/product_base_options.dart';
import '../../shared/helpers/services/dio/dio_http_request.dart';
import '../../shared/helpers/services/http/http_request_interface.dart';
import '../../shared/helpers/services/http_service.dart';
import 'guards/employee_auth_guard.dart';
import '../../shared/domain/enums/restaurant_enum.dart';
import '../../shared/datasource/external/http/menu_datasource.dart';
import '../../shared/domain/repositories/menu_repository_interface.dart';
import '../../shared/domain/usecases/get_restaurant_product_usecase.dart';
import '../../shared/infra/datasource/external/http/menu_datasource_interface.dart';
import '../../shared/infra/repositories/menu_repository.dart';

class EmployeeMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IGetRestaurantProductUsecase>(
            (i) => GetRestaurantProductUsecase(repository: i())),
        Bind<MenuController>(
          (i) => MenuController(i(), i.args.data),
        ),
        Bind((i) => Dio(productBaseOptions)),
        Bind<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>()), export: true),
        Bind<HttpService>((i) => HttpService(httpRequest: i(), storage: i()),
            export: true),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) =>
                EmployeeMenuPage(restaurant: args.data as RestaurantEnum),
            guards: [EmployeeAuthGuard()]),
      ];
}
