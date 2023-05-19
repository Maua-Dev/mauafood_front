import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/menu_datasource_interface.dart';
import '../../../helpers/services/http_service.dart';

class MenuDatasource implements IMenuDatasource {
  final HttpService _httpService;

  MenuDatasource(this._httpService);

  @override
  Future<Map<String, dynamic>> getAllProducts() async {
    try {
      var response =
          await _httpService.get('/get-all-products-group-by-restaurant');
      if (response.statusCode == 200) {
        return response.data;
      }
      throw Exception();
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }
}
