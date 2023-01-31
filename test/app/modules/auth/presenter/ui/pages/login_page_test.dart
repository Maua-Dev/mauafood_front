import 'dart:collection';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
import 'package:mauafood_front/app/modules/auth/presenter/bloc/login/login_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/login_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/auth_button_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_button_login_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_field_login_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
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
  late LoginBloc formLoginBloc;
  LinkedHashMap map = LinkedHashMap.of(
      {'refreshToken': '123', 'accessToken': '123', 'idToken': '123'});

  setUpAll(() {
    HttpOverrides.global = null;

    bloc = AuthBloc(
      login: login,
      logout: logout,
      confirmResetPassword: confirmResetPassword,
      forgotPassword: forgotPassword,
      storage: storage,
      getUserAttributes: getUserAttributes,
    );
    formLoginBloc = LoginBloc(authBloc: bloc);
    initModules(
      [AppModule(), AuthModule()],
      replaceBinds: [
        modular.Bind<AuthBloc>((i) => bloc),
        modular.Bind<LoginBloc>((i) => formLoginBloc),
      ],
    );
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets('[WIDGETS TEST] - LoginPage must show widgets in bloc states',
      (widgetTester) async {
    mockNetworkImagesFor(() async {
      var error = SignUpError(message: '');
      when(login('', ''))
          .thenAnswer((realInvocation) async => Right(CognitoAuthSession(
              isSignedIn: true,
              credentials: AWSCredentials.init(creds: {
                'awsAccessKey': '123',
                'awsSecretKey': '123',
                'sessionToken': '123',
              }),
              identityId: '123',
              userSub: '123',
              userPoolTokens: AWSCognitoUserPoolTokens.init(tokens: map))));
      when(login('error', 'error'))
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
          child: const LoginPage(),
        ),
      ));

      final image = find.byType(Image);
      expect(image, findsOneWidget);
      final textButtonWidget = find.byType(TextButtonLoginWidget);
      expect(textButtonWidget, findsNWidgets(3));
      final authButtonWidget = find.byType(AuthButtonWidget);
      expect(authButtonWidget, findsOneWidget);
      final textField = find.byType(TextFieldLoginWidget);
      expect(textField, findsNWidgets(2));
      final text = find.byType(Text);
      expect(text, findsWidgets);
      final column = find.byType(Column);
      expect(column, findsNWidgets(4));
      final container = find.byType(Container);
      expect(container, findsNWidgets(1));
      final loading = find.byType(CircularProgressIndicator);
      expect(loading, findsNothing);

      await widgetTester.runAsync(
          () async => bloc.add(const LoginWithEmail(email: '', password: '')));
      await widgetTester.pump();

      await widgetTester.runAsync(() async =>
          bloc.add(const LoginWithEmail(email: 'error', password: 'error')));
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
