// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordController on ChangePasswordControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'ChangePasswordControllerBase.state', context: context);

  @override
  ChangePasswordState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ChangePasswordState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'ChangePasswordControllerBase.code', context: context);

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

  late final _$newPasswordAtom =
      Atom(name: 'ChangePasswordControllerBase.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$confirmNewPasswordAtom = Atom(
      name: 'ChangePasswordControllerBase.confirmNewPassword',
      context: context);

  @override
  String get confirmNewPassword {
    _$confirmNewPasswordAtom.reportRead();
    return super.confirmNewPassword;
  }

  @override
  set confirmNewPassword(String value) {
    _$confirmNewPasswordAtom.reportWrite(value, super.confirmNewPassword, () {
      super.confirmNewPassword = value;
    });
  }

  late final _$changePasswordAsyncAction = AsyncAction(
      'ChangePasswordControllerBase.changePassword',
      context: context);

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  late final _$ChangePasswordControllerBaseActionController =
      ActionController(name: 'ChangePasswordControllerBase', context: context);

  @override
  void changeState(ChangePasswordState value) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmNewPassword(String value) {
    final _$actionInfo =
        _$ChangePasswordControllerBaseActionController.startAction(
            name: 'ChangePasswordControllerBase.setConfirmNewPassword');
    try {
      return super.setConfirmNewPassword(value);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String? password) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateConfirmPassword(String? confirmPassword) {
    final _$actionInfo =
        _$ChangePasswordControllerBaseActionController.startAction(
            name: 'ChangePasswordControllerBase.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(confirmPassword);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateCode(String? code) {
    final _$actionInfo = _$ChangePasswordControllerBaseActionController
        .startAction(name: 'ChangePasswordControllerBase.validateCode');
    try {
      return super.validateCode(code);
    } finally {
      _$ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
code: ${code},
newPassword: ${newPassword},
confirmNewPassword: ${confirmNewPassword}
    ''';
  }
}
