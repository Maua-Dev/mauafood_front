import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../register/bloc/register_bloc.dart';

class ResendCodeFormBloc extends FormBloc<String, String> {
  final RegisterBloc registerBloc;

  final email = TextFieldBloc();

  ResendCodeFormBloc({required this.registerBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        email,
      ],
    );
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

  @override
  Future<void> submit() async {
    if (email.value == '') {
      emitFailure(
          failureResponse: 'Certifique-se que digitou e-mail corretamente.');
    } else if (await email.validate()) {
      registerBloc.add(ResendConfirmationCode(email: email.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'E-mail inválido.');
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
