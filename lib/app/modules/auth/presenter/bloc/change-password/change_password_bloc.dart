import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_bloc.dart';

class ChangePasswordBloc extends FormBloc<String, String> {
  final AuthBloc authBloc;
  final String email;

  final password = TextFieldBloc();
  final passwordConfirm = TextFieldBloc();
  final code = TextFieldBloc();

  ChangePasswordBloc({required this.email, required this.authBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        password,
        passwordConfirm,
        code,
      ],
    );
    code.addAsyncValidators([_validateCode]);
    password.addAsyncValidators([_validatePassword]);
    passwordConfirm.addAsyncValidators([_validatePasswordConfirm]);
  }

  Future<String?> _validateCode(String? code) async {
    if (code!.isEmpty) {
      return 'Campo obrigatório.';
    } else if (code.length != 6) {
      return 'Código inválido.';
    }
    return null;
  }

  Future<String?> _validatePassword(String? passwordValue) async {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (passwordValue!.isEmpty) {
      return 'Campo obrigatório.';
    } else if (!regExp.hasMatch(passwordValue)) {
      return 'Sua senha deve conter: \n - Uma ou mais letras maiúsculas \n - Uma ou mais letras minúsculas \n - Um ou mais números \n - Um ou mais caracteres especiais\n(#, ?, !, @, \$, %, ^, &, *, -)  \n - Mínimo de 8 caracteres';
    }
    return null;
  }

  Future<String?> _validatePasswordConfirm(String? passwordConfirmValue) async {
    if (password.value != passwordConfirmValue) {
      return 'Senhas devem ser iguais.';
    }
    return null;
  }

  @override
  Future<void> submit() async {
    if (password.value == '' ||
        passwordConfirm.value == '' ||
        code.value == '') {
      emitFailure(
          failureResponse: 'Certifique-se que os campos estão corretos.');
    } else if (await password.validate() &&
        await passwordConfirm.validate() &&
        await code.validate()) {
      authBloc.add(ChangePassword(
          email: email,
          confirmationCode: password.value,
          newPassword: password.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'Erro os campos inseridos.');
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
