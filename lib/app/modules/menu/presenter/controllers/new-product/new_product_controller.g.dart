// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewProductController on NewProductControllerBase, Store {
  late final _$productNameAtom =
      Atom(name: 'NewProductControllerBase.productName', context: context);

  @override
  String? get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String? value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  late final _$productPrepareTimeAtom = Atom(
      name: 'NewProductControllerBase.productPrepareTime', context: context);

  @override
  int? get productPrepareTime {
    _$productPrepareTimeAtom.reportRead();
    return super.productPrepareTime;
  }

  @override
  set productPrepareTime(int? value) {
    _$productPrepareTimeAtom.reportWrite(value, super.productPrepareTime, () {
      super.productPrepareTime = value;
    });
  }

  late final _$productPriceAtom =
      Atom(name: 'NewProductControllerBase.productPrice', context: context);

  @override
  double? get productPrice {
    _$productPriceAtom.reportRead();
    return super.productPrice;
  }

  @override
  set productPrice(double? value) {
    _$productPriceAtom.reportWrite(value, super.productPrice, () {
      super.productPrice = value;
    });
  }

  late final _$productTypeAtom =
      Atom(name: 'NewProductControllerBase.productType', context: context);

  @override
  String? get productType {
    _$productTypeAtom.reportRead();
    return super.productType;
  }

  @override
  set productType(String? value) {
    _$productTypeAtom.reportWrite(value, super.productType, () {
      super.productType = value;
    });
  }

  late final _$productDescriptionAtom = Atom(
      name: 'NewProductControllerBase.productDescription', context: context);

  @override
  String? get productDescription {
    _$productDescriptionAtom.reportRead();
    return super.productDescription;
  }

  @override
  set productDescription(String? value) {
    _$productDescriptionAtom.reportWrite(value, super.productDescription, () {
      super.productDescription = value;
    });
  }

  late final _$productAvailabilityAtom = Atom(
      name: 'NewProductControllerBase.productAvailability', context: context);

  @override
  bool get productAvailability {
    _$productAvailabilityAtom.reportRead();
    return super.productAvailability;
  }

  @override
  set productAvailability(bool value) {
    _$productAvailabilityAtom.reportWrite(value, super.productAvailability, () {
      super.productAvailability = value;
    });
  }

  late final _$NewProductControllerBaseActionController =
      ActionController(name: 'NewProductControllerBase', context: context);

  @override
  void setProductName(String value) {
    final _$actionInfo = _$NewProductControllerBaseActionController.startAction(
        name: 'NewProductControllerBase.setProductName');
    try {
      return super.setProductName(value);
    } finally {
      _$NewProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductPrepareTime(String value) {
    final _$actionInfo = _$NewProductControllerBaseActionController.startAction(
        name: 'NewProductControllerBase.setProductPrepareTime');
    try {
      return super.setProductPrepareTime(value);
    } finally {
      _$NewProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductPrice(String value) {
    final _$actionInfo = _$NewProductControllerBaseActionController.startAction(
        name: 'NewProductControllerBase.setProductPrice');
    try {
      return super.setProductPrice(value);
    } finally {
      _$NewProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductType(String value) {
    final _$actionInfo = _$NewProductControllerBaseActionController.startAction(
        name: 'NewProductControllerBase.setProductType');
    try {
      return super.setProductType(value);
    } finally {
      _$NewProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductDescription(String value) {
    final _$actionInfo = _$NewProductControllerBaseActionController.startAction(
        name: 'NewProductControllerBase.setProductDescription');
    try {
      return super.setProductDescription(value);
    } finally {
      _$NewProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductAvailability(bool value) {
    final _$actionInfo = _$NewProductControllerBaseActionController.startAction(
        name: 'NewProductControllerBase.setProductAvailability');
    try {
      return super.setProductAvailability(value);
    } finally {
      _$NewProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productName: ${productName},
productPrepareTime: ${productPrepareTime},
productPrice: ${productPrice},
productType: ${productType},
productDescription: ${productDescription},
productAvailability: ${productAvailability}
    ''';
  }
}
