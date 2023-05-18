import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';

abstract class MenuRepositoryInterface {
  Future<void> getAllMeals();
  Future<Either<Failure, List<Product>>> getBibaMeals();
  Future<Either<Failure, List<Product>>> getHMeals();
  Future<Either<Failure, List<Product>>> getMolezaMeals();
}
