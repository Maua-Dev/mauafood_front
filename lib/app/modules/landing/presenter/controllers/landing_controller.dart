import 'dart:async';

import 'package:flutter/material.dart';
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

  _LandingControllerBase(this._userController);

  @computed
  bool get isUser => _userController.user?.isUser ?? false;
  @computed
  bool get isEmployee => _userController.user?.isEmployee ?? false;

  @computed
  User? get user => _userController.user;

  @observable
  int _selectedIndex = 0;

  @action
  void selectIndex(int index) => _selectedIndex = index;

  @computed
  int get index => _selectedIndex;

  final _navbarUser = {
    0: {
      'icon': FontAwesomeIcons.house,
      'title': S.current.home,
      'route': '/landing/restaurants/',
    },
    1: {
      'icon': FontAwesomeIcons.cartPlus,
      'title': S.current.cart,
      'route': '/landing/cart/',
    },
    2: {
      'icon': Icons.person_outline_outlined,
      'title': S.current.profile,
      'route': '/landing/profile/',
    },
    3: {
      'icon': FontAwesomeIcons.circleQuestion,
      'title': S.current.help,
      'route': '/landing/faq/',
    },
  };
  final _navbarEmployee = {
    0: {
      'icon': FontAwesomeIcons.house,
      'title': S.current.home,
      'route': '/landing/employee/',
    },
    1: {
      'icon': FontAwesomeIcons.barsStaggered,
      'title': S.current.orders,
      'route': '/landing/orders/',
    },
    2: {
      'icon': Icons.person_outline_outlined,
      'title': S.current.profile,
      'route': '/landing/profile/',
    },
  };
  @computed
  Map<int, Map<String, dynamic>> get navbar =>
      isEmployee ? _navbarEmployee : _navbarUser;
}
