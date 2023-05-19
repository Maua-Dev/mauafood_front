import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/domain/storage/auth_storage_interface.dart';
import 'package:mauafood_front/app/shared/domain/usecases/confirm_reset_password_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_user_attributes_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:mauafood_front/app/shared/infra/storage/auth_storage_impl.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/change_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/confirm_email_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/forgot_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/login_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/register_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/resend_confirmation_code_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/success_change_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/success_confirm_page.dart';
import 'data/datasource/auth_datasource_impl.dart';
import '../../shared/domain/repositories/auth_repository_interface.dart';
import '../../shared/domain/usecases/confirm_email_usecase.dart';
import '../../shared/domain/usecases/login_user_usecase.dart';
import '../../shared/domain/usecases/logout_user_usecase.dart';
import '../../shared/domain/usecases/register_user_usecase.dart';
import '../../shared/domain/usecases/forgot_password_usecase.dart';
import '../../shared/infra/external/http/auth_datasouce_interface.dart';
import '../../shared/infra/repositories/auth_repository_impl.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ILoginUserUsecase>((i) => LoginUserUsecase(repository: i()),
            export: true),
        Bind<IRegisterUserUsecase>((i) => RegisterUserUsecase(repository: i()),
            export: true),
        Bind<IConfirmEmailUsecase>((i) => ConfirmEmailUsecase(repository: i()),
            export: true),
        Bind<ILogoutUserUsecase>((i) => LogoutUserUsecase(repository: i()),
            export: true),
        Bind<IResendConfirmationCodeUsecase>(
            (i) => ResendConfirmationCodeUsecase(repository: i()),
            export: true),
        Bind<IForgotPasswordUsecase>(
            (i) => ForgotPasswordUsecase(repository: i()),
            export: true),
        Bind<IConfirmResetPasswordUsecase>(
            (i) => ConfirmResetPasswordUsecase(repository: i()),
            export: true),
        Bind<IGetUserAttributesUsecase>(
            (i) => GetUserAttributesUsecase(repository: i()),
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
