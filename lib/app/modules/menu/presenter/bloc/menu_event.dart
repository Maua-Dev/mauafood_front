part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class GetAllMealsEvent extends MenuEvent {}

class SearchMealEvent extends MenuEvent {
  final String search;

  const SearchMealEvent({required this.search});

  @override
  List<Object> get props => [search];
}

class FilterMealTypeEvent extends MenuEvent {
  final MealEnum mealType;

  const FilterMealTypeEvent({required this.mealType});

  @override
  List<Object> get props => [mealType];
}

class ChangeRestaurantEvent extends MenuEvent {
  final RestaurantEnum restaurantEnum;

  const ChangeRestaurantEvent({required this.restaurantEnum});

  @override
  List<Object> get props => [restaurantEnum];
}
