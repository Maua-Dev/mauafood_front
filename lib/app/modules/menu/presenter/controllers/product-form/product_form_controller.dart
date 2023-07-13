import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mauafood_front/app/modules/menu/presenter/states/product_form/product_form_state.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/domain/enums/product_enum.dart';

part 'product_form_controller.g.dart';

class ProductFormController = ProductFormControllerBase
    with _$ProductFormController;

abstract class ProductFormControllerBase with Store {
  ProductFormControllerBase();

  @observable
  ProductFormState state = ProductFormInitialState();

  @action
  void changeState(ProductFormState value) => state = value;

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
  ProductEnum? productType;

  @action
  void setProductType(String value) {
    productType = ProductEnumExtension.stringToEnumMap(
        S.current.productToEnumSchema(value.withoutDiacritics));
  }

  @action
  String? validateProductType(String? value) {
    if (value == null) {
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

  @observable
  bool productAvailability = true;

  @action
  void setProductAvailability(bool value) {
    productAvailability = value;
  }

  @observable
  String? productPhoto;

  @action
  void setProductPhoto(String? value) {
    productPhoto = value;
  }

  @observable
  File? uploadedMobilePhoto;

  @observable
  Uint8List? uploadedWebPhoto;

  @observable
  bool? isPhotoUploaded;

  @action
  Future uploadProductPhoto() async {
    if (!kIsWeb) {
      XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (photo != null) {
        uploadedMobilePhoto = File(photo.path);
      }
    } else {
      XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (photo != null) {
        uploadedWebPhoto = await photo.readAsBytes();
      }
    }
    setProductPhoto(null);
  }

  @observable
  bool wasProductFormChanged(Product? product) {
    return productName != product?.name ||
        productDescription != product?.description ||
        productPrice != product?.price ||
        productPrepareTime != product?.prepareTime ||
        productType != product?.type ||
        productAvailability != product?.available ||
        productPhoto != product?.photo;
  }
}
