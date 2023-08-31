import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/product-info/presenter/ui/pages/product_info_page.dart';
import 'package:mauafood_front/app/modules/profile/domain/repositories/favorites_repositorie_interface.dart';
import 'package:mauafood_front/app/modules/profile/domain/repositories/favoritories_repositorie.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/add_favorite_usecase.dart';
import 'package:mauafood_front/app/modules/profile/external/hive_datasource.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

class ProductInfoModule extends Module {
  late Product productInfo;
  @override
  List<Bind> get binds => [
        Bind<Product>((i) => productInfo),
        Bind<AddFavoriteUsecase>(
            (i) => AddFavoriteUsecaseImpl(repository: i())),
        Bind<FavoritesRepository>(
            (i) => FavoritoriesRepositoryImpl(favDatasource: i())),
        AsyncBind<HiveDatasource>((i) => HiveDatasource.instance(i())),
        Bind.factory<UserMenuRestaurantController>(
          (i) => UserMenuRestaurantController(
              i(), RestaurantEnum.souza_de_abreu, i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => ProductInfoPage(
            productInfo: args.data[0],
            recommendedProductList: args.data[1],
          ),
        ),
      ];
}
