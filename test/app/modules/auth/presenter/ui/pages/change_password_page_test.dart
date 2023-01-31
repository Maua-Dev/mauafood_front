import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/auth/auth_module.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_reset_password.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/forgot_password.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/get_user_attributes.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/login_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/change-password/change_password_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/change_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/auth_button_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_button_login_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_field_login_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../bloc/auth/auth_bloc_test.mocks.dart';

@GenerateMocks([
  LoginUserInterface,
  LogoutUserInterface,
  ForgotPasswordInterface,
  ConfirmResetPasswordInterface,
  GetUserAttributesInterface,
  AuthStorageInterface
])
void main() {
  LoginUserInterface login = MockLoginUserInterface();
  LogoutUserInterface logout = MockLogoutUserInterface();
  ForgotPasswordInterface forgotPassword = MockForgotPasswordInterface();
  ConfirmResetPasswordInterface confirmResetPassword =
      MockConfirmResetPasswordInterface();
  GetUserAttributesInterface getUserAttributes =
      MockGetUserAttributesInterface();
  AuthStorageInterface storage = MockAuthStorageInterface();
  late AuthBloc bloc;
  late ChangePasswordBloc formBloc;

  setUpAll(() {
    HttpOverrides.global = null;

    bloc = AuthBloc(
        login: login,
        logout: logout,
        confirmResetPassword: confirmResetPassword,
        forgotPassword: forgotPassword,
        storage: storage,
        getUserAttributes: getUserAttributes);
    formBloc = ChangePasswordBloc(authBloc: bloc, email: '');
    initModules(
      [AppModule(), AuthModule()],
      replaceBinds: [
        modular.Bind<AuthBloc>((i) => bloc),
        modular.Bind<ChangePasswordBloc>((i) => formBloc),
      ],
    );
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets(
      '[WIDGETS TEST] - ChangePasswordPage must show widgets in bloc states',
      (widgetTester) async {
    var error = ForgotPasswordError(message: '');
    mockNetworkImagesFor(() async {
      when(confirmResetPassword('', '', ''))
          .thenAnswer((realInvocation) async => const Right(null));
      when(confirmResetPassword('error', 'error', 'error'))
          .thenAnswer((realInvocation) async => Left(error));
      await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: BlocProvider(
          create: (context) => bloc,
          child: ChangePasswordPage(
            authBloc: bloc,
          ),
        ),
      ));

      final image = find.byType(Image);
      expect(image, findsOneWidget);
      final textButtonWidget = find.byType(TextButtonLoginWidget);
      expect(textButtonWidget, findsNWidgets(1));
      final authButtonWidget = find.byType(AuthButtonWidget);
      expect(authButtonWidget, findsOneWidget);
      final textField = find.byType(TextFieldLoginWidget);
      expect(textField, findsNWidgets(3));
      final text = find.byType(Text);
      expect(text, findsWidgets);
      final column = find.byType(Column);
      expect(column, findsNWidgets(4));
      final loading = find.byType(CircularProgressIndicator);
      expect(loading, findsNothing);

      await widgetTester.runAsync(() async => bloc.add(const ChangePassword(
          email: '', confirmationCode: '', newPassword: '')));
      await widgetTester.pump();

      await widgetTester.runAsync(() async => bloc.add(const ChangePassword(
          email: 'error', confirmationCode: 'error', newPassword: 'error')));
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
