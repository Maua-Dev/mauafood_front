import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user.dart';
import 'external/user_datasource_impl.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repositories/user_repository_impl.dart';
import 'presenter/controllers/user_controller.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(((i) => UserController(i(), i())), export: true),
        Bind<GetUser>((i) => GetUserImpl(i()), export: true),
        Bind<UserRepository>((i) => UserRepositoryImpl(i()), export: true),
        Bind<UserDatasource>((i) => UserDatasourceImpl(i()), export: true),
      ];
}
