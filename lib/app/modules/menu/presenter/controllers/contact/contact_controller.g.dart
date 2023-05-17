// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactController on ContactControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ContactControllerBase.state', context: context);

  @override
  ContactState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ContactState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'ContactControllerBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ContactControllerBase.email', context: context);

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

  late final _$nameAtom =
      Atom(name: 'ContactControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$sendEmailAsyncAction =
      AsyncAction('ContactControllerBase.sendEmail', context: context);

  @override
  Future<void> sendEmail() {
    return _$sendEmailAsyncAction.run(() => super.sendEmail());
  }

  late final _$ContactControllerBaseActionController =
      ActionController(name: 'ContactControllerBase', context: context);

  @override
  void changeState(ContactState value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMessage(String value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.changeMessage');
    try {
      return super.changeMessage(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEmail(String value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateName(String? value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateMessage(String? value) {
    final _$actionInfo = _$ContactControllerBaseActionController.startAction(
        name: 'ContactControllerBase.validateMessage');
    try {
      return super.validateMessage(value);
    } finally {
      _$ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
message: ${message},
email: ${email},
name: ${name}
    ''';
  }
}
