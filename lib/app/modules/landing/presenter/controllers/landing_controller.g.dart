// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LandingController on _LandingControllerBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged,
              name: '_LandingControllerBase.isLogged'))
          .value;
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
  Computed<List<Map<String, dynamic>>>? _$navbarComputed;

  @override
  List<Map<String, dynamic>> get navbar => (_$navbarComputed ??=
          Computed<List<Map<String, dynamic>>>(() => super.navbar,
              name: '_LandingControllerBase.navbar'))
      .value;

  late final _$loadingAtom =
      Atom(name: '_LandingControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$isFirstUseAtom =
      Atom(name: '_LandingControllerBase.isFirstUse', context: context);

  @override
  bool get isFirstUse {
    _$isFirstUseAtom.reportRead();
    return super.isFirstUse;
  }

  @override
  set isFirstUse(bool value) {
    _$isFirstUseAtom.reportWrite(value, super.isFirstUse, () {
      super.isFirstUse = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_LandingControllerBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

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

  late final _$isActiveOrderAtom =
      Atom(name: '_LandingControllerBase.isActiveOrder', context: context);

  @override
  bool get isActiveOrder {
    _$isActiveOrderAtom.reportRead();
    return super.isActiveOrder;
  }

  @override
  set isActiveOrder(bool value) {
    _$isActiveOrderAtom.reportWrite(value, super.isActiveOrder, () {
      super.isActiveOrder = value;
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
  void setActiveOrder(bool value, String id) {
    final _$actionInfo = _$_LandingControllerBaseActionController.startAction(
        name: '_LandingControllerBase.setActiveOrder');
    try {
      return super.setActiveOrder(value, id);
    } finally {
      _$_LandingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isFirstUse: ${isFirstUse},
user: ${user},
isActiveOrder: ${isActiveOrder},
isLogged: ${isLogged},
isUser: ${isUser},
isEmployee: ${isEmployee},
index: ${index},
navbar: ${navbar}
    ''';
  }
}
