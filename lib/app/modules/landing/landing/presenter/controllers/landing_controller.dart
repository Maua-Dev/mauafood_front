import 'package:mobx/mobx.dart';

part 'landing_controller.g.dart';

Map bottomNavigationItemsIcon = {
  0: 'home',
  1: 'shopping_cart_outlined',
  2: 'person_2_outlined',
  3: 'question_mark_outlined'
};
Map bottomNavigationItemsRoutes = {
  0: 'home',
  1: 'shopping_cart_outlined',
  2: 'person_2_outlined',
  3: 'question_mark_outlined'
};

// ignore: library_private_types_in_public_api
class LandingController = _LandingControllerBase with _$LandingController;

abstract class _LandingControllerBase with Store {
  @observable
  int _selectedIndex = 0;

  @action
  void selectIndex(int index) => _selectedIndex = index;

  @computed
  int get index => _selectedIndex;
}
