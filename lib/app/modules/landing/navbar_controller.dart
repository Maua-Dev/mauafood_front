import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'navbar_controller.g.dart';

class NavigationBarController = BottomNavigationBarControllerBase
    with _$NavigationBarController;

abstract class BottomNavigationBarControllerBase with Store {
  final PageController pageController;

  BottomNavigationBarControllerBase(
      {required this.pageController});

  @observable
  int indexToShow = 1;

  @action
  void Function() toggleIndex (int index)  {
    indexToShow = index;
    throw Exception();
  }

}