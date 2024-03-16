import '../../../../shared/domain/entities/product.dart';
import '../../../../shared/helpers/errors/errors.dart';

abstract class EmployeeMenuState {
  const EmployeeMenuState();
}

class EmployeeMenuInitialState extends EmployeeMenuState {}

class EmployeeMenuLoadingState extends EmployeeMenuState {}

class EmployeeMenuLoadedSuccessState extends EmployeeMenuState {
  final List<Product> listProduct;
  final int index;

  const EmployeeMenuLoadedSuccessState(
      {required this.index, required this.listProduct});
}

class EmployeeMenuErrorState extends EmployeeMenuState {
  final Failure failure;

  const EmployeeMenuErrorState({required this.failure});
}
