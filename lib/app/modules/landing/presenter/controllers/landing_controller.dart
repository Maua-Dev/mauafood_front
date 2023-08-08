import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';

part 'landing_controller.g.dart';

// ignore: library_private_types_in_public_api
class LandingController = _LandingControllerBase with _$LandingController;

abstract class _LandingControllerBase with Store {
  final UserController _userController;

  _LandingControllerBase(this._userController);

  @computed
  bool get isUser => _userController.user?.isUser ?? false;
  @computed
  bool get isEmployee => _userController.user?.isEmployee ?? false;

  @observable
  int _selectedIndex = 0;

  @action
  void selectIndex(int index) => _selectedIndex = index;

  @computed
  int get index => _selectedIndex;
}
