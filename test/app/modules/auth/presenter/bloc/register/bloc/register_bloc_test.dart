import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'package:mauafood_front/app/modules/auth/auth_module.dart';
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/confirm_email.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/register_user.dart';
import 'package:mauafood_front/app/modules/auth/domain/usecases/resend_confirmation_code.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'register_bloc_test.mocks.dart';

@GenerateMocks([
  RegisterUserInterface,
  ConfirmEmailInterface,
  ResendConfirmationCodeInterface,
])
void main() {
  initModules([AppModule(), AuthModule()]);
  RegisterUserInterface register = MockRegisterUserInterface();
  ConfirmEmailInterface confirmEmail = MockConfirmEmailInterface();
  ResendConfirmationCodeInterface resendConfirmationCode =
      MockResendConfirmationCodeInterface();
  late RegisterBloc bloc;
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    bloc = RegisterBloc(
        confirmEmail: confirmEmail,
        register: register,
        resendConfirmationCode: resendConfirmationCode);
  });

  String email = 'gabriel.godoybz@hotmail.com';
  String confirmationCode = '123';
  UserModel user = const UserModel(
    id: '',
    fullName: 'fullName',
    cpf: 'cpf',
    role: 'USER',
    email: 'email',
    password: 'password',
    appNotifications: true,
    emailNotifications: true,
    acceptTerms: true,
  );

  group('[TEST] - RegisterUser', () {
    var error = RegisterError(message: '');
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(register(user))
            .thenAnswer((realInvocation) async => const Right(true));
        bloc.add(RegisterUser(
          acceptTerms: user.acceptTerms,
          appNotifications: user.appNotifications,
          cpf: user.cpf,
          email: user.email,
          emailNotifications: user.emailNotifications,
          fullName: user.fullName,
          password: user.password,
          role: 'USER',
        ));
      },
      expect: () => [
        RegisterLoadingState(),
        const RegisterLoadedState(),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(register(user)).thenAnswer((realInvocation) async => Left(error));
        bloc.add(RegisterUser(
          acceptTerms: user.acceptTerms,
          appNotifications: user.appNotifications,
          cpf: user.cpf,
          email: user.email,
          emailNotifications: user.emailNotifications,
          fullName: user.fullName,
          role: 'USER',
          password: user.password,
        ));
      },
      expect: () => [
        RegisterLoadingState(),
        RegisterErrorState(error: error),
      ],
    );
  });

  group('[TEST] - ConfirmEmail', () {
    var error = ConfirmationEmailError(message: '', email: email);
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(confirmEmail(email, confirmationCode))
            .thenAnswer((realInvocation) async => const Right(true));
        bloc.add(ConfirmEmail(email: email, code: confirmationCode));
      },
      expect: () => [
        RegisterLoadingState(),
        const ConfirmLoadedState(isConfirmed: true),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(confirmEmail(email, confirmationCode))
            .thenAnswer((realInvocation) async => Left(error));
        bloc.add(ConfirmEmail(email: email, code: confirmationCode));
      },
      expect: () => [
        RegisterLoadingState(),
        RegisterErrorState(error: error),
      ],
    );
  });

  group('[TEST] - ResendConfirmationCode', () {
    var error = ResendCodeError(message: '');
    blocTest(
      'returns succesfull state',
      build: () => bloc,
      act: (bloc) {
        when(resendConfirmationCode(email))
            .thenAnswer((realInvocation) async => const Right(null));
        bloc.add(ResendConfirmationCode(email: email));
      },
      expect: () => [
        RegisterLoadingState(),
        const RegisterLoadedState(),
      ],
    );

    blocTest(
      'returns error',
      build: () => bloc,
      act: (bloc) {
        when(resendConfirmationCode(email))
            .thenAnswer((realInvocation) async => Left(error));
        bloc.add(ResendConfirmationCode(email: email));
      },
      expect: () => [
        RegisterLoadingState(),
        RegisterErrorState(error: error),
      ],
    );
  });
}
