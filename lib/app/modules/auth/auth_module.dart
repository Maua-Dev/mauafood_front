import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_reset_password.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/get_user_attributes.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/resend_confirmation_code.dart';
import 'package:mauafood_front/app/modules/auth/infra/repository/auth_storage_impl.dart';
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
        Bind<GetUserAttributesInterface>(
            (i) => GetUserAttributesImpl(repository: i()),
            export: true),
        AsyncBind<AuthStorageInterface>((i) => AuthStorageImpl.instance()),
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
          child: (context, args) => const ConfirmEmailPage(),
        ),
        ChildRoute(
          '/forgot-password',
          child: (context, args) => const ForgotPasswordPage(),
        ),
        ChildRoute(
          '/change-password',
          child: (context, args) => const ChangePasswordPage(),
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
