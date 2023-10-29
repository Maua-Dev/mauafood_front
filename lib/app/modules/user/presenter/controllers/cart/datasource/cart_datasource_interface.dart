import '../../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../../shared/infra/models/cart_product_model.dart';

abstract class ICartDatasource {
  Future<String> createOrder(
      List<CartProductModel> productList, RestaurantEnum restaurant);
}
