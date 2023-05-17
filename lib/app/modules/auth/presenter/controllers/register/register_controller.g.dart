// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'RegisterControllerBase.state', context: context);

  @override
  RegisterState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(RegisterState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'RegisterControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'RegisterControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'RegisterControllerBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$fullNameAtom =
      Atom(name: 'RegisterControllerBase.fullName', context: context);

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: 'RegisterControllerBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$isStudentAtom =
      Atom(name: 'RegisterControllerBase.isStudent', context: context);

  @override
  bool get isStudent {
    _$isStudentAtom.reportRead();
    return super.isStudent;
  }

  @override
  set isStudent(bool value) {
    _$isStudentAtom.reportWrite(value, super.isStudent, () {
      super.isStudent = value;
    });
  }

  late final _$emailNotificationAtom =
      Atom(name: 'RegisterControllerBase.emailNotification', context: context);

  @override
  bool get emailNotification {
    _$emailNotificationAtom.reportRead();
    return super.emailNotification;
  }

  @override
  set emailNotification(bool value) {
    _$emailNotificationAtom.reportWrite(value, super.emailNotification, () {
      super.emailNotification = value;
    });
  }

  late final _$appNotificationAtom =
      Atom(name: 'RegisterControllerBase.appNotification', context: context);

  @override
  bool get appNotification {
    _$appNotificationAtom.reportRead();
    return super.appNotification;
  }

  @override
  set appNotification(bool value) {
    _$appNotificationAtom.reportWrite(value, super.appNotification, () {
      super.appNotification = value;
    });
  }

  late final _$acceptTermsAtom =
      Atom(name: 'RegisterControllerBase.acceptTerms', context: context);

  @override
  bool get acceptTerms {
    _$acceptTermsAtom.reportRead();
    return super.acceptTerms;
  }

  @override
  set acceptTerms(bool value) {
    _$acceptTermsAtom.reportWrite(value, super.acceptTerms, () {
      super.acceptTerms = value;
    });
  }

  late final _$registerUserAsyncAction =
      AsyncAction('RegisterControllerBase.registerUser', context: context);

  @override
  Future<void> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  late final _$RegisterControllerBaseActionController =
      ActionController(name: 'RegisterControllerBase', context: context);

  @override
  void changeState(RegisterState value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullName(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setFullName');
    try {
      return super.setFullName(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsStudent(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setIsStudent');
    try {
      return super.setIsStudent(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailNotification(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setEmailNotification');
    try {
      return super.setEmailNotification(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppNotification(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setAppNotification');
    try {
      return super.setAppNotification(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAcceptTerms(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setAcceptTerms');
    try {
      return super.setAcceptTerms(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateName(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateCpf(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateCpf');
    try {
      return super.validateCpf(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateConfirmPassword(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
fullName: ${fullName},
cpf: ${cpf},
isStudent: ${isStudent},
emailNotification: ${emailNotification},
appNotification: ${appNotification},
acceptTerms: ${acceptTerms}
    ''';
  }
}
