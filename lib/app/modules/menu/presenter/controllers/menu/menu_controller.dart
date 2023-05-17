import 'package:mauafood_front/app/modules/menu/presenter/states/menu_state.dart';
import 'package:mobx/mobx.dart';

import '../../../../restaurants/domain/infra/restaurant_enum.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../domain/enum/meal_enum.dart';
import '../../../domain/usecases/get_restaurant_meal.dart';

part 'menu_controller.g.dart';

class MenuController = MenuControllerBase with _$MenuController;

abstract class MenuControllerBase with Store {
  final GetRestaurantMealInterface _getRestaurantMeal;
  RestaurantEnum restaurantInfo;

  MenuControllerBase(this._getRestaurantMeal, this.restaurantInfo) {
    loadRestaurantMenu();
  }

  @observable
  MenuState state = MenuInitialState();

  @observable
  List<Meal> listAllMeal = [];

  @action
  void changeState(MenuState value) => state = value;

  @action
  Future<void> loadRestaurantMenu() async {
    changeState(MenuLoadingState());
    var result = await _getRestaurantMeal(restaurantInfo);
    changeState(result.fold((l) => MenuErrorState(failure: l), (list) {
      listAllMeal = list;
      return MenuLoadedSuccessState(listMeal: list, index: 0);
    }));
  }

  @action
  Future<void> searchMeal(String search) async {
    if (state is MenuLoadedSuccessState) {
      if (search == '') {
        changeState(MenuLoadedSuccessState(listMeal: listAllMeal, index: 0));
      } else {
        var list = (state as MenuLoadedSuccessState).listMeal;
        var filterList = list
            .where(
              (e) => e.name.toLowerCase().startsWith(search.toLowerCase()),
            )
            .toList();
        changeState(MenuLoadedSuccessState(listMeal: filterList, index: 0));
      }
    }
  }

  @action
  Future<void> filterMeal(MealEnum mealType) async {
    if (state is MenuLoadedSuccessState) {
      if (mealType == MealEnum.ALL) {
        changeState(MenuLoadedSuccessState(listMeal: listAllMeal, index: 0));
      } else {
        var list = (state as MenuLoadedSuccessState).listMeal;
        var filterList = list
            .where(
              (e) => e.type == mealType,
            )
            .toList();
        changeState(MenuLoadedSuccessState(
            listMeal: filterList, index: mealType.index));
      }
    }
  }
}
