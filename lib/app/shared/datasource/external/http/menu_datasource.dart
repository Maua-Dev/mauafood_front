import 'dart:io';

import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/menu_datasource_interface.dart';

import '../../../domain/enums/restaurant_enum.dart';
import '../../../infra/models/product_model.dart';

class MenuDatasource implements IMenuDatasource {
  final IHttpRequest _httpService;

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
  Future<ProductModel> createProduct(
      ProductModel product, RestaurantEnum restaurant) async {
    var data = product.toJson(restaurant);
    var response = await _httpService.post('/create-product', data: data);
    if (response.statusCode == 201) {
      return ProductModel.fromMap(response.data["product"]);
    }
    throw Exception();
  }

  @override
  Future<ProductModel> updateProduct(
      ProductModel product, RestaurantEnum restaurant) async {
    var data = product.newProductJson(restaurant);
    var response = await _httpService.post('/update-product', data: data);
    if (response.statusCode == 200) {
      return ProductModel.fromMap(response.data["product"]);
    }
    throw Exception();
  }

  @override
  Future<void> deleteProduct(String id, RestaurantEnum restaurant) async {
    var response = await _httpService.post('/delete-product', data: {
      'product_id': id,
      'restaurant': RestaurantEnumExtension.enumToStringMap(restaurant),
    });
    if (response.statusCode == 200) {
      return;
    }
    throw Exception();
  }

  @override
  Future<String> uploadProductPhoto(String id) async {
    var response =
        await _httpService.post('/request-upload-product-photo', data: {
      'product_id': id,
    });
    if (response.statusCode == 200) {
      return response.data['url'];
    }
    throw Exception();
  }

  @override
  Future<void> uploadPhotoToS3(String url, File photo) async {
    var response = await _httpService.postPhoto(url, photo);
    if (response.statusCode == 200) {
      return;
    }
    throw Exception();
  }
}
