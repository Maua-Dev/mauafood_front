// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductFormController on ProductFormControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ProductFormControllerBase.state', context: context);

  @override
  ProductFormState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ProductFormState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$productNameAtom =
      Atom(name: 'ProductFormControllerBase.productName', context: context);

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
      name: 'ProductFormControllerBase.productPrepareTime', context: context);

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
      Atom(name: 'ProductFormControllerBase.productPrice', context: context);

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
      Atom(name: 'ProductFormControllerBase.productType', context: context);

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
      name: 'ProductFormControllerBase.productDescription', context: context);

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
      name: 'ProductFormControllerBase.productAvailability', context: context);

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

  late final _$productMobileImageAtom = Atom(
      name: 'ProductFormControllerBase.productMobileImage', context: context);

  @override
  File? get productMobileImage {
    _$productMobileImageAtom.reportRead();
    return super.productMobileImage;
  }

  @override
  set productMobileImage(File? value) {
    _$productMobileImageAtom.reportWrite(value, super.productMobileImage, () {
      super.productMobileImage = value;
    });
  }

  late final _$productWebImageAtom =
      Atom(name: 'ProductFormControllerBase.productWebImage', context: context);

  @override
  Uint8List? get productWebImage {
    _$productWebImageAtom.reportRead();
    return super.productWebImage;
  }

  @override
  set productWebImage(Uint8List? value) {
    _$productWebImageAtom.reportWrite(value, super.productWebImage, () {
      super.productWebImage = value;
    });
  }

  late final _$isPhotoUploadedAtom =
      Atom(name: 'ProductFormControllerBase.isPhotoUploaded', context: context);

  @override
  bool? get isPhotoUploaded {
    _$isPhotoUploadedAtom.reportRead();
    return super.isPhotoUploaded;
  }

  @override
  set isPhotoUploaded(bool? value) {
    _$isPhotoUploadedAtom.reportWrite(value, super.isPhotoUploaded, () {
      super.isPhotoUploaded = value;
    });
  }

  late final _$setProductImageAsyncAction = AsyncAction(
      'ProductFormControllerBase.setProductImage',
      context: context);

  @override
  Future<dynamic> setProductImage() {
    return _$setProductImageAsyncAction.run(() => super.setProductImage());
  }

  late final _$ProductFormControllerBaseActionController =
      ActionController(name: 'ProductFormControllerBase', context: context);

  @override
  void changeState(ProductFormState value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductName(String value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductName');
    try {
      return super.setProductName(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateProductName(String? value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.validateProductName');
    try {
      return super.validateProductName(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductPrepareTime(String value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductPrepareTime');
    try {
      return super.setProductPrepareTime(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateProductPrepareTime(String? value) {
    final _$actionInfo =
        _$ProductFormControllerBaseActionController.startAction(
            name: 'ProductFormControllerBase.validateProductPrepareTime');
    try {
      return super.validateProductPrepareTime(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductPrice(String value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductPrice');
    try {
      return super.setProductPrice(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateProductPrice(String? value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.validateProductPrice');
    try {
      return super.validateProductPrice(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductType(String value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductType');
    try {
      return super.setProductType(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateProductType(String? value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.validateProductType');
    try {
      return super.validateProductType(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductDescription(String value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductDescription');
    try {
      return super.setProductDescription(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductAvailability(bool value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductAvailability');
    try {
      return super.setProductAvailability(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsPhotoUploaded(bool value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setIsPhotoUploaded');
    try {
      return super.setIsPhotoUploaded(value);
    } finally {
      _$ProductFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
productName: ${productName},
productPrepareTime: ${productPrepareTime},
productPrice: ${productPrice},
productType: ${productType},
productDescription: ${productDescription},
productAvailability: ${productAvailability},
productMobileImage: ${productMobileImage},
productWebImage: ${productWebImage},
isPhotoUploaded: ${isPhotoUploaded}
    ''';
  }
}
