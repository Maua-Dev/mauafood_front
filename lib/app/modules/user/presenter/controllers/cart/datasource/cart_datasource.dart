import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import '../../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../../shared/infra/models/cart_product_model.dart';
import 'cart_datasource_interface.dart';

class CartDatasource extends ICartDatasource {
  final IHttpRequest _client;

  CartDatasource(this._client);
  @override
  Future<String> createOrder(
      List<CartProductModel> productList, RestaurantEnum restaurant) async {
    final response = await _client.post(
      '/mss-product/create-order',
      data: {
        'products': productList,
        'restaurant': RestaurantEnumExtension.enumToStringMap(restaurant),
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Não foi possível fazer o pedido');
    }
    return response.data;
  }
}
