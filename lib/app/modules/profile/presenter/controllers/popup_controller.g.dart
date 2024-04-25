// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PopupStore on PopupStoreBase, Store {
  late final _$showPopupAtom =
      Atom(name: 'PopupStoreBase.showPopup', context: context);

  @override
  bool get showPopup {
    _$showPopupAtom.reportRead();
    return super.showPopup;
  }

  @override
  set showPopup(bool value) {
    _$showPopupAtom.reportWrite(value, super.showPopup, () {
      super.showPopup = value;
    });
  }

  late final _$gradeAtom = Atom(name: 'PopupStoreBase.grade', context: context);

  @override
  int get grade {
    _$gradeAtom.reportRead();
    return super.grade;
  }

  @override
  set grade(int value) {
    _$gradeAtom.reportWrite(value, super.grade, () {
      super.grade = value;
    });
  }

  late final _$sendFeedbackAsyncAction =
      AsyncAction('PopupStoreBase.sendFeedback', context: context);

  @override
  Future<void> sendFeedback() {
    return _$sendFeedbackAsyncAction.run(() => super.sendFeedback());
  }

  late final _$PopupStoreBaseActionController =
      ActionController(name: 'PopupStoreBase', context: context);

  @override
  void togglePopup() {
    final _$actionInfo = _$PopupStoreBaseActionController.startAction(
        name: 'PopupStoreBase.togglePopup');
    try {
      return super.togglePopup();
    } finally {
      _$PopupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openPopUp() {
    final _$actionInfo = _$PopupStoreBaseActionController.startAction(
        name: 'PopupStoreBase.openPopUp');
    try {
      return super.openPopUp();
    } finally {
      _$PopupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void evaluatedPopUp() {
    final _$actionInfo = _$PopupStoreBaseActionController.startAction(
        name: 'PopupStoreBase.evaluatedPopUp');
    try {
      return super.evaluatedPopUp();
    } finally {
      _$PopupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStars(int value) {
    final _$actionInfo = _$PopupStoreBaseActionController.startAction(
        name: 'PopupStoreBase.setStars');
    try {
      return super.setStars(value);
    } finally {
      _$PopupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPopup: ${showPopup},
grade: ${grade}
    ''';
  }
}
