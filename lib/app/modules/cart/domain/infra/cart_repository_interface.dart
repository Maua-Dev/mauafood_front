import 'package:dartz/dartz.dart';

import '../../../menu/domain/errors/errors.dart';

abstract class CartRepositoryInterface {
  Future<Either<Failure, void>> postCartDemand();
}
