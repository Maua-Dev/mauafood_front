import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../datasources/menu_datasource_interface.dart';

class MenuRepositoryImpl implements MenuRepositoryInterface {
  final MenuDatasourceInterface datasource;

  MenuRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<Meal>>> getBibaMeals() async {
    List<Meal>? list;
    try {
      list = await datasource.readJsonBiba();
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }

    return right(list);
  }

  @override
  Future<Either<Failure, List<Meal>>> getHMeals() async {
    List<Meal>? list;
    try {
      list = await datasource.readJsonH();
    } catch (e) {
      return left(DatasourceResultNull(message: S.current.errorItemNotFound));
    }

    return right(list);
  }
}
