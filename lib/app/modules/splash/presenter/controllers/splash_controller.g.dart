// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashController on SplashControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'SplashControllerBase.state', context: context);

  @override
  SplashState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SplashState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$loadSplashAsyncAction =
      AsyncAction('SplashControllerBase.loadSplash', context: context);

  @override
  Future<void> loadSplash() {
    return _$loadSplashAsyncAction.run(() => super.loadSplash());
  }

  late final _$SplashControllerBaseActionController =
      ActionController(name: 'SplashControllerBase', context: context);

  @override
  void changeState(SplashState value) {
    final _$actionInfo = _$SplashControllerBaseActionController.startAction(
        name: 'SplashControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
