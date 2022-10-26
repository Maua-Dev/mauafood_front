import '../models/cart_item_model.dart';

abstract class CartDatasourceInterface {
  Future<void> postCartDemand(List<CartItemModel> list);
}
