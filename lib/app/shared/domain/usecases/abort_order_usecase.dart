import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../helpers/errors/errors.dart';

abstract class IAbortOrderUsecase {
  Future<Either<Failure, OrderModel>> call(String orderId, String abortReason);
}

class AbortOrderUsecase implements IAbortOrderUsecase {
  final IOrdersRepository repository;

  AbortOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, OrderModel>> call(
      String orderId, String abortReason) async {
    var result = await repository.abortOrder(orderId, abortReason);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
