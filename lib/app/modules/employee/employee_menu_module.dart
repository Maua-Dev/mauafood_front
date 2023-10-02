import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/pages/employee_menu_page.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/pages/orders_page.dart';
import 'package:mauafood_front/app/shared/datasource/external/http/orders_datasource.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/abort_order_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/change_order_status_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/delete_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_all_active_orders.dart';
import 'package:mauafood_front/app/shared/domain/usecases/update_product_usecase.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/orders_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/repositories/orders_repository.dart';

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
          (i) => EmployeeMenuRestaurantController(
              i(), RestaurantEnum.cantina_do_moleza, i(), i()),
        ),
        Bind<OrdersController>(
          (i) => OrdersController(i(), i(), i()),
        ),
        Bind.factory<ProductFormController>(
          (i) => ProductFormController(i(), i(), i()),
        ),
        Bind<ICreateProductUsecase>(
            (i) => CreateProductUsecase(repository: i())),
        Bind<IUpdateProductUsecase>(
            (i) => UpdateProductUsecase(repository: i())),
        Bind<IDeleteProductUsecase>(
            (i) => DeleteProductUsecase(repository: i())),
        Bind<IGetAllActiveOrdersUsecase>(
            (i) => GetAllActiveOrdersUsecase(repository: i())),
        Bind<IChangeOrderStatusUsecase>(
            (i) => ChangeOrderStatusUsecase(repository: i())),
        Bind<IAbortOrderUsecase>((i) => AbortOrderUsecase(repository: i())),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IOrdersRepository>((i) => OrdersRepository(i())),
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
        Bind<IOrdersDatasource>((i) => OrdersDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const EmployeeMenuPage(
              restaurant: RestaurantEnum.cantina_do_moleza),
        ),
        ChildRoute('/orders/', child: (_, args) => OrdersPage())
      ];
}
