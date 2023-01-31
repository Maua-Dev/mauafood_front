import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../../generated/l10n.dart';
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
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(emailValue)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  Future<String?> _validatePassword(String? passwordValue) async {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (passwordValue!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(passwordValue)) {
      return S.current.invalidPasswordAlert;
    }
    return null;
  }

  @override
  Future<void> submit() async {
    if (email.value == '' || password.value == '') {
      emitFailure(failureResponse: S.current.typeEmailPasswordAlert);
    } else if (await email.validate() && await password.validate()) {
      authBloc
          .add(LoginWithEmail(email: email.value, password: password.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: S.current.errorEmailOrPassword);
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
