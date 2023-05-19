import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/product_model.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../datasources/menu_datasource_interface.dart';

class MenuRepository implements IMenuRepository {
  final IMenuDatasource datasource;
  Map<String, dynamic> jsonAllRestaurants = {};

  MenuRepository({required this.datasource}) {
    getAllProducts();
  }

  @override
  Future<void> getAllProducts() async {
    jsonAllRestaurants = await datasource.getAllProducts();
  }

  @override
  Future<Either<Failure, List<Product>>> getBibaProducts() async {
    List<Product>? restaurantProducts;
    await getAllProducts();

    try {
      restaurantProducts =
          ProductModel.fromMaps(jsonAllRestaurants['SOUZA_DE_ABREU']);
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }
    return right(restaurantProducts);
  }

  @override
  Future<Either<Failure, List<Product>>> getHoraHProducts() async {
    List<Product>? restaurantProducts;
    await getAllProducts();
    try {
      restaurantProducts = ProductModel.fromMaps(jsonAllRestaurants['HORA_H']);
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }

    return right(restaurantProducts);
  }

  @override
  Future<Either<Failure, List<Product>>> getMolezaProducts() async {
    List<Product>? restaurantProducts;
    await getAllProducts();
    try {
      restaurantProducts =
          ProductModel.fromMaps(jsonAllRestaurants['CANTINA_DO_MOLEZA']);
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }

    return right(restaurantProducts);
  }
}
