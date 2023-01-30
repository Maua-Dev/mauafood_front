import 'dart:async';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../../../../generated/l10n.dart';
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
      return S.current.requiredFieldAlert;
    } else if (code.length != 6) {
      return S.current.invalidCodeAlert;
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
      return S.current.passwordInstructionsAlert;
    }
    return null;
  }

  Future<String?> _validatePasswordConfirm(String? passwordConfirmValue) async {
    if (password.value != passwordConfirmValue) {
      return S.current.equalPasswordAlert;
    }
    return null;
  }

  @override
  Future<void> submit() async {
    if (password.value == '' ||
        passwordConfirm.value == '' ||
        code.value == '') {
      emitFailure(failureResponse: S.current.correctFieldsInstructionsAlert);
    } else if (await password.validate() &&
        await passwordConfirm.validate() &&
        await code.validate()) {
      authBloc.add(ChangePassword(
          email: email,
          confirmationCode: code.value,
          newPassword: password.value));
      emitSuccess();
    } else {
      emitFailure(failureResponse: S.current.errorFields);
    }
  }

  @override
  FutureOr<void> onSubmitting() {}
}
