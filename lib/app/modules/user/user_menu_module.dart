import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/add_favorite_product.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/remove_favorite_product.dart';
import 'package:mauafood_front/app/shared/datasource/external/http/menu_datasource.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';

import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/user/presenter/ui/pages/user_menu_page.dart';

import '../product-info/product_info_module.dart';
import '../profile/domain/repositories/favorite_repository.dart';
import '../profile/external/hive_datasource.dart';
import '../profile/infra/datasource/favorite_datasource.dart';
import '../profile/infra/repositories/favorite_repository.dart';
import '../restaurants/restaurant_module.dart';
import '../../shared/domain/repositories/menu_repository_interface.dart';
import '../../shared/infra/datasource/external/http/menu_datasource_interface.dart';
import '../../shared/infra/repositories/menu_repository.dart';

class UserMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IGetRestaurantProductUsecase>(
            (i) => GetRestaurantProductUsecase(repository: i())),
        Bind.factory<UserMenuRestaurantController>(
          (i) => UserMenuRestaurantController(i(), i.args.data, i(), i(), i()),
        ),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
        Bind<AddFavoriteProduct>(
          (i) => AddFavoriteProductImpl(i()),
        ),
        Bind<RemoveFavoriteProduct>((i) => RemoveFavoriteProductImpl(i())),
        Bind<GetFavorites>(
          (i) => GetFavoritesImpl(i()),
        ),
        Bind<FavoriteRepository>((i) => FavoriteRepositoryImpl(i())),
        Bind<FavoriteDatasource>((i) => FavoritesHiveDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: RestaurantModule(),
        ),
        ChildRoute(
          '/menu',
          child: (context, args) => const UserMenuPage(),
        ),
        ModuleRoute(
          '/product-info',
          module: ProductInfoModule(),
        ),
      ];
}
