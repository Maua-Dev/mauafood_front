import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

import '../../../../shared/helpers/errors/errors.dart';
import '../../../../shared/infra/models/cart_product_model.dart';
import '../repositories/cart_repository_interface.dart';

abstract class ICreateOrderUsecase {
  Future<Either<Failure, OrderModel>> call(
      List<CartProductModel> products, RestaurantEnum restaurant);
}

class CreateOrderUsecase implements ICreateOrderUsecase {
  final ICartRepository repository;

  CreateOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, OrderModel>> call(
      List<CartProductModel> productList, RestaurantEnum restaurant) async {
    var result = await repository.createOrder(productList, restaurant);
    return result.fold(
        (failureResult) => result, (successfullResult) => result);
  }
}
