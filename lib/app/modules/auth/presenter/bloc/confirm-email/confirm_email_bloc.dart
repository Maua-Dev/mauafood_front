import 'dart:async';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../../../../generated/l10n.dart';
import '../register/bloc/register_bloc.dart';

class ConfirmEmailBloc extends FormBloc<String, String> {
  final RegisterBloc registerBloc;
  final String email;

  final code = TextFieldBloc();

  ConfirmEmailBloc({required this.email, required this.registerBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        code,
      ],
    );
    code.addAsyncValidators([_validateCode]);
  }

  Future<String?> _validateCode(String? code) async {
    if (code!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (code.length != 6) {
      return S.current.invalidCodeAlert;
    }
    return null;
  }

  @override
  Future<void> submit() async {
    if (await code.validate()) {
      registerBloc.add(ConfirmEmail(email: email, code: code.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: S.current.codeErrorAlert);
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
