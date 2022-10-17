import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/data/datasource/menu_datasource_impl.dart';

import 'domain/infra/menu_repository_interface.dart';
import 'infra/datasources/menu_datasource_interface.dart';
import 'infra/repository/menu_repository_impl.dart';

class MenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<MenuDatasourceInterface>((i) => MenuDatasourceImpl()),
        Bind<MenuRepositoryInterface>(
            (i) => MenuRepositoryImpl(datasource: i())),
      ];

  @override
  List<ModularRoute> get routes => [];
}
