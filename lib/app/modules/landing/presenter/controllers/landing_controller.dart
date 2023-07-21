import 'package:mobx/mobx.dart';

part 'landing_controller.g.dart';

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
