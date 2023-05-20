import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class IMenuRepository {
  Future<void> getAllProducts();
  Future<Either<Failure, List<Product>>> getBibaProducts();
  Future<Either<Failure, List<Product>>> getHoraHProducts();
  Future<Either<Failure, List<Product>>> getMolezaProducts();
}