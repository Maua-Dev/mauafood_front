import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mobx/mobx.dart';

import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-form/product_form_state.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../usecases/create_product_usecase.dart';
import '../../../usecases/update_product_usecase.dart';
import '../../../usecases/upload_photo_to_s3_usecase.dart';
import '../../../usecases/upload_product_photo_usecase.dart';

part 'product_form_controller.g.dart';

class ProductFormController = ProductFormControllerBase
    with _$ProductFormController;

abstract class ProductFormControllerBase with Store {
  final IUpdateProductUsecase _updateProduct;
  final ICreateProductUsecase _createProduct;
  final EmployeeMenuRestaurantController _employeeMenuRestaurantController;
  final IUploadProductPhotoUsecase _uploadProductPhotoUsecase;
  final IUploadPhotoToS3Usecase _uploadPhotoToS3Usecase;

  ProductFormControllerBase(
      this._updateProduct,
      this._createProduct,
      this._employeeMenuRestaurantController,
      this._uploadProductPhotoUsecase,
      this._uploadPhotoToS3Usecase);

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
    if (value == "") {
      productPrepareTime = null;
      return;
    }
    productPrepareTime = int.parse(value);
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
  Uint8List? uploadedPhoto;

  @action
  Future<void> uploadProductPhoto(context) async {
    var photo = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 640,
      maxWidth: 480,
    );

    if (photo != null && photo.mimeType!.contains('image')) {
      uploadedPhoto = await photo.readAsBytes();
      setProductPhoto(null);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.errorColor,
        content: Text(S.of(context).invalidPhotoAlert,
            style: AppTextStyles.h2.copyWith(color: AppColors.white)),
      ));
    }
  }

  @action
  Future<void> createProduct(RestaurantEnum restaurant) async {
    changeState(ProductFormLoadingState());
    if (productPhoto == null && uploadedPhoto == null) {
      productPhoto = productIcons[EnumToString.convertToString(productType)];
    }
    var result = await _createProduct(
        ProductModel(
            name: productName!,
            description: productDescription ?? "",
            price: productPrice!,
            prepareTime: productPrepareTime,
            type: productType!,
            available: productAvailability,
            photo: productPhoto),
        restaurant);

    changeState(
        result.fold((l) => ProductFormFailureState(failure: l), (product) {
      if (uploadedPhoto != null) {
        updateProduct(restaurant, product.id!);
      }
      _employeeMenuRestaurantController.listAllProduct.add(product);
      _employeeMenuRestaurantController.rangeValues = RangeValues(
          0,
          _employeeMenuRestaurantController.listAllProduct
              .map((e) => e.price)
              .reduce((a, b) => a > b ? a : b));
      _employeeMenuRestaurantController.filterProduct();
      return ProductFormSuccessState(product: product);
    }));
  }

  @action
  Future<void> updateProduct(
      RestaurantEnum restaurant, String productId) async {
    changeState(ProductFormLoadingState());

    if (uploadedPhoto != null) {
      var uploadUrl = '';
      var uploadPhoto = await _uploadProductPhotoUsecase(productId);
      changeState(uploadPhoto.fold((l) {
        return ProductFormFailureState(failure: l);
      }, (url) {
        uploadUrl = url;
        return ProductFormLoadingState();
      }));
      if (uploadUrl != '') {
        var resultUpload =
            await _uploadPhotoToS3Usecase(uploadUrl, uploadedPhoto!);
        changeState(resultUpload.fold((l) {
          return ProductFormFailureState(failure: l);
        }, (response) {
          productPhoto = uploadUrl.substring(0, uploadUrl.indexOf('?'));
          return ProductFormLoadingState();
        }));
      }
    }

    if (state is ProductFormFailureState) {
      return;
    }

    var result = await _updateProduct(
        ProductModel(
          id: productId,
          name: productName!,
          description: productDescription ?? "",
          price: productPrice!,
          prepareTime: productPrepareTime,
          type: productType!,
          available: productAvailability,
          photo: productPhoto,
        ),
        restaurant);

    changeState(
        result.fold((l) => ProductFormFailureState(failure: l), (product) {
      var element = _employeeMenuRestaurantController.listAllProduct
          .firstWhere((element) => element.id == productId);
      var index =
          _employeeMenuRestaurantController.listAllProduct.indexOf(element);
      _employeeMenuRestaurantController.listAllProduct[index] = product;
      _employeeMenuRestaurantController.rangeValues = RangeValues(
          0,
          _employeeMenuRestaurantController.listAllProduct
              .map((e) => e.price)
              .reduce((a, b) => a > b ? a : b));
      _employeeMenuRestaurantController.filterProduct();
      return ProductFormSuccessState(product: product);
    }));
  }

  bool wasProductFormChanged(Product? product) {
    return productName != product?.name ||
        productDescription != product?.description ||
        productPrice != product?.price ||
        productPrepareTime != product?.prepareTime ||
        productType != product?.type ||
        productAvailability != product?.available ||
        productPhoto != product?.photo ||
        uploadedPhoto != null;
  }
}
