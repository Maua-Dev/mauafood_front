import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../auth/auth_bloc.dart';

class LoginBloc extends FormBloc<String, String> {
  final AuthBloc authBloc;

  final email = TextFieldBloc();
  final password = TextFieldBloc();

  LoginBloc({required this.authBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
    password.addAsyncValidators([_validatePassword]);
    email.addAsyncValidators([_validateEmail]);
  }

  Future<String?> _validateEmail(String? emailValue) async {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (emailValue!.isEmpty) {
      return 'Campo obrigatório.';
    } else if (!regExp.hasMatch(emailValue)) {
      return 'E-mail inválido.';
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
      return 'Senha inválida.';
    }
    return null;
  }

  @override
  Future<void> submit() async {
    if (email.value == '' || password.value == '') {
      emitFailure(failureResponse: 'Certifique-se que digitou e-mail e senha.');
    } else if (await email.validate() && await password.validate()) {
      authBloc
          .add(LoginWithEmail(email: email.value, password: password.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'Erro com e-mail ou senha.');
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
