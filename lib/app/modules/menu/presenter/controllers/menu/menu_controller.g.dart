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

  late final _$listAllProductAtom =
      Atom(name: 'MenuControllerBase.listAllProduct', context: context);

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

  late final _$loadRestaurantMenuAsyncAction =
      AsyncAction('MenuControllerBase.loadRestaurantMenu', context: context);

  @override
  Future<void> loadRestaurantMenu() {
    return _$loadRestaurantMenuAsyncAction
        .run(() => super.loadRestaurantMenu());
  }

  late final _$searchProductAsyncAction =
      AsyncAction('MenuControllerBase.searchProduct', context: context);

  @override
  Future<void> searchProduct(String search) {
    return _$searchProductAsyncAction.run(() => super.searchProduct(search));
  }

  late final _$filterProductAsyncAction =
      AsyncAction('MenuControllerBase.filterProduct', context: context);

  @override
  Future<void> filterProduct(ProductEnum productType) {
    return _$filterProductAsyncAction
        .run(() => super.filterProduct(productType));
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
listAllProduct: ${listAllProduct}
    ''';
  }
}
