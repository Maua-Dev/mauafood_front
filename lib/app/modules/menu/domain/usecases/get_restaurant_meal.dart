import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';

import '../errors/errors.dart';
import '../infra/menu_repository_interface.dart';

abstract class GetRestaurantMealInterface {
  Future<Either<Failure, List<Meal>>> call();
}

class GetRestaurantMealBibaImpl implements GetRestaurantMealInterface {
  final MenuRepositoryInterface repository;

  GetRestaurantMealBibaImpl({required this.repository});

  @override
  Future<Either<Failure, List<Meal>>> call() async {
    var result = await repository.getBibaMeals();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: 'Lista vazia'),
      );
    });
  }
}

class GetRestaurantMealHImpl implements GetRestaurantMealInterface {
  final MenuRepositoryInterface repository;

  GetRestaurantMealHImpl({required this.repository});

  @override
  Future<Either<Failure, List<Meal>>> call() async {
    var result = await repository.getHMeals();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: 'Lista vazia'),
      );
    });
  }
}
