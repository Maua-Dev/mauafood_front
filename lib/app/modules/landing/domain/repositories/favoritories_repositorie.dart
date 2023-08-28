import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/landing/domain/repositories/favorites_repositorie_interface.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant_product_usecase.dart';

import '../../../../shared/helpers/errors/errors.dart';
import '../../../profile/external/hive_datasource.dart';

class FavoritoriesRepositoryImpl implements FavoritesRepository {
  final HiveDatasource favDatasource;
  final IGetRestaurantProductUsecase getProducts;

  FavoritoriesRepositoryImpl(
      {required this.favDatasource, required this.getProducts});

  List<Product>? favoritesList;

  @override
  Future<Either<Failure, String>> addFavorite(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Product>>> getFavorites() async {
    var idList = await favDatasource.getFavorites();
    List<Product> favoritesList = [];
    List<Product> allProducts = [];
    var moleza = await getProducts(RestaurantEnum.cantina_do_moleza);
    var hora = await getProducts(RestaurantEnum.hora_h);
    var abreu = await getProducts(RestaurantEnum.souza_de_abreu);

    moleza.fold((l) => null, (r) => allProducts = r);
    hora.fold((l) => null, (r) => allProducts = allProducts + r);
    abreu.fold((l) => null, (r) => allProducts = allProducts + r);

    for (var product in allProducts) {
      for (var id in idList) {
        if (product.id == id) {
          favoritesList.add(product);
        }
      }
    }

    return favoritesList.isEmpty
        ? left(Failure(message: "Não existem produtos favoritos"))
        : right(favoritesList);
  }

  @override
  Future<Either<Failure, String>> removeFavorite(String id) {
    throw UnimplementedError();
  }
}
