import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/orders_datasource_interface.dart';

class OrdersDatasource implements IOrdersDatasource {
  final IHttpRequest _httpService;

  OrdersDatasource(this._httpService);

  @override
  Future<Map<String, dynamic>> getAllActiveOrders() async {
    var response =
        await _httpService.get('/get_all_active_orders_by_restaurant');
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }
}
