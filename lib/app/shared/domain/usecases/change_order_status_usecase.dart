import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../helpers/errors/errors.dart';

abstract class IChangeOrderStatusUsecase {
  Future<Either<Failure, OrderModel>> call(String orderId, StatusEnum status);
}

class ChangeOrderStatusUsecase implements IChangeOrderStatusUsecase {
  final IOrdersRepository repository;

  ChangeOrderStatusUsecase({required this.repository});

  @override
  Future<Either<Failure, OrderModel>> call(
      String orderId, StatusEnum status) async {
    var result = await repository.changeOrderStatus(orderId, status);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
