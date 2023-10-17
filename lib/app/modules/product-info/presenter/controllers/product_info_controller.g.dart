// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductInfoController on ProductInfoControllerBase, Store {
  late final _$productCartAtom =
      Atom(name: 'ProductInfoControllerBase.productCart', context: context);

  @override
  CartProductModel get productCart {
    _$productCartAtom.reportRead();
    return super.productCart;
  }

  @override
  set productCart(CartProductModel value) {
    _$productCartAtom.reportWrite(value, super.productCart, () {
      super.productCart = value;
    });
  }

  late final _$ProductInfoControllerBaseActionController =
      ActionController(name: 'ProductInfoControllerBase', context: context);

  @override
  void increaseProductCount() {
    final _$actionInfo = _$ProductInfoControllerBaseActionController
        .startAction(name: 'ProductInfoControllerBase.increaseProductCount');
    try {
      return super.increaseProductCount();
    } finally {
      _$ProductInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseProductCount() {
    final _$actionInfo = _$ProductInfoControllerBaseActionController
        .startAction(name: 'ProductInfoControllerBase.decreaseProductCount');
    try {
      return super.decreaseProductCount();
    } finally {
      _$ProductInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductObservation(String text) {
    final _$actionInfo = _$ProductInfoControllerBaseActionController
        .startAction(name: 'ProductInfoControllerBase.setProductObservation');
    try {
      return super.setProductObservation(text);
    } finally {
      _$ProductInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProduct() {
    final _$actionInfo = _$ProductInfoControllerBaseActionController
        .startAction(name: 'ProductInfoControllerBase.setProduct');
    try {
      return super.setProduct();
    } finally {
      _$ProductInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productCart: ${productCart}
    ''';
  }
}
