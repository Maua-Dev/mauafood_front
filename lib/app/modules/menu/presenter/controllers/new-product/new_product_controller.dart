import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/new_product/new_product_state.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';

part 'new_product_controller.g.dart';

class NewProductController = NewProductControllerBase
    with _$NewProductController;

abstract class NewProductControllerBase with Store {
  final ICreateProductUsecase _createProduct;

  NewProductControllerBase(this._createProduct);

  @observable
  NewProductState state = NewProductInitialState();

  @action
  void changeState(NewProductState value) => state = value;

  @observable
  String? productName;

  @action
  void setProductName(String value) {
    productName = value;
  }

  @action
  String? validateProductName(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @observable
  int? productPrepareTime;

  @action
  void setProductPrepareTime(String value) {
    productPrepareTime = int.parse(value);
  }

  @action
  String? validateProductPrepareTime(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @observable
  double? productPrice;

  @action
  void setProductPrice(String value) {
    productPrice = double.parse(
        value.replaceAll('R\$', "").replaceAll('.', "").replaceAll(',', '.'));
  }

  @action
  String? validateProductPrice(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @observable
  String? productType;

  @action
  void setProductType(String value) {
    productType = value;
  }

  @action
  String? validateProductType(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @observable
  String? productDescription;

  @action
  void setProductDescription(String value) {
    productDescription = value;
  }

  @action
  String? validateDescription(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @observable
  bool productAvailability = true;

  @action
  void setProductAvailability(bool value) {
    productAvailability = value;
  }

  @observable
  File? productMobileImage;

  @observable
  Uint8List? productWebImage;

  @observable
  bool? isPhotoUploaded;

  @action
  setIsPhotoUploaded(bool value) {
    isPhotoUploaded = value;
  }

  @action
  Future setProductImage() async {
    if (!kIsWeb) {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        productMobileImage = File(image.path);
      }
    } else {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        productWebImage = await image.readAsBytes();
      }
    }
  }
}
