import 'dart:async';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';

import '../../../../../../generated/l10n.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final RegisterBloc registerBloc;

  final email = TextFieldBloc();

  final password = TextFieldBloc();

  final passwordConfirm = TextFieldBloc();

  final cpf = TextFieldBloc();

  final fullName = TextFieldBloc();

  bool isEnable = false;

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

  Future<String?> _validateCpf(String? cpfValue) async {
    cpfValue = cpfValue!.replaceAll('.', '');
    cpfValue = cpfValue.replaceAll('-', '');
    if (cpfValue.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!CPFValidator.isValid(cpfValue)) {
      return S.current.invalidCpfAlert;
    }
    return null;
  }

  Future<String?> _validateFullName(String? fullNameValue) async {
    if (fullNameValue!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (fullNameValue.split(' ').length < 2) {
      return S.current.invalidFullNameAlert;
    }
    return null;
  }

  final emailNotifications = BooleanFieldBloc();
  final appNotifications = BooleanFieldBloc();
  final acceptTerms = BooleanFieldBloc();

  RegisterFormBloc({required this.registerBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        passwordConfirm,
        cpf,
        fullName,
        emailNotifications,
        appNotifications,
        acceptTerms,
      ],
    );

    fullName.addAsyncValidators([_validateFullName]);
    cpf.addAsyncValidators([_validateCpf]);
    email.addAsyncValidators([_validateEmail]);
    password.addAsyncValidators([_validatePassword]);
    passwordConfirm.addAsyncValidators([_validatePasswordConfirm]);
  }

  @override
  Future<void> submit() async {
    if (email.value == '' ||
        password.value == '' ||
        cpf.value == '' ||
        passwordConfirm.value == '' ||
        fullName.value == '') {
      emitFailure(failureResponse: S.current.fillFieldsInstructionsAlert);
    } else if (acceptTerms.value) {
      registerBloc.add(RegisterUser(
        email: email.value,
        password: password.value,
        cpf: cpf.value,
        fullName: fullName.value,
        emailNotifications: emailNotifications.value,
        appNotifications: appNotifications.value,
        acceptTerms: acceptTerms.value,
        isStudent: false,
      ));
    } else {
      emitFailure(failureResponse: S.current.termsAcceptAlert);
    }
    emitSuccess();
  }

  @override
  FutureOr<void> onSubmitting() {}
}
