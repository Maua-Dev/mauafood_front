import '../../domain/entities/product_entity.dart';
import '../../domain/errors/errors.dart';

abstract class MenuState {
  const MenuState();
}

class MenuInitialState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedSuccessState extends MenuState {
  final List<Product> listMeal;
  final int index;

  const MenuLoadedSuccessState({required this.index, required this.listMeal});
}

class MenuErrorState extends MenuState {
  final Failure failure;

  const MenuErrorState({required this.failure});
}
