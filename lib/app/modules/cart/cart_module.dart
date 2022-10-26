import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';
import 'data/datasource/cart_datasource_impl.dart';
import 'domain/infra/cart_repository_interface.dart';
import 'domain/usecases/post_cart_demand.dart';
import 'infra/datasources/cart_datasource_interface.dart';
import 'infra/repository/cart_repository_impl.dart';

class CartModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<PostCartDemandInterface>(
            (i) => PostCartDemandImpl(repository: i())),
        Bind<CartBloc>((i) => CartBloc()),
        Bind<CartRepositoryInterface>(
            (i) => CartRepositoryImpl(datasource: i())),
        Bind<CartDatasourceInterface>((i) => CartDatasourceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [];
}
