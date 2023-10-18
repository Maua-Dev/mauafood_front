// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on CartControllerBase, Store {
  late final _$cartListAtom =
      Atom(name: 'CartControllerBase.cartList', context: context);

  @override
  List<CartProductModel> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(List<CartProductModel> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$totalPriceAtom =
      Atom(name: 'CartControllerBase.totalPrice', context: context);

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  late final _$restaurantNameAtom =
      Atom(name: 'CartControllerBase.restaurantName', context: context);

  @override
  String get restaurantName {
    _$restaurantNameAtom.reportRead();
    return super.restaurantName;
  }

  @override
  set restaurantName(String value) {
    _$restaurantNameAtom.reportWrite(value, super.restaurantName, () {
      super.restaurantName = value;
    });
  }

  late final _$CartControllerBaseActionController =
      ActionController(name: 'CartControllerBase', context: context);

  @override
  void createOrder(BuildContext context) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.createOrder');
    try {
      return super.createOrder(context);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setRestaurantName(dynamic name, dynamic product, BuildContext context) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.setRestaurantName');
    try {
      return super.setRestaurantName(name, product, context);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTotalPrice() {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.calculateTotalPrice');
    try {
      return super.calculateTotalPrice();
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProductToCart(CartProductModel? product) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.addProductToCart');
    try {
      return super.addProductToCart(product);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addQuantitytoProduct(int index) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.addQuantitytoProduct');
    try {
      return super.addQuantitytoProduct(index);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subtractQuantitytoProduct(int index) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.subtractQuantitytoProduct');
    try {
      return super.subtractQuantitytoProduct(index);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartList: ${cartList},
totalPrice: ${totalPrice},
restaurantName: ${restaurantName}
    ''';
  }
}
