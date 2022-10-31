import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/login/register_form_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/register_page.dart';
import 'data/datasource/auth_datasource_impl.dart';
import 'domain/infra/auth_repository_interface.dart';
import 'domain/usecases/login_user.dart';
import 'domain/usecases/register_user.dart';
import 'infra/datasources/auth_datasouce_interface.dart';
import 'infra/repository/auth_repository_impl.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginUserInterface>((i) => LoginUserImpl(repository: i())),
        Bind<RegisterUserInterface>((i) => RegisterUserImpl(repository: i())),
        Bind<AuthBloc>((i) => AuthBloc(login: i(), register: i())),
        Bind<RegisterFormBloc>((i) => RegisterFormBloc(authBloc: i())),
        Bind<AuthRepositoryInterface>(
            (i) => AuthRepositoryImpl(datasource: i())),
        Bind<AuthDatasourceInterface>((i) => AuthDatasourceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const RegisterPage(),
        ),
      ];
}
