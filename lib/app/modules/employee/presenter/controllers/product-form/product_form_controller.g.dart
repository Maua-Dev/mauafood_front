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
  ProductEnum? get productType {
    _$productTypeAtom.reportRead();
    return super.productType;
  }

  @override
  set productType(ProductEnum? value) {
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

  late final _$productPhotoAtom =
      Atom(name: 'ProductFormControllerBase.productPhoto', context: context);

  @override
  String? get productPhoto {
    _$productPhotoAtom.reportRead();
    return super.productPhoto;
  }

  @override
  set productPhoto(String? value) {
    _$productPhotoAtom.reportWrite(value, super.productPhoto, () {
      super.productPhoto = value;
    });
  }

  late final _$uploadedPhotoAtom =
      Atom(name: 'ProductFormControllerBase.uploadedPhoto', context: context);

  @override
  Uint8List? get uploadedPhoto {
    _$uploadedPhotoAtom.reportRead();
    return super.uploadedPhoto;
  }

  @override
  set uploadedPhoto(Uint8List? value) {
    _$uploadedPhotoAtom.reportWrite(value, super.uploadedPhoto, () {
      super.uploadedPhoto = value;
    });
  }

  late final _$photoFileAtom =
      Atom(name: 'ProductFormControllerBase.photoFile', context: context);

  @override
  File? get photoFile {
    _$photoFileAtom.reportRead();
    return super.photoFile;
  }

  @override
  set photoFile(File? value) {
    _$photoFileAtom.reportWrite(value, super.photoFile, () {
      super.photoFile = value;
    });
  }

  late final _$uploadProductPhotoAsyncAction = AsyncAction(
      'ProductFormControllerBase.uploadProductPhoto',
      context: context);

  @override
  Future<dynamic> uploadProductPhoto() {
    return _$uploadProductPhotoAsyncAction
        .run(() => super.uploadProductPhoto());
  }

  late final _$createProductAsyncAction =
      AsyncAction('ProductFormControllerBase.createProduct', context: context);

  @override
  Future<void> createProduct(RestaurantEnum restaurant) {
    return _$createProductAsyncAction
        .run(() => super.createProduct(restaurant));
  }

  late final _$updateProductAsyncAction =
      AsyncAction('ProductFormControllerBase.updateProduct', context: context);

  @override
  Future<void> updateProduct(RestaurantEnum restaurant, String productId) {
    return _$updateProductAsyncAction
        .run(() => super.updateProduct(restaurant, productId));
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
  void setProductPhoto(String? value) {
    final _$actionInfo = _$ProductFormControllerBaseActionController
        .startAction(name: 'ProductFormControllerBase.setProductPhoto');
    try {
      return super.setProductPhoto(value);
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
productPhoto: ${productPhoto},
uploadedPhoto: ${uploadedPhoto},
photoFile: ${photoFile}
    ''';
  }
}
