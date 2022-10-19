// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mauafood_front/app/modules/menu/domain/enum/meal_enum.dart';

import '../../domain/entities/meal_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/get_restaurant_meal.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetRestaurantMealInterface getRestaurantMeal;
  late Either<Failure, List<Meal>> eitherListMeal;

  MenuBloc({required this.getRestaurantMeal}) : super(MenuInitialState()) {
    on<GetAllMealsEvent>(_loadAllMeal);
    on<SearchMealEvent>(_searchMeal);
    on<FilterMealTypeEvent>(_filterMeal);
  }

  void _loadAllMeal(GetAllMealsEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoadingState());
    eitherListMeal = await getRestaurantMeal();
    emit(
      eitherListMeal.fold(
        (failure) => MenuErrorState(failure: failure),
        (list) {
          return MenuLoadedSuccessState(listMeal: list, index: 0);
        },
      ),
    );
  }

  void _searchMeal(SearchMealEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoadingState());
    if (eitherListMeal.fold(
        (failure) => failure.message.isEmpty, (list) => list.isNotEmpty)) {
      eitherListMeal = await getRestaurantMeal();
    }
    emit(
      eitherListMeal.fold(
        (failure) => MenuErrorState(failure: failure),
        (list) {
          var filterList = list
              .where(
                (e) => e.name.startsWith(event.search),
              )
              .toList();
          return MenuLoadedSuccessState(listMeal: filterList, index: 0);
        },
      ),
    );
  }

  void _filterMeal(FilterMealTypeEvent event, Emitter<MenuState> emit) async {
    emit(MenuLoadingState());
    if (eitherListMeal.fold(
        (failure) => failure.message.isEmpty, (list) => list.isNotEmpty)) {
      eitherListMeal = await getRestaurantMeal();
    }
    emit(
      eitherListMeal.fold(
        (failure) => MenuErrorState(failure: failure),
        (list) {
          var filterList = list
              .where(
                (e) => e.type == event.mealType,
              )
              .toList();
          return MenuLoadedSuccessState(
              listMeal: filterList, index: event.mealType.index);
        },
      ),
    );
  }
}
