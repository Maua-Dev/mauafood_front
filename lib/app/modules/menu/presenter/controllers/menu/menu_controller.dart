import 'package:mauafood_front/app/modules/menu/presenter/ui/states/menu_state.dart';
import 'package:mobx/mobx.dart';

import '../../../../restaurants/domain/infra/restaurant_enum.dart';
import '../../../domain/enum/meal_enum.dart';
import '../../../domain/usecases/get_restaurant_meal.dart';

part 'menu_controller.g.dart';

class MenuController = MenuControllerBase with _$MenuController;

abstract class MenuControllerBase with Store {
  final GetRestaurantMealInterface getRestaurantMeal;
  RestaurantEnum restaurantInfo;

  MenuControllerBase(
      {required this.getRestaurantMeal, required this.restaurantInfo});

  @observable
  MenuState state = MenuInitialState();

  @action
  void changeState(MenuState value) => state = value;

  @action
  Future<void> loadRestaurantMenu() async {
    changeState(MenuLoadingState());
    var result = await getRestaurantMeal(restaurantInfo);
    changeState(result.fold((l) => MenuErrorState(failure: l),
        (list) => MenuLoadedSuccessState(listMeal: list, index: 0)));
  }

  @action
  Future<void> searchMeal(String search) async {
    if (state is MenuLoadedSuccessState) {
      var list = (state as MenuLoadedSuccessState).listMeal;
      var filterList = list
          .where(
            (e) => e.name.toLowerCase().startsWith(search.toLowerCase()),
          )
          .toList();
      changeState(MenuLoadedSuccessState(listMeal: filterList, index: 0));
    }
  }

  @action
  Future<void> filterMeal(MealEnum mealType) async {
    if (state is MenuLoadedSuccessState) {
      var list = (state as MenuLoadedSuccessState).listMeal;
      var filterList = list
          .where(
            (e) => e.type == mealType,
          )
          .toList();
      changeState(
          MenuLoadedSuccessState(listMeal: filterList, index: mealType.index));
    }
  }
}
