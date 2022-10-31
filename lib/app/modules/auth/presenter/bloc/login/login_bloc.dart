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
  }

  @override
  Future<void> submit() async {
    authBloc.add(LoginWithEmail(email: email.value, password: password.value));
    emitSuccess();
  }

  @override
  FutureOr<void> onSubmitting() {}
}
