import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

abstract class ProductCardEmployeeState {
  const ProductCardEmployeeState();
}

class ProductCardEmployeeInitialState extends ProductCardEmployeeState {}

class ProductCardEmployeeLoadingState extends ProductCardEmployeeState {
  final int index;

  const ProductCardEmployeeLoadingState({required this.index});
}

class ProductCardEmployeeSuccessState extends ProductCardEmployeeState {}

class ProductCardEmployeeFailureState extends ProductCardEmployeeState {
  final Failure failure;

  const ProductCardEmployeeFailureState({required this.failure});
}
