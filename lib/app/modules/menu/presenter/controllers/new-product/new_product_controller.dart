import 'package:mobx/mobx.dart';

import '../../../../../shared/domain/enums/product_enum.dart';

part 'new_product_controller.g.dart';

class NewProductController = NewProductControllerBase
    with _$NewProductController;

abstract class NewProductControllerBase with Store {
  NewProductControllerBase();

  @observable
  String? productName;

  @action
  void setProductName(String value) {
    productName = value;
  }

  @observable
  int? productPrepareTime;

  @action
  void setProductPrepareTime(String value) {
    productPrepareTime = int.parse(value);
  }

  @observable
  double? productPrice;

  @action
  void setProductPrice(String value) {
    productPrice = double.parse(
        value.replaceAll('R\$', "").replaceAll('.', "").replaceAll(',', '.'));
  }

  @observable
  String? productType;

  @action
  void setProductType(String value) {
    productType = value;
  }

  @observable
  String? productDescription;

  @action
  void setProductDescription(String value) {
    productDescription = value;
  }

  @observable
  bool productAvailability = false;

  @action
  void setProductAvailability(bool value) {
    productAvailability = value;
  }
}
