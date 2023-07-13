// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_menu_restaurant_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserMenuRestaurantController on MenuRestaurantControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'MenuRestaurantControllerBase.state', context: context);

  @override
  UserMenuState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UserMenuState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$listAllProductAtom = Atom(
      name: 'MenuRestaurantControllerBase.listAllProduct', context: context);

  @override
  List<Product> get listAllProduct {
    _$listAllProductAtom.reportRead();
    return super.listAllProduct;
  }

  @override
  set listAllProduct(List<Product> value) {
    _$listAllProductAtom.reportWrite(value, super.listAllProduct, () {
      super.listAllProduct = value;
    });
  }

  late final _$listAllProductWithoutAccentAtom = Atom(
      name: 'MenuRestaurantControllerBase.listAllProductWithoutAccent',
      context: context);

  @override
  List<Product> get listAllProductWithoutAccent {
    _$listAllProductWithoutAccentAtom.reportRead();
    return super.listAllProductWithoutAccent;
  }

  @override
  set listAllProductWithoutAccent(List<Product> value) {
    _$listAllProductWithoutAccentAtom
        .reportWrite(value, super.listAllProductWithoutAccent, () {
      super.listAllProductWithoutAccent = value;
    });
  }

  late final _$loadRestaurantMenuAsyncAction = AsyncAction(
      'MenuRestaurantControllerBase.loadRestaurantMenu',
      context: context);

  @override
  Future<void> loadRestaurantMenu() {
    return _$loadRestaurantMenuAsyncAction
        .run(() => super.loadRestaurantMenu());
  }

  late final _$searchProductAsyncAction = AsyncAction(
      'MenuRestaurantControllerBase.searchProduct',
      context: context);

  @override
  Future<void> searchProduct(String search) {
    return _$searchProductAsyncAction.run(() => super.searchProduct(search));
  }

  late final _$filterProductAsyncAction = AsyncAction(
      'MenuRestaurantControllerBase.filterProduct',
      context: context);

  @override
  Future<void> filterProduct(ProductEnum productType) {
    return _$filterProductAsyncAction
        .run(() => super.filterProduct(productType));
  }

  late final _$MenuRestaurantControllerBaseActionController =
      ActionController(name: 'MenuRestaurantControllerBase', context: context);

  @override
  void changeState(UserMenuState value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
listAllProduct: ${listAllProduct},
listAllProductWithoutAccent: ${listAllProductWithoutAccent}
    ''';
  }
}
