import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';

abstract class MenuRepositoryInterface {
  Future<Either<Failure, List<Meal>>> getBibaMeals();
  Future<Either<Failure, List<Meal>>> getHMeals();
}
