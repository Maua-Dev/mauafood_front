import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../../domain/enums/restaurant_enum.dart';
import '../../../infra/models/cart_product_model.dart';
import '../../../../modules/user/presenter/controllers/cart/datasource/cart_datasource_interface.dart';

class CartDatasource extends ICartDatasource {
  final IHttpRequest _client;

  CartDatasource(this._client);
  @override
  Future<OrderModel> createOrder(
      List<CartProductModel> productList, RestaurantEnum restaurant) async {
    final response = await _client.post(
      '/create-order',
      data: {
        'products': productList.map((e) => e.toJson()).toList(),
        'restaurant': RestaurantEnumExtension.enumToStringMap(restaurant),
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Não foi possível fazer o pedido');
    }
    return response.data['order_id'];
  }
}
