import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/product.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';

abstract class MenuRepositoryInterface {
  Future<void> getAllProducts();
  Future<Either<Failure, List<Product>>> getBibaProducts();
  Future<Either<Failure, List<Product>>> getHoraHProducts();
  Future<Either<Failure, List<Product>>> getMolezaProducts();
}
