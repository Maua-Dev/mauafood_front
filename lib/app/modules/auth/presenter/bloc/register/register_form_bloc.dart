import 'dart:async';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/register/bloc/register_bloc.dart';

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
      emitFailure(
          failureResponse: 'Certifique-se de que preencheu todos os campos.');
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
      emitFailure(failureResponse: 'É necessário aceitar os Termos de Uso.');
    }
    emitSuccess();
  }

  @override
  FutureOr<void> onSubmitting() {}
}
