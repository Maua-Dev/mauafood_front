import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';

abstract class IOrdersRepository {
  Future<Either<Failure, List<OrderModel>>> getAllActiveOrders();
}
