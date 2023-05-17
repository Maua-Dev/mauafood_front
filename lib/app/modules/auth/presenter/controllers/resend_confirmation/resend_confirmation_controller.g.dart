// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_confirmation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResendConfirmationController
    on ResendConfirmationControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ResendConfirmationControllerBase.state', context: context);

  @override
  ResendConfirmationState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ResendConfirmationState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ResendConfirmationControllerBase.email', context: context);

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

  late final _$resendConfirmationCodeAsyncAction = AsyncAction(
      'ResendConfirmationControllerBase.resendConfirmationCode',
      context: context);

  @override
  Future<void> resendConfirmationCode() {
    return _$resendConfirmationCodeAsyncAction
        .run(() => super.resendConfirmationCode());
  }

  late final _$ResendConfirmationControllerBaseActionController =
      ActionController(
          name: 'ResendConfirmationControllerBase', context: context);

  @override
  void changeState(ResendConfirmationState value) {
    final _$actionInfo = _$ResendConfirmationControllerBaseActionController
        .startAction(name: 'ResendConfirmationControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ResendConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ResendConfirmationControllerBaseActionController
        .startAction(name: 'ResendConfirmationControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ResendConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$ResendConfirmationControllerBaseActionController
        .startAction(name: 'ResendConfirmationControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$ResendConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
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
