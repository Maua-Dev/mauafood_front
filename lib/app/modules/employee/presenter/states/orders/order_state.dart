import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class OrderState {
  const OrderState();
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {
  final int index;

  const OrderLoadingState(this.index);
}

class OrderLoadedSuccessState extends OrderState {}

class OrderErrorState extends OrderState {
  final Failure failure;

  const OrderErrorState({required this.failure});
}
