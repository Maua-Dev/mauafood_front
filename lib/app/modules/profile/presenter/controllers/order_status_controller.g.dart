// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStatusController on _OrderStatusStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_OrderStatusStoreBase.value', context: context);

  @override
  bool get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(bool value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$orderToGetAtom =
      Atom(name: '_OrderStatusStoreBase.orderToGet', context: context);

  @override
  OrderModel get orderToGet {
    _$orderToGetAtom.reportRead();
    return super.orderToGet;
  }

  @override
  set orderToGet(OrderModel value) {
    _$orderToGetAtom.reportWrite(value, super.orderToGet, () {
      super.orderToGet = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_OrderStatusStoreBase.state', context: context);

  @override
  OrderStatusState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(OrderStatusState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getCurrentOrderStateByIdAsyncAction = AsyncAction(
      '_OrderStatusStoreBase.getCurrentOrderStateById',
      context: context);

  @override
  Future<void> getCurrentOrderStateById(OrderModel order) {
    return _$getCurrentOrderStateByIdAsyncAction
        .run(() => super.getCurrentOrderStateById(order));
  }

  late final _$abortOrderAsyncAction =
      AsyncAction('_OrderStatusStoreBase.abortOrder', context: context);

  @override
  Future<void> abortOrder() {
    return _$abortOrderAsyncAction.run(() => super.abortOrder());
  }

  late final _$_OrderStatusStoreBaseActionController =
      ActionController(name: '_OrderStatusStoreBase', context: context);

  @override
  void longPooling(OrderModel order) {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.longPooling');
    try {
      return super.longPooling(order);
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startPolling() {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.startPolling');
    try {
      return super.startPolling();
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopPolling() {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.stopPolling');
    try {
      return super.stopPolling();
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValue() {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.setValue');
    try {
      return super.setValue();
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeState(OrderStatusState value) {
    final _$actionInfo = _$_OrderStatusStoreBaseActionController.startAction(
        name: '_OrderStatusStoreBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$_OrderStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
orderToGet: ${orderToGet},
state: ${state}
    ''';
  }
}
