import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_reset_password.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/resend_confirmation_code.dart';
import 'package:mauafood_front/app/modules/auth/infra/repository/auth_storage_impl.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/change-password/change_password_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/confirm-email/confirm_email_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/forgot-password/forgot_password_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/login/login_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/register_form_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/resend-code/resend_code_form_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/change_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/confirm_email_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/forgot_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/login_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/register_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/resend_confirmation_code_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/success_change_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/success_confirm_page.dart';
import 'data/datasource/auth_datasource_impl.dart';
import 'domain/infra/auth_repository_interface.dart';
import 'domain/usecases/confirm_email.dart';
import 'domain/usecases/login_user.dart';
import 'domain/usecases/logout_user.dart';
import 'domain/usecases/register_user.dart';
import 'domain/usecases/forgot_password.dart';
import 'infra/datasources/auth_datasouce_interface.dart';
import 'infra/repository/auth_repository_impl.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LoginUserInterface>((i) => LoginUserImpl(repository: i()),
            export: true),
        Bind<RegisterUserInterface>((i) => RegisterUserImpl(repository: i()),
            export: true),
        Bind<ConfirmEmailInterface>((i) => ConfirmEmailImpl(repository: i()),
            export: true),
        Bind<LogoutUserInterface>((i) => LogoutUserImpl(repository: i()),
            export: true),
        Bind<ResendConfirmationCodeInterface>(
            (i) => ResendConfirmationCodeImpl(repository: i()),
            export: true),
        Bind<ForgotPasswordInterface>(
            (i) => ForgotPasswordImpl(repository: i()),
            export: true),
        Bind<ConfirmResetPasswordInterface>(
            (i) => ConfirmResetPasswordImpl(repository: i()),
            export: true),
        AsyncBind<AuthStorageInterface>((i) => AuthStorageImpl.instance()),
        Bind<AuthBloc>(
            (i) => AuthBloc(
                  logout: i(),
                  login: i(),
                  storage: i(),
                  confirmResetPassword: i(),
                  forgotPassword: i(),
                ),
            export: true),
        Bind<RegisterBloc>(
            (i) => RegisterBloc(
                confirmEmail: i(), register: i(), resendConfirmationCode: i()),
            export: true),
        Bind<ResendCodeFormBloc>((i) => ResendCodeFormBloc(registerBloc: i()),
            export: true),
        AsyncBind<AuthStorageInterface>((i) => AuthStorageImpl.instance(),
            export: true),
        Bind<RegisterFormBloc>((i) => RegisterFormBloc(registerBloc: i()),
            export: true),
        Bind<ConfirmEmailBloc>(
            (i) => ConfirmEmailBloc(
                registerBloc: i.args.data[0], email: i.args.data[1]),
            export: true),
        Bind<ForgotPasswordBloc>((i) => ForgotPasswordBloc(authBloc: i()),
            export: true),
        Bind<ChangePasswordBloc>(
            (i) => ChangePasswordBloc(
                authBloc: i.args.data[0], email: i.args.data[1]),
            export: true),
        Bind<LoginBloc>((i) => LoginBloc(authBloc: i()), export: true),
        Bind<AuthRepositoryInterface>(
            (i) => AuthRepositoryImpl(datasource: i()),
            export: true),
        Bind<AuthDatasourceInterface>((i) => AuthDatasourceImpl(),
            export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const LoginPage()),
        ChildRoute(
          '/register',
          child: (context, args) => const RegisterPage(),
        ),
        ChildRoute(
          '/confirm-email',
          child: (context, args) =>
              ConfirmEmailPage(registerBloc: args.data[0]),
        ),
        ChildRoute(
          '/forgot-password',
          child: (context, args) => ForgotPasswordPage(authBloc: args.data),
        ),
        ChildRoute(
          '/change-password',
          child: (context, args) => ChangePasswordPage(authBloc: args.data[0]),
        ),
        ChildRoute(
          '/success-confirm',
          child: (context, args) => const SuccessConfirmPage(),
        ),
        ChildRoute(
          '/success-change-password',
          child: (context, args) => const SuccessChangePasswordPage(),
        ),
        ChildRoute(
          '/resend-code',
          child: (context, args) => const ResendConfirmationCodePage(),
        ),
      ];
}
