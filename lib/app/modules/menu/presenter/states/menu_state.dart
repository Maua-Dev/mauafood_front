import '../../domain/entities/product.dart';
import '../../domain/errors/errors.dart';

abstract class MenuState {
  const MenuState();
}

class MenuInitialState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedSuccessState extends MenuState {
  final List<Product> listProduct;
  final int index;

  const MenuLoadedSuccessState(
      {required this.index, required this.listProduct});
}

class MenuErrorState extends MenuState {
  final Failure failure;

  const MenuErrorState({required this.failure});
}
