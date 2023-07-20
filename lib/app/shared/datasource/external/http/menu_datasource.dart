import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/menu_datasource_interface.dart';

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
}
