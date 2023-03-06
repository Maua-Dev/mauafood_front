import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../datasources/menu_datasource_interface.dart';

class MenuRepositoryImpl implements MenuRepositoryInterface {
  final MenuDatasourceInterface datasource;
  Map<String, dynamic> jsonAllRestaurants = {};

  MenuRepositoryImpl({required this.datasource}) {
    getAllMeals();
  }

  @override
  Future<void> getAllMeals() async {
    jsonAllRestaurants = await datasource.getAllProducts();
  }

  @override
  Future<Either<Failure, List<Meal>>> getBibaMeals() async {
    List<Meal>? restaurantProducts;
    await getAllMeals();

    try {
      restaurantProducts =
          MealModel.fromMaps(jsonAllRestaurants['SOUZA_DE_ABREU']);
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }
    return right(restaurantProducts);
  }

  @override
  Future<Either<Failure, List<Meal>>> getHMeals() async {
    List<Meal>? restaurantProducts;
    await getAllMeals();
    try {
      restaurantProducts = MealModel.fromMaps(jsonAllRestaurants['HORA_H']);
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }

    return right(restaurantProducts);
  }

  @override
  Future<Either<Failure, List<Meal>>> getMolezaMeals() async {
    List<Meal>? restaurantProducts;
    await getAllMeals();
    try {
      restaurantProducts =
          MealModel.fromMaps(jsonAllRestaurants['CANTINA_DO_MOLEZA']);
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }

    return right(restaurantProducts);
  }
}
