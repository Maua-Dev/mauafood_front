import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/enums/http_status_code_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/helpers/functions/get_http_status_function.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/orders_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

class OrdersRepository implements IOrdersRepository {
  final IOrdersDatasource datasource;

  OrdersRepository(this.datasource);

  @override
  Future<Either<Failure, List<OrderModel>>> getAllActiveOrders() async {
    List<OrderModel> ordersList;
    try {
      var ordersMap = await datasource.getAllActiveOrders();
      ordersList = OrderModel.fromMaps(ordersMap['all_active_orders']);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
    return right(ordersList);
  }

  @override
  Future<Either<Failure, OrderModel>> changeOrderStatus(
      String orderId, StatusEnum status) async {
    OrderModel order;
    try {
      var orderMap = await datasource.changeOrderStatus(orderId, status);
      order = OrderModel.fromMap(orderMap['order']);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
    return right(order);
  }

  @override
  Future<Either<Failure, OrderModel>> abortOrder(
      String orderId, String abortedReason) async {
    OrderModel order;
    try {
      var orderMap = await datasource.abortOrder(orderId, abortedReason);
      order = OrderModel.fromMap(orderMap['order']);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
    return right(order);
  }

  @override
  Future<Either<Failure, OrderStatusModel>> getCurrentOrderStateById(
      String orderId) async {
    OrderStatusModel order;
    try {
      var orderMap = await datasource.getCurrentOrderStateById(orderId);
      order = OrderStatusModel.fromMap(orderMap["order"]);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
    return right(order);
  }

}
