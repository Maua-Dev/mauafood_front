import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';

import '../../../menu/domain/errors/errors.dart';

abstract class CartRepositoryInterface {
  Future<Either<Failure, bool>> postCartDemand(List<CartItemModel> list);
}
