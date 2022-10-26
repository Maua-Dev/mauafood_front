import 'package:dartz/dartz.dart';

import '../../../menu/domain/errors/errors.dart';
import '../infra/cart_repository_interface.dart';

abstract class PostCartDemandInterface {
  Future<Either<Failure, void>> call();
}

class PostCartDemandImpl implements PostCartDemandInterface {
  final CartRepositoryInterface repository;

  PostCartDemandImpl({required this.repository});

  @override
  Future<Either<Failure, void>> call() async {
    var result = await repository.postCartDemand();
    return result.fold(
        (failureResult) => result, (conclusion) => right(conclusion));
  }
}
