// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_email_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmEmailController on ConfirmEmailControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ConfirmEmailControllerBase.state', context: context);

  @override
  ConfirmEmailState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ConfirmEmailState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ConfirmEmailControllerBase.email', context: context);

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

  late final _$codeAtom =
      Atom(name: 'ConfirmEmailControllerBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$confirmEmailAsyncAction =
      AsyncAction('ConfirmEmailControllerBase.confirmEmail', context: context);

  @override
  Future<void> confirmEmail() {
    return _$confirmEmailAsyncAction.run(() => super.confirmEmail());
  }

  late final _$ConfirmEmailControllerBaseActionController =
      ActionController(name: 'ConfirmEmailControllerBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ConfirmEmailControllerBaseActionController
        .startAction(name: 'ConfirmEmailControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ConfirmEmailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ConfirmEmailControllerBaseActionController
        .startAction(name: 'ConfirmEmailControllerBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ConfirmEmailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateCode(String? value) {
    final _$actionInfo = _$ConfirmEmailControllerBaseActionController
        .startAction(name: 'ConfirmEmailControllerBase.validateCode');
    try {
      return super.validateCode(value);
    } finally {
      _$ConfirmEmailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
email: ${email},
code: ${code}
    ''';
  }
}
