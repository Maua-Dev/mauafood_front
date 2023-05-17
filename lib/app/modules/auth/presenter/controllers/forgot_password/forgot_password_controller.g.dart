// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordController on ForgotPasswordControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ForgotPasswordControllerBase.state', context: context);

  @override
  ForgotPasswordState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ForgotPasswordState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ForgotPasswordControllerBase.email', context: context);

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

  late final _$forgotPasswordUserAsyncAction = AsyncAction(
      'ForgotPasswordControllerBase.forgotPasswordUser',
      context: context);

  @override
  Future<void> forgotPasswordUser() {
    return _$forgotPasswordUserAsyncAction
        .run(() => super.forgotPasswordUser());
  }

  late final _$ForgotPasswordControllerBaseActionController =
      ActionController(name: 'ForgotPasswordControllerBase', context: context);

  @override
  void changeState(ForgotPasswordState value) {
    final _$actionInfo = _$ForgotPasswordControllerBaseActionController
        .startAction(name: 'ForgotPasswordControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ForgotPasswordControllerBaseActionController
        .startAction(name: 'ForgotPasswordControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$ForgotPasswordControllerBaseActionController
        .startAction(name: 'ForgotPasswordControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$ForgotPasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
email: ${email}
    ''';
  }
}
