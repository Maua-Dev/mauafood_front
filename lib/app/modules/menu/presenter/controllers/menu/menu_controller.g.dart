// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuController on MenuControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'MenuControllerBase.state', context: context);

  @override
  MenuState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(MenuState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$listAllMealAtom =
      Atom(name: 'MenuControllerBase.listAllMeal', context: context);

  @override
  List<Product> get listAllMeal {
    _$listAllMealAtom.reportRead();
    return super.listAllMeal;
  }

  @override
  set listAllMeal(List<Product> value) {
    _$listAllMealAtom.reportWrite(value, super.listAllMeal, () {
      super.listAllMeal = value;
    });
  }

  late final _$loadRestaurantMenuAsyncAction =
      AsyncAction('MenuControllerBase.loadRestaurantMenu', context: context);

  @override
  Future<void> loadRestaurantMenu() {
    return _$loadRestaurantMenuAsyncAction
        .run(() => super.loadRestaurantMenu());
  }

  late final _$searchMealAsyncAction =
      AsyncAction('MenuControllerBase.searchMeal', context: context);

  @override
  Future<void> searchMeal(String search) {
    return _$searchMealAsyncAction.run(() => super.searchMeal(search));
  }

  late final _$filterMealAsyncAction =
      AsyncAction('MenuControllerBase.filterMeal', context: context);

  @override
  Future<void> filterMeal(MealEnum mealType) {
    return _$filterMealAsyncAction.run(() => super.filterMeal(mealType));
  }

  late final _$MenuControllerBaseActionController =
      ActionController(name: 'MenuControllerBase', context: context);

  @override
  void changeState(MenuState value) {
    final _$actionInfo = _$MenuControllerBaseActionController.startAction(
        name: 'MenuControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
listAllMeal: ${listAllMeal}
    ''';
  }
}
