import 'package:flutter_modular/flutter_modular.dart';

import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites_product.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/remove_favorite_product.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/favorites_controller.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/order_status_controller.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/pages/favorites_page.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/pages/order_status_page.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/pages/profile_page.dart';
import 'package:mauafood_front/app/modules/user/domain/usecases/update_user.dart';
import 'package:mauafood_front/app/shared/datasource/external/http/menu_datasource.dart';
import 'package:mauafood_front/app/shared/datasource/external/http/orders_datasource.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/abort_order_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_current_order_state_by_id_usecase.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/menu_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/orders_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/repositories/menu_repository.dart';
import 'package:mauafood_front/app/shared/infra/repositories/orders_repository.dart';

import 'domain/repositories/favorite_repository.dart';
import 'infra/datasource/favorite_datasource.dart';
import 'infra/repositories/favorite_repository.dart';
import 'presenter/controllers/profile_controller.dart';
import 'external/hive_datasource.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
        Bind<IOrdersDatasource>((i) => OrdersDatasource(i())),
        Bind<MenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IOrdersRepository>((i) => OrdersRepository(i())),
        Bind<FavoriteRepository>((i) => FavoriteRepositoryImpl(i())),
        Bind<GetFavoritesProduct>((i) => GetFavoritesProductImpl(i(), i())),
        Bind<RemoveFavoriteProduct>(((i) => RemoveFavoriteProductImpl(i()))),
        Bind((i) => UpdatePhotoImpl(i())),
        Bind.lazySingleton((i) => ProfileController(i(), i())),
        Bind<FavoriteDatasource>((i) => FavoritesHiveDatasource(i())),
        Bind(
          (i) => FavoritesController(i()),
        ),
        Bind<IGetCurrentOrderStateByIdUsecase>(
            ((i) => GetCurrentOrderStateByIdUsecase(repository: i()))),
        Bind<IAbortOrderUsecase>(((i) => AbortOrderUsecase(repository: i()))),
        Bind<OrderStatusController>(((i) => OrderStatusController(i(), i())))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const ProfilePage(),
        ),
        ChildRoute('/favorites/',
            child: (context, args) => const FavoritesPage()),
        ChildRoute("/order-status/",
            child: ((context, args) => const OrderStatusPage()))
      ];
}
