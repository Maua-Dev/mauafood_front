import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_bloc.dart';

class ChangePasswordBloc extends FormBloc<String, String> {
  final AuthBloc authBloc;

  final password = TextFieldBloc();
  final confirmPassword = TextFieldBloc();

  ChangePasswordBloc({required this.authBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        password,
        confirmPassword,
      ],
    );
  }

  @override
  Future<void> submit() async {
    if (password.value == '' || confirmPassword.value == '') {
      emitFailure(
          failureResponse: 'Certifique-se que digitou e-mail corretamente.');
    } else if (await password.validate() && await confirmPassword.validate()) {
      authBloc.add(ConfirmResetPassword(
          email: '', confirmationCode: '', newPassword: password.value));
      Modular.to.pushNamed('/login/change-password/', arguments: authBloc);
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'Erro com e-mail inserido.');
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
