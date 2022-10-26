import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';

import '../../../menu/domain/errors/errors.dart';
import '../infra/cart_repository_interface.dart';

abstract class PostCartDemandInterface {
  Future<Either<Failure, bool>> call(List<CartItemModel> list);
}

class PostCartDemandImpl implements PostCartDemandInterface {
  final CartRepositoryInterface repository;

  PostCartDemandImpl({required this.repository});

  @override
  Future<Either<Failure, bool>> call(List<CartItemModel> list) async {
    var result = await repository.postCartDemand(list);
    return result.fold(
        (failureResult) => result, (conclusion) => right(conclusion));
  }
}
