import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

import '../../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../../shared/infra/models/cart_product_model.dart';

abstract class ICartDatasource {
  Future<OrderModel> createOrder(
      List<CartProductModel> productList, RestaurantEnum restaurant);
}
