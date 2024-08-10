// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStatusController on _OrderStatusStoreBase, Store {
  late final _$orderStatusAtom =
      Atom(name: '_OrderStatusStoreBase.orderStatus', context: context);

  @override
  StatusEnum get orderStatus {
    _$orderStatusAtom.reportRead();
    return super.orderStatus;
  }

  @override
  set orderStatus(StatusEnum value) {
    _$orderStatusAtom.reportWrite(value, super.orderStatus, () {
      super.orderStatus = value;
    });
  }

  late final _$counterAtom =
      Atom(name: '_OrderStatusStoreBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$_OrderStatusStoreBaseActionController =
      ActionController(name: '_OrderStatusStoreBase', context: context);

  @override
  void startPolling(String id) {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.startPolling');
    try {
      return super.startPolling(id);
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToCounter() {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.addToCounter');
    try {
      return super.addToCounter();
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderStatus: ${orderStatus},
counter: ${counter}
    ''';
  }
}
