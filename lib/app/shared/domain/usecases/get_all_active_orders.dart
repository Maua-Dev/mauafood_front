import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/orders_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import '../../helpers/errors/errors.dart';

abstract class IGetAllActiveOrdersUsecase {
  Future<Either<Failure, List<OrderModel>>> call();
}

class GetAllActiveOrdersUsecase implements IGetAllActiveOrdersUsecase {
  final IOrdersRepository repository;

  GetAllActiveOrdersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<OrderModel>>> call() async {
    var result = await repository.getAllActiveOrders();
    return result.fold(
        (failureResult) => result, (successResult) => Right(successResult));
  }
}
