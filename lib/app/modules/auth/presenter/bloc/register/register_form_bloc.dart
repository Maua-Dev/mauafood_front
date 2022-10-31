import 'dart:async';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../auth/auth_bloc.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final AuthBloc authBloc;

  final email = TextFieldBloc();

  final emailConfirm = TextFieldBloc();

  final password = TextFieldBloc();

  final passwordConfirm = TextFieldBloc();

  final cpf = TextFieldBloc();

  final fullName = TextFieldBloc();

  final ra = TextFieldBloc();
  final raFake = TextFieldBloc();

  bool isEnable = false;

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

  Future<String?> _validateEmailConfirm(String? emailConfirmValue) async {
    if (email.value != emailConfirmValue) {
      return 'Emails devem ser iguais.';
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

  Future<String?> _validateCpf(String? cpfValue) async {
    cpfValue = cpfValue!.replaceAll('.', '');
    cpfValue = cpfValue.replaceAll('-', '');
    if (cpfValue.isEmpty) {
      return 'Campo obrigatório.';
    } else if (!CPFValidator.isValid(cpfValue)) {
      return 'CPF inválido.';
    }
    return null;
  }

  Future<String?> _validateFullName(String? fullNameValue) async {
    if (fullNameValue!.isEmpty) {
      return 'Campo obrigatório.';
    } else if (fullNameValue.split(' ').length < 2) {
      return 'Por favor, insira o nome completo.';
    }
    return null;
  }

  Future<String?> _validateRa(String? raValue) async {
    if (isStudent.value) {
      raValue = raValue!.replaceAll('.', '');
      raValue = raValue.replaceAll('-', '');
      if (raValue.isEmpty) {
        return 'Campo obrigatório.';
      } else if (raValue.length != 8) {
        return 'RA inválido.';
      }
    }
    return null;
  }

  final isStudent = BooleanFieldBloc();

  final notifications = BooleanFieldBloc();

  RegisterFormBloc({required this.authBloc}) {
    addFieldBlocs(
      fieldBlocs: [
        email,
        emailConfirm,
        password,
        passwordConfirm,
        cpf,
        fullName,
        isStudent,
        raFake,
        notifications,
      ],
    );

    fullName.addAsyncValidators([_validateFullName]);
    cpf.addAsyncValidators([_validateCpf]);
    password.addAsyncValidators([_validatePassword]);
    passwordConfirm.addAsyncValidators([_validatePasswordConfirm]);
    email.addAsyncValidators([_validateEmail]);
    emailConfirm.addAsyncValidators([_validateEmailConfirm]);
    isStudent.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            raFake,
          ],
        );
        if (current.value) {
          addFieldBlocs(fieldBlocs: [
            ra,
          ]);
        } else {
          removeFieldBlocs(
            fieldBlocs: [
              ra,
            ],
          );
          addFieldBlocs(fieldBlocs: [
            raFake,
          ]);
        }
      },
    );
    ra.addAsyncValidators([_validateRa]);
  }

  @override
  Future<void> submit() async {
    if (notifications.value) {
      authBloc.add(RegisterUser(
          email: email.value,
          password: password.value,
          cpf: cpf.value,
          fullName: fullName.value,
          isStudent: isStudent.value,
          notifications: notifications.value));
    } else {
      emitFailure();
    }
    emitSuccess();
  }

  @override
  FutureOr<void> onSubmitting() {}
}
