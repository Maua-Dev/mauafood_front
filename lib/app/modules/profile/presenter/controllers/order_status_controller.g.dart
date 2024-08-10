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

  late final _$_timerAtom =
      Atom(name: '_OrderStatusStoreBase._timer', context: context);

  @override
  Timer? get _timer {
    _$_timerAtom.reportRead();
    return super._timer;
  }

  @override
  set _timer(Timer? value) {
    _$_timerAtom.reportWrite(value, super._timer, () {
      super._timer = value;
    });
  }

  late final _$startPollingAsyncAction =
      AsyncAction('_OrderStatusStoreBase.startPolling', context: context);

  @override
  Future<void> startPolling(String id) {
    return _$startPollingAsyncAction.run(() => super.startPolling(id));
  }

  late final _$getCurrentOrderStateByIdAsyncAction = AsyncAction(
      '_OrderStatusStoreBase.getCurrentOrderStateById',
      context: context);

  @override
  Future<OrderStatusModel> getCurrentOrderStateById(String id) {
    return _$getCurrentOrderStateByIdAsyncAction
        .run(() => super.getCurrentOrderStateById(id));
  }

  late final _$_OrderStatusStoreBaseActionController =
      ActionController(name: '_OrderStatusStoreBase', context: context);

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
  String toString() {
    return '''
orderStatus: ${orderStatus}
    ''';
  }
}
