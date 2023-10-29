import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

import '../../../../../../shared/helpers/errors/errors.dart';
import '../../../../../../shared/infra/models/cart_product_model.dart';

abstract class ICartRepository {
  Future<Either<Failure, String>> createOrder(
      List<CartProductModel> productList, RestaurantEnum restaurant);
}
