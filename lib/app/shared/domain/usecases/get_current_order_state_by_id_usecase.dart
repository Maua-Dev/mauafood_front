import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../helpers/errors/errors.dart';

abstract class IGetCurrentOrderStateByIdUsecase {
  Future<Either<Failure, OrderModel>> call(String orderId);
}

class GetCurrentOrderStateByIdUsecase
    implements IGetCurrentOrderStateByIdUsecase {
  final IOrdersRepository repository;

  GetCurrentOrderStateByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, OrderModel>> call(String orderId) async {
    var result = await repository.getCurrentOrderStateById(orderId);
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
