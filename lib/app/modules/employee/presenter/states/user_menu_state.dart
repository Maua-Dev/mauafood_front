import '../../../../shared/domain/entities/product.dart';
import '../../../../shared/helpers/errors/errors.dart';

abstract class UserMenuState {
  const UserMenuState();
}

class UserMenuInitialState extends UserMenuState {}

class UserMenuLoadingState extends UserMenuState {}

class UserMenuLoadedSuccessState extends UserMenuState {
  final List<Product> listProduct;
  final int index;

  const UserMenuLoadedSuccessState(
      {required this.index, required this.listProduct});
}

class UserMenuErrorState extends UserMenuState {
  final Failure failure;

  const UserMenuErrorState({required this.failure});
}
