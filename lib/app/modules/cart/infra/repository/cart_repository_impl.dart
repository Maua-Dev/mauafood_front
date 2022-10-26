import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import '../../domain/infra/cart_repository_interface.dart';
import '../datasources/cart_datasource_interface.dart';

class CartRepositoryImpl implements CartRepositoryInterface {
  final CartDatasourceInterface datasource;

  CartRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, bool>> postCartDemand(List<CartItemModel> list) async {
    try {
      await datasource.postCartDemand(list);
    } catch (e) {
      return left(DatasourceResultNull(message: 'Nenhum item encontrado.'));
    }

    return right(true);
  }
}
