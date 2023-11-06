// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStatusController on _OrderStatusStoreBase, Store {
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

  late final _$orderAtom =
      Atom(name: '_OrderStatusStoreBase.order', context: context);

  @override
  OrderModel get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderModel value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$getCurrentOrderStateByIdAsyncAction = AsyncAction(
      '_OrderStatusStoreBase.getCurrentOrderStateById',
      context: context);

  @override
  Future<void> getCurrentOrderStateById(String orderId) {
    return _$getCurrentOrderStateByIdAsyncAction
        .run(() => super.getCurrentOrderStateById(orderId));
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
state: ${state},
order: ${order}
    ''';
  }
}
