import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';

import '../datasources/menu_datasource_interface.dart';

class MenuRepositoryImpl implements MenuRepositoryInterface {
  final MenuDatasourceInterface datasource;

  MenuRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<Meal>>> getAllMeals() async {
    List<Meal>? list;
    try {
      list = await datasource.readJson();
    } catch (e) {
      return left(DatasourceResultNull(message: 'Json retornou nulo'));
    }

    return right(list);
  }
}
