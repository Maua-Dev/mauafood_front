import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

abstract class OrderStatusState {
  const OrderStatusState();
}

class InitialOrderStatusState implements OrderStatusState {
  const InitialOrderStatusState();
}

class LoadingOrderStatusState implements OrderStatusState {
  const LoadingOrderStatusState();
}

class SuccessOrderStatusState implements OrderStatusState {
  final OrderStatusModel order;
  const SuccessOrderStatusState(this.order);
}

class ErrorOrderStatusState implements OrderStatusState {
  final String message;
  const ErrorOrderStatusState(this.message);
}
