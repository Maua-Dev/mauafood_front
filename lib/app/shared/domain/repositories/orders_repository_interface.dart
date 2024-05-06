import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

abstract class IOrdersRepository {
  Future<Either<Failure, List<OrderModel>>> getAllActiveOrders();
  Future<Either<Failure, OrderModel>> changeOrderStatus(
      String orderId, StatusEnum status);
  Future<Either<Failure, OrderModel>> abortOrder(
      String orderId, String abortedReason);
  Future<Either<Failure, OrderModel>> getCurrentOrderStateById(String orderId);
}
