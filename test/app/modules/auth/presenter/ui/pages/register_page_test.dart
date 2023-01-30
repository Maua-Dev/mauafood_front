import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:mauafood_front/app/modules/auth/auth_module.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_email.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/register_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/resend_confirmation_code.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/register_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/checkbox_field_login_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/register_button_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_button_login_widget.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/text_field_login_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import '../../bloc/register/bloc/register_bloc_test.mocks.dart';

@GenerateMocks([
  RegisterUserInterface,
  ConfirmEmailInterface,
  ResendConfirmationCodeInterface,
])
void main() {
  RegisterUserInterface register = MockRegisterUserInterface();
  ConfirmEmailInterface confirmEmail = MockConfirmEmailInterface();
  ResendConfirmationCodeInterface resendConfirmationCode =
      MockResendConfirmationCodeInterface();
  late RegisterBloc bloc;
  UserModel user = const UserModel(
    id: null,
    fullName: 'fullName',
    cpf: 'cpf',
    isStudent: false,
    email: 'email',
    password: 'password',
    appNotifications: true,
    emailNotifications: true,
    acceptTerms: true,
  );
  UserModel userError = const UserModel(
    id: null,
    fullName: '',
    cpf: 'cpf',
    isStudent: false,
    email: 'email',
    password: 'password',
    appNotifications: true,
    emailNotifications: true,
    acceptTerms: true,
  );

  setUpAll(() {
    HttpOverrides.global = null;
    bloc = RegisterBloc(
        confirmEmail: confirmEmail,
        register: register,
        resendConfirmationCode: resendConfirmationCode);
    initModules(
      [AppModule(), AuthModule()],
      replaceBinds: [
        modular.Bind<RegisterBloc>((i) => bloc),
      ],
    );
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets('[WIDGETS TEST] - RegisterPage must show widgets in bloc states',
      (widgetTester) async {
    var error = RegisterError(message: '');
    when(register(user))
        .thenAnswer((realInvocation) async => const Right(true));
    when(register(userError)).thenAnswer((realInvocation) async => Left(error));

    await widgetTester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: BlocProvider(
        create: (context) => bloc,
        child: const RegisterPage(),
      ),
    ));
    for (int i = 0; i < 3; i++) {
      await widgetTester.pump(const Duration(seconds: 1));
    }

    final image = find.byType(Image);
    expect(image, findsNothing);
    final textButtonWidget = find.byType(TextButtonLoginWidget);
    expect(textButtonWidget, findsNWidgets(1));
    final authButtonWidget = find.byType(RegisterButtonWidget);
    expect(authButtonWidget, findsOneWidget);
    final textField = find.byType(TextFieldLoginWidget);
    expect(textField, findsNWidgets(5));
    final checkBox = find.byType(CheckboxFieldLoginWidget);
    expect(checkBox, findsNWidgets(3));
    final text = find.byType(Text);
    expect(text, findsWidgets);
    final column = find.byType(Column);
    expect(column, findsNWidgets(6));
    final container = find.byType(Container);
    expect(container, findsNWidgets(3));
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsNothing);

    await widgetTester.runAsync(() async => bloc.add(RegisterUser(
          acceptTerms: userError.acceptTerms,
          appNotifications: userError.appNotifications,
          cpf: userError.cpf,
          email: userError.email,
          emailNotifications: userError.emailNotifications,
          fullName: userError.fullName,
          isStudent: userError.isStudent,
          password: userError.password,
        )));
  });
}
