// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on ProfileControllerBase, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??= Computed<String>(() => super.name,
          name: 'ProfileControllerBase.name'))
      .value;

  late final _$photoIndexAtom =
      Atom(name: 'ProfileControllerBase.photoIndex', context: context);

  @override
  int get photoIndex {
    _$photoIndexAtom.reportRead();
    return super.photoIndex;
  }

  @override
  set photoIndex(int value) {
    _$photoIndexAtom.reportWrite(value, super.photoIndex, () {
      super.photoIndex = value;
    });
  }

  late final _$tempPhotoIndexAtom =
      Atom(name: 'ProfileControllerBase.tempPhotoIndex', context: context);

  @override
  int get tempPhotoIndex {
    _$tempPhotoIndexAtom.reportRead();
    return super.tempPhotoIndex;
  }

  @override
  set tempPhotoIndex(int value) {
    _$tempPhotoIndexAtom.reportWrite(value, super.tempPhotoIndex, () {
      super.tempPhotoIndex = value;
    });
  }

  late final _$ProfileControllerBaseActionController =
      ActionController(name: 'ProfileControllerBase', context: context);

  @override
  void setPhotoIndex() {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setPhotoIndex');
    try {
      return super.setPhotoIndex();
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getTempPhotoIndex(int index) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.getTempPhotoIndex');
    try {
      return super.getTempPhotoIndex(index);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
photoIndex: ${photoIndex},
tempPhotoIndex: ${tempPhotoIndex},
name: ${name}
    ''';
  }
}
