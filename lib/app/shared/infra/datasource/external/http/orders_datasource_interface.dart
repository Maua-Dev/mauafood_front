import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';

abstract class IOrdersDatasource {
  Future<Map<String, dynamic>> getAllActiveOrders();
  Future<Map<String, dynamic>> changeOrderStatus(
      String orderId, StatusEnum status);
  Future<Map<String, dynamic>> abortOrder(String orderId, String abortedReason);
}
