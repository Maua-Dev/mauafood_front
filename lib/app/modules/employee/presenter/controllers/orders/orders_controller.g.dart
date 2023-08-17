// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersController on OrdersControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'OrdersControllerBase.state', context: context);

  @override
  OrdersState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(OrdersState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$ordersListAtom =
      Atom(name: 'OrdersControllerBase.ordersList', context: context);

  @override
  List<OrderModel>? get ordersList {
    _$ordersListAtom.reportRead();
    return super.ordersList;
  }

  @override
  set ordersList(List<OrderModel>? value) {
    _$ordersListAtom.reportWrite(value, super.ordersList, () {
      super.ordersList = value;
    });
  }

  late final _$statusFilteredAtom =
      Atom(name: 'OrdersControllerBase.statusFiltered', context: context);

  @override
  StatusEnum get statusFiltered {
    _$statusFilteredAtom.reportRead();
    return super.statusFiltered;
  }

  @override
  set statusFiltered(StatusEnum value) {
    _$statusFilteredAtom.reportWrite(value, super.statusFiltered, () {
      super.statusFiltered = value;
    });
  }

  late final _$statusIndexAtom =
      Atom(name: 'OrdersControllerBase.statusIndex', context: context);

  @override
  int get statusIndex {
    _$statusIndexAtom.reportRead();
    return super.statusIndex;
  }

  @override
  set statusIndex(int value) {
    _$statusIndexAtom.reportWrite(value, super.statusIndex, () {
      super.statusIndex = value;
    });
  }

  late final _$OrdersControllerBaseActionController =
      ActionController(name: 'OrdersControllerBase', context: context);

  @override
  void changeState(OrdersState value) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAllOrderList() {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.getAllOrderList');
    try {
      return super.getAllOrderList();
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderStatus(int index, StatusEnum? value) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.setOrderStatus');
    try {
      return super.setOrderStatus(index, value);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusIndex(int index, StatusEnum status) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.setStatusIndex');
    try {
      return super.setStatusIndex(index, status);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
ordersList: ${ordersList},
statusFiltered: ${statusFiltered},
statusIndex: ${statusIndex}
    ''';
  }
}
