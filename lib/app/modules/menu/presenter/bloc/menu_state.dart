part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitialState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedSuccessState extends MenuState {
  final List<Meal> listMeal;
  final int index;

  const MenuLoadedSuccessState({required this.index, required this.listMeal});

  @override
  List<Object> get props => [listMeal, index];
}

class MenuErrorState extends MenuState {
  final Failure failure;

  const MenuErrorState({required this.failure});

  @override
  List<Object> get props => [failure];
}
