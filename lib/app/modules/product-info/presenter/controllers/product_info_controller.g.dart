// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductInfoController on ProductInfoControllerBase, Store {
  late final _$productCountAtom =
      Atom(name: 'ProductInfoControllerBase.productCount', context: context);

  @override
  int get productCount {
    _$productCountAtom.reportRead();
    return super.productCount;
  }

  @override
  set productCount(int value) {
    _$productCountAtom.reportWrite(value, super.productCount, () {
      super.productCount = value;
    });
  }

  late final _$observationAtom =
      Atom(name: 'ProductInfoControllerBase.observation', context: context);

  @override
  String get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
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
  String toString() {
    return '''
productCount: ${productCount},
observation: ${observation}
    ''';
  }
}
