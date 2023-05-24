// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LogoutController on LogoutControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'LogoutControllerBase.state', context: context);

  @override
  LogoutState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LogoutState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$logoutUserAsyncAction =
      AsyncAction('LogoutControllerBase.logoutUser', context: context);

  @override
  Future<void> logoutUser() {
    return _$logoutUserAsyncAction.run(() => super.logoutUser());
  }

  late final _$LogoutControllerBaseActionController =
      ActionController(name: 'LogoutControllerBase', context: context);

  @override
  void changeState(LogoutState value) {
    final _$actionInfo = _$LogoutControllerBaseActionController.startAction(
        name: 'LogoutControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$LogoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
