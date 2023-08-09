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

  final _navbarUser = {
    0: {
      'icon': 'home',
      'title': 'Home',
      'route': '/landing/restaurants/',
    },
    1: {
      'icon': 'cart',
      'title': 'Cart',
      'route': '/landing/cart/',
    },
    2: {
      'icon': 'user',
      'title': 'Profile',
      'route': '/landing/profile/',
    },
    3: {
      'icon': 'question',
      'title': 'FAQ',
      'route': '/landing/faq/',
    },
  };
  final _navbarEmployee = {
    0: {
      'icon': 'home',
      'title': 'Home',
      'route': '/landing/employee/',
    },
    1: {
      'icon': 'orders',
      'title': 'orders',
      'route': '/landing/orders/',
    },
    2: {
      'icon': 'user',
      'title': 'Profile',
      'route': '/landing/profile/',
    },
  };
  @computed
  Map<int, Map<String, String>> get navbar =>
      isUser ? _navbarUser : _navbarEmployee;
}
