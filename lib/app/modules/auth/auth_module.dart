import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/infra/repository/auth_storage_impl.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/confirm-email/confirm_email_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/login/login_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/register_form_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/confirm_email_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/login_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/register_page.dart';
import 'data/datasource/auth_datasource_impl.dart';
import 'domain/infra/auth_repository_interface.dart';
import 'domain/usecases/confirm_email.dart';
import 'domain/usecases/login_user.dart';
import 'domain/usecases/register_user.dart';
import 'infra/datasources/auth_datasouce_interface.dart';
import 'infra/repository/auth_repository_impl.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginUserInterface>((i) => LoginUserImpl(repository: i())),
        Bind<RegisterUserInterface>((i) => RegisterUserImpl(repository: i())),
        Bind<ConfirmEmailInterface>((i) => ConfirmEmailImpl(repository: i())),
        AsyncBind<AuthStorageInterface>((i) => AuthStorageImpl.instance()),
        Bind<AuthBloc>((i) => AuthBloc(
              login: i(),
              register: i(),
              confirmEmail: i(),
              // storage: i(),
            )),
        Bind<RegisterFormBloc>((i) => RegisterFormBloc(authBloc: i())),
        Bind<ConfirmEmailBloc>((i) => ConfirmEmailBloc(authBloc: i())),
        Bind<LoginBloc>((i) => LoginBloc(authBloc: i())),
        Bind<AuthRepositoryInterface>(
            (i) => AuthRepositoryImpl(datasource: i())),
        Bind<AuthDatasourceInterface>((i) => AuthDatasourceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const LoginPage(),
        ),
        ChildRoute(
          '/register',
          child: (context, args) => RegisterPage(
            authBloc: args.data,
          ),
        ),
        ChildRoute(
          '/confirm-email',
          child: (context, args) => ConfirmEmailPage(authBloc: args.data),
        ),
      ];
}
