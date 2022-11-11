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
import 'package:mauafood_front/app/modules/auth/domain/usecases/login_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/logout_user.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth/auth_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/forgot-password/forgot_password_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/forgot_password_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/auth_button_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_button_login_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_field_login_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../bloc/auth/auth_bloc_test.mocks.dart';

@GenerateMocks([
  LoginUserInterface,
  LogoutUserInterface,
  ForgotPasswordInterface,
  ConfirmResetPasswordInterface,
  AuthStorageInterface
])
void main() {
  LoginUserInterface login = MockLoginUserInterface();
  LogoutUserInterface logout = MockLogoutUserInterface();
  ForgotPasswordInterface forgotPassword = MockForgotPasswordInterface();
  ConfirmResetPasswordInterface confirmResetPassword =
      MockConfirmResetPasswordInterface();
  AuthStorageInterface storage = MockAuthStorageInterface();
  late AuthBloc bloc;
  late ForgotPasswordBloc formBloc;

  setUpAll(() {
    HttpOverrides.global = null;

    bloc = AuthBloc(
      login: login,
      logout: logout,
      confirmResetPassword: confirmResetPassword,
      forgotPassword: forgotPassword,
      storage: storage,
    );
    formBloc = ForgotPasswordBloc(authBloc: bloc);
    initModules(
      [AppModule(), AuthModule()],
      replaceBinds: [
        modular.Bind<AuthBloc>((i) => bloc),
        modular.Bind<ForgotPasswordBloc>((i) => formBloc),
      ],
    );
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets(
      '[WIDGETS TEST] - ForgotPasswordPage must show widgets in bloc states',
      (widgetTester) async {
    var error = ForgotPasswordError(message: '');
    mockNetworkImagesFor(() async {
      when(forgotPassword(''))
          .thenAnswer((realInvocation) async => const Right(true));
      when(forgotPassword('error'))
          .thenAnswer((realInvocation) async => Left(error));
      await widgetTester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => bloc,
          child: ForgotPasswordPage(
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
      expect(textField, findsNWidgets(1));
      final text = find.byType(Text);
      expect(text, findsWidgets);
      final column = find.byType(Column);
      expect(column, findsNWidgets(2));
      final loading = find.byType(CircularProgressIndicator);
      expect(loading, findsNothing);

      await widgetTester
          .runAsync(() async => bloc.add(const ForgotPassword(email: '')));
      await widgetTester.pump();
      expect(loading, findsOneWidget);

      await widgetTester
          .runAsync(() async => bloc.add(const ForgotPassword(email: 'error')));
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
    });
  });
}
