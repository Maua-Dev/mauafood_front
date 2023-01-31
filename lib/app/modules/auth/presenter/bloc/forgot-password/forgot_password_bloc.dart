import 'dart:async';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../../generated/l10n.dart';
import '../auth/auth_bloc.dart';

class ForgotPasswordBloc extends FormBloc<String, String> {
  final AuthBloc authBloc;

  final email = TextFieldBloc();

  ForgotPasswordBloc({required this.authBloc}) {
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
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(emailValue)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  @override
  Future<void> submit() async {
    if (email.value == '') {
      emitFailure(failureResponse: S.current.typeEmailCorrectlyAlert);
    } else if (await email.validate()) {
      authBloc.add(ForgotPassword(email: email.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: S.current.invalidEmailAlert);
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
