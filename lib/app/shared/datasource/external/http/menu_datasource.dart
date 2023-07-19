import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/menu_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import '../../../helpers/services/http_service.dart';

class MenuDatasource implements IMenuDatasource {
  final HttpService _httpService;

  MenuDatasource(this._httpService);

  @override
  Future<Map<String, dynamic>> getAllProducts() async {
    var response =
        await _httpService.get('/get-all-products-group-by-restaurant');
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }

  @override
  Future<void> createProduct(
      ProductModel product, RestaurantEnum restaurant) async {
    var response = await _httpService.post('/create-product',
        data: product.toJson(restaurant));
    if (response.statusCode == 200) {
      return;
    }
    throw Exception();
  }

  @override
  Future<void> updateProduct(
      ProductModel product, RestaurantEnum restaurant) async {
    var response = await _httpService.post('/update-product',
        data: product.toJson(restaurant));
    if (response.statusCode == 200) {
      return;
    }
    throw Exception();
  }

  @override
  Future<void> deleteProduct(String id, RestaurantEnum restaurant) async {
    var response = await _httpService.post('/delete-product', data: {
      'product_id': id,
      'restaurant': RestaurantEnumExtension.enumToStringMap(restaurant)
    });
    if (response.statusCode == 200) {
      return;
    }
    throw Exception();
  }
}
