import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-form/product_form_state.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/update_product_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/utils/string_helper.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/domain/enums/product_enum.dart';

part 'product_form_controller.g.dart';

class ProductFormController = ProductFormControllerBase
    with _$ProductFormController;

abstract class ProductFormControllerBase with Store {
  final IUpdateProductUsecase _updateProduct;
  final ICreateProductUsecase _createProduct;
  final EmployeeMenuRestaurantController _employeeMenuRestaurantController;

  ProductFormControllerBase(this._updateProduct, this._createProduct,
      this._employeeMenuRestaurantController);

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
  File? uploadedMobilePhoto;

  @observable
  Uint8List? uploadedWebPhoto;

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

  @action
  Future<void> createProduct(RestaurantEnum restaurant) async {
    changeState(ProductFormLoadingState());
    var result = await _createProduct(
        ProductModel(
          name: productName!,
          description: productDescription ?? "",
          price: productPrice!,
          prepareTime: productPrepareTime,
          type: productType!,
          available: productAvailability,
          photo:
              "https://dygzp3rn48wd5.cloudfront.net/products/icons/plates.png",
        ),
        restaurant);
    changeState(
        result.fold((l) => ProductFormFailureState(failure: l), (product) {
      _employeeMenuRestaurantController.listAllProduct.add(product);
      _employeeMenuRestaurantController.filterProduct();
      return ProductFormSuccessState(product: product);
    }));
  }

  @action
  Future<void> updateProduct(
      RestaurantEnum restaurant, String productId) async {
    changeState(ProductFormLoadingState());
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
        productPhoto != product?.photo;
  }
}
