import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/pages/employee_menu_page.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/delete_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/update_product_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/services/dio/options/product_base_options.dart';
import '../../shared/helpers/services/dio/dio_http_request.dart';
import '../../shared/helpers/services/http/http_request_interface.dart';
import '../../shared/helpers/services/http_service.dart';
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
        Bind<EmployeeMenuRestaurantController>(
          (i) => EmployeeMenuRestaurantController(i(), i.args.data, i()),
        ),
        Bind.factory<ProductFormController>(
          (i) => ProductFormController(i(), i()),
        ),
        Bind<ICreateProductUsecase>(
            (i) => CreateProductUsecase(repository: i())),
        Bind<IUpdateProductUsecase>(
            (i) => UpdateProductUsecase(repository: i())),
        Bind<IDeleteProductUsecase>(
            (i) => DeleteProductUsecase(repository: i())),
        Bind((i) => Dio(productBaseOptions)),
        Bind<IHttpRequest>((i) => DioHttpRequest(dio: i<Dio>()), export: true),
        Bind<HttpService>((i) => HttpService(httpRequest: i()), export: true),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) =>
              EmployeeMenuPage(restaurant: args.data as RestaurantEnum),
          //guards: [EmployeeAuthGuard()]),
        )
      ];
}
