// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_menu_restaurant_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeMenuRestaurantController
    on MenuRestaurantControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'MenuRestaurantControllerBase.state', context: context);

  @override
  EmployeeMenuState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(EmployeeMenuState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$productCardStateAtom = Atom(
      name: 'MenuRestaurantControllerBase.productCardState', context: context);

  @override
  ProductCardEmployeeState get productCardState {
    _$productCardStateAtom.reportRead();
    return super.productCardState;
  }

  @override
  set productCardState(ProductCardEmployeeState value) {
    _$productCardStateAtom.reportWrite(value, super.productCardState, () {
      super.productCardState = value;
    });
  }

  late final _$listAllProductAtom = Atom(
      name: 'MenuRestaurantControllerBase.listAllProduct', context: context);

  @override
  List<ProductModel> get listAllProduct {
    _$listAllProductAtom.reportRead();
    return super.listAllProduct;
  }

  @override
  set listAllProduct(List<ProductModel> value) {
    _$listAllProductAtom.reportWrite(value, super.listAllProduct, () {
      super.listAllProduct = value;
    });
  }

  late final _$listAllProductWithoutAccentAtom = Atom(
      name: 'MenuRestaurantControllerBase.listAllProductWithoutAccent',
      context: context);

  @override
  List<ProductModel> get listAllProductWithoutAccent {
    _$listAllProductWithoutAccentAtom.reportRead();
    return super.listAllProductWithoutAccent;
  }

  @override
  set listAllProductWithoutAccent(List<ProductModel> value) {
    _$listAllProductWithoutAccentAtom
        .reportWrite(value, super.listAllProductWithoutAccent, () {
      super.listAllProductWithoutAccent = value;
    });
  }

  late final _$isMaxPriceSearchAtom = Atom(
      name: 'MenuRestaurantControllerBase.isMaxPriceSearch', context: context);

  @override
  bool get isMaxPriceSearch {
    _$isMaxPriceSearchAtom.reportRead();
    return super.isMaxPriceSearch;
  }

  @override
  set isMaxPriceSearch(bool value) {
    _$isMaxPriceSearchAtom.reportWrite(value, super.isMaxPriceSearch, () {
      super.isMaxPriceSearch = value;
    });
  }

  late final _$isMinPriceSearchAtom = Atom(
      name: 'MenuRestaurantControllerBase.isMinPriceSearch', context: context);

  @override
  bool get isMinPriceSearch {
    _$isMinPriceSearchAtom.reportRead();
    return super.isMinPriceSearch;
  }

  @override
  set isMinPriceSearch(bool value) {
    _$isMinPriceSearchAtom.reportWrite(value, super.isMinPriceSearch, () {
      super.isMinPriceSearch = value;
    });
  }

  late final _$rangeValuesAtom =
      Atom(name: 'MenuRestaurantControllerBase.rangeValues', context: context);

  @override
  RangeValues? get rangeValues {
    _$rangeValuesAtom.reportRead();
    return super.rangeValues;
  }

  @override
  set rangeValues(RangeValues? value) {
    _$rangeValuesAtom.reportWrite(value, super.rangeValues, () {
      super.rangeValues = value;
    });
  }

  late final _$searchAtom =
      Atom(name: 'MenuRestaurantControllerBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$indexAtom =
      Atom(name: 'MenuRestaurantControllerBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$productTypeAtom =
      Atom(name: 'MenuRestaurantControllerBase.productType', context: context);

  @override
  ProductEnum get productType {
    _$productTypeAtom.reportRead();
    return super.productType;
  }

  @override
  set productType(ProductEnum value) {
    _$productTypeAtom.reportWrite(value, super.productType, () {
      super.productType = value;
    });
  }

  late final _$isUserMenuAtom =
      Atom(name: 'MenuRestaurantControllerBase.isUserMenu', context: context);

  @override
  bool get isUserMenu {
    _$isUserMenuAtom.reportRead();
    return super.isUserMenu;
  }

  @override
  set isUserMenu(bool value) {
    _$isUserMenuAtom.reportWrite(value, super.isUserMenu, () {
      super.isUserMenu = value;
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

  late final _$deleteProductAsyncAction = AsyncAction(
      'MenuRestaurantControllerBase.deleteProduct',
      context: context);

  @override
  Future<void> deleteProduct(RestaurantEnum restaurant, String id, int index) {
    return _$deleteProductAsyncAction
        .run(() => super.deleteProduct(restaurant, id, index));
  }

  late final _$MenuRestaurantControllerBaseActionController =
      ActionController(name: 'MenuRestaurantControllerBase', context: context);

  @override
  void setIsMaxPriceSearch(bool value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.setIsMaxPriceSearch');
    try {
      return super.setIsMaxPriceSearch(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsMinPriceSearch(bool value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.setIsMinPriceSearch');
    try {
      return super.setIsMinPriceSearch(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRangeValues(RangeValues value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.setRangeValues');
    try {
      return super.setRangeValues(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndex(int value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductType(ProductEnum value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.setProductType');
    try {
      return super.setProductType(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeState(EmployeeMenuState value) {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeProductCardState(ProductCardEmployeeState value) {
    final _$actionInfo =
        _$MenuRestaurantControllerBaseActionController.startAction(
            name: 'MenuRestaurantControllerBase.changeProductCardState');
    try {
      return super.changeProductCardState(value);
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterProduct() {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.filterProduct');
    try {
      return super.filterProduct();
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanFilter() {
    final _$actionInfo = _$MenuRestaurantControllerBaseActionController
        .startAction(name: 'MenuRestaurantControllerBase.cleanFilter');
    try {
      return super.cleanFilter();
    } finally {
      _$MenuRestaurantControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
productCardState: ${productCardState},
listAllProduct: ${listAllProduct},
listAllProductWithoutAccent: ${listAllProductWithoutAccent},
isMaxPriceSearch: ${isMaxPriceSearch},
isMinPriceSearch: ${isMinPriceSearch},
rangeValues: ${rangeValues},
search: ${search},
index: ${index},
productType: ${productType},
isUserMenu: ${isUserMenu}
    ''';
  }
}
