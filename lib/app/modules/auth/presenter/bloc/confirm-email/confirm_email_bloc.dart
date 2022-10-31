import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../auth/auth_bloc.dart';

class ConfirmEmailBloc extends FormBloc<String, String> {
  final AuthBloc authBloc;

  final code = TextFieldBloc();

  ConfirmEmailBloc({required this.authBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        code,
      ],
    );
  }

  @override
  Future<void> submit() async {
    authBloc.add(
        ConfirmEmail(email: 'gabriel.godoybz@hotmail.com', code: code.value));
    emitSuccess();
  }

  @override
  FutureOr<void> onSubmitting() {}
}
