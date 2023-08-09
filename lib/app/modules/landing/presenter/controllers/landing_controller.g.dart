// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LandingController on _LandingControllerBase, Store {
  Computed<bool>? _$isUserComputed;

  @override
  bool get isUser => (_$isUserComputed ??= Computed<bool>(() => super.isUser,
          name: '_LandingControllerBase.isUser'))
      .value;
  Computed<bool>? _$isEmployeeComputed;

  @override
  bool get isEmployee =>
      (_$isEmployeeComputed ??= Computed<bool>(() => super.isEmployee,
              name: '_LandingControllerBase.isEmployee'))
          .value;
  Computed<int>? _$indexComputed;

  @override
  int get index => (_$indexComputed ??= Computed<int>(() => super.index,
          name: '_LandingControllerBase.index'))
      .value;

  late final _$_selectedIndexAtom =
      Atom(name: '_LandingControllerBase._selectedIndex', context: context);

  @override
  int get _selectedIndex {
    _$_selectedIndexAtom.reportRead();
    return super._selectedIndex;
  }

  @override
  set _selectedIndex(int value) {
    _$_selectedIndexAtom.reportWrite(value, super._selectedIndex, () {
      super._selectedIndex = value;
    });
  }

  late final _$_LandingControllerBaseActionController =
      ActionController(name: '_LandingControllerBase', context: context);

  @override
  void selectIndex(int index) {
    final _$actionInfo = _$_LandingControllerBaseActionController.startAction(
        name: '_LandingControllerBase.selectIndex');
    try {
      return super.selectIndex(index);
    } finally {
      _$_LandingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isUser: ${isUser},
isEmployee: ${isEmployee},
index: ${index}
    ''';
  }
}
