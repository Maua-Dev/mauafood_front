import 'package:enum_to_string/enum_to_string.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/orders_datasource_interface.dart';

class OrdersDatasource implements IOrdersDatasource {
  final IHttpRequest _httpService;

  OrdersDatasource(this._httpService);

  @override
  Future<Map<String, dynamic>> getAllActiveOrders() async {
    var response =
        await _httpService.get('/get-all-active-orders-by-restaurant');
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }

  @override
  Future<Map<String, dynamic>> changeOrderStatus(
      String orderId, StatusEnum status) async {
    var response = await _httpService.post('/change-order-status', data: {
      'order_id': orderId,
      'new_status': EnumToString.convertToString(status),
    });
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }

  @override
  Future<Map<String, dynamic>> abortOrder(
      String orderId, String abortedReason) async {
    var response = await _httpService.post('/abort-order', data: {
      'order_id': orderId,
      'aborted_reason': abortedReason,
    });
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }

  @override
  Future<Map<String, dynamic>> getCurrentOrderStateById(String orderId) async {
    var response = await _httpService
        .get('/get-current-order-state-by-id?order_id=$orderId');
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }

}
