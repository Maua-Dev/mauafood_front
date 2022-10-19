import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';

import '../errors/errors.dart';
import '../infra/menu_repository_interface.dart';

abstract class GetRestaurantMealInterface {
  Future<Either<Failure, List<Meal>>> call();
}

class GetRestaurantMealImpl implements GetRestaurantMealInterface {
  final MenuRepositoryInterface repository;

  GetRestaurantMealImpl({required this.repository});

  @override
  Future<Either<Failure, List<Meal>>> call() async {
    var result = await repository.getAllMeals();
    return result.fold((failureResult) => result, (listResult) async {
      return result.where(
        (r) => r.isNotEmpty,
        () => EmptyList(message: 'Lista vazia'),
      );
    });
  }
}
