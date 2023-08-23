import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/modules/user/domain/entities/user.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';

import '../../../../../generated/l10n.dart';

part 'landing_controller.g.dart';

// ignore: library_private_types_in_public_api
class LandingController = _LandingControllerBase with _$LandingController;

abstract class _LandingControllerBase with Store {
  final UserController _userController;

  _LandingControllerBase(this._userController) {
    if (_userController.isLogged) {
      loadUser();
      checkFirstUse();
    } else {
      Modular.to.navigate('./restaurants/');
      loading = false;
    }
  }
  @computed
  bool get isLogged => _userController.isLogged;
  @observable
  bool loading = true;
  @observable
  bool isFirstUse = false;
  @computed
  bool get isUser => user?.isUser ?? true;
  @computed
  bool get isEmployee => user?.isEmployee ?? false;

  @observable
  User? user;

  @observable
  int _selectedIndex = 0;

  @action
  void selectIndex(int index) => _selectedIndex = index;

  @computed
  int get index => _selectedIndex;
  final _navbarUser = [
    {
      'icon': FontAwesomeIcons.house,
      'title': S.current.home,
      'route': '/landing/restaurants/',
    },
    {
      'icon': FontAwesomeIcons.cartPlus,
      'title': S.current.cart,
      'route': '/landing/cart/',
    },
    {
      'icon': FontAwesomeIcons.user,
      'title': S.current.profile,
      'route': '/landing/profile/',
    },
    {
      'icon': FontAwesomeIcons.circleQuestion,
      'title': S.current.help,
      'route': '/landing/faq/',
    },
  ];
  final _navbarEmployee = [
    {
      'icon': FontAwesomeIcons.house,
      'title': S.current.home,
      'route': '/landing/employee/',
    },
    {
      'icon': FontAwesomeIcons.barsStaggered,
      'title': S.current.orders,
      'route': '/landing/orders/',
    },
    {
      'icon': FontAwesomeIcons.user,
      'title': S.current.profile,
      'route': '/landing/profile/',
    },
  ];

  @computed
  List<Map<String, dynamic>> get navbar =>
      isEmployee ? _navbarEmployee : _navbarUser;

  Future<void> loadUser() async {
    loading = true;
    await _userController.loadUser();
    user = _userController.user;
    isEmployee
        ? Modular.to.navigate('./employee/')
        : Modular.to.navigate('./restaurants/');
    loading = false;
  }

  Future<void> checkFirstUse() async {
    isFirstUse = await _userController.isFirstUse();
  }
}
