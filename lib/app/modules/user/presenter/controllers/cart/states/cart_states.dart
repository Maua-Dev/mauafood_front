import 'package:mauafood_front/app/shared/infra/models/cart_product_model.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../../../../../shared/helpers/errors/errors.dart';

abstract class CartState {
  const CartState();
}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final OrderModel order;
  final List<CartProductModel> productList;

  const CartLoadedSuccessState(
      {required this.order, required this.productList});
}

class CartErrorState extends CartState {
  final Failure failure;

  const CartErrorState({required this.failure});
}
