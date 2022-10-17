import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';

import '../errors/errors.dart';
import '../infra/menu_repository_interface.dart';

abstract class GetMealInterface {
  Future<Either<Failure, List<Meal>>> call();
}

class GetMeal implements GetMealInterface {
  final MenuRepositoryInterface repository;

  GetMeal({required this.repository});

  @override
  Future<Either<Failure, List<Meal>>> call() async {
    var result = await repository.getAllMeals();
    return result.fold(
        (failure) =>
            left(DatasourceResultNull(message: 'Dados retornaram nulos')),
        (r) async {
      var result = await repository.getAllMeals();
      return result.where(
          (r) => r.isNotEmpty, () => EmptyList(message: 'Lista vazia'));
    });
  }
}
