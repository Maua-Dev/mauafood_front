import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

abstract class OrdersState {
  const OrdersState();
}

class OrdersInitialState extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedSuccessState extends OrdersState {
  final List<OrderModel> ordersList;

  const OrdersLoadedSuccessState({required this.ordersList});
}

class OrdersErrorState extends OrdersState {
  final Failure failure;

  const OrdersErrorState({required this.failure});
}
