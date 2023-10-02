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

  late final _$orderStateAtom =
      Atom(name: 'OrdersControllerBase.orderState', context: context);

  @override
  OrderState get orderState {
    _$orderStateAtom.reportRead();
    return super.orderState;
  }

  @override
  set orderState(OrderState value) {
    _$orderStateAtom.reportWrite(value, super.orderState, () {
      super.orderState = value;
    });
  }

  late final _$ordersListAtom =
      Atom(name: 'OrdersControllerBase.ordersList', context: context);

  @override
  List<OrderModel> get ordersList {
    _$ordersListAtom.reportRead();
    return super.ordersList;
  }

  @override
  set ordersList(List<OrderModel> value) {
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

  late final _$reasonIndexAtom =
      Atom(name: 'OrdersControllerBase.reasonIndex', context: context);

  @override
  int get reasonIndex {
    _$reasonIndexAtom.reportRead();
    return super.reasonIndex;
  }

  @override
  set reasonIndex(int value) {
    _$reasonIndexAtom.reportWrite(value, super.reasonIndex, () {
      super.reasonIndex = value;
    });
  }

  late final _$reasonDescriptionAtom =
      Atom(name: 'OrdersControllerBase.reasonDescription', context: context);

  @override
  String get reasonDescription {
    _$reasonDescriptionAtom.reportRead();
    return super.reasonDescription;
  }

  @override
  set reasonDescription(String value) {
    _$reasonDescriptionAtom.reportWrite(value, super.reasonDescription, () {
      super.reasonDescription = value;
    });
  }

  late final _$isMissingDescriptionAtom =
      Atom(name: 'OrdersControllerBase.isMissingDescription', context: context);

  @override
  bool get isMissingDescription {
    _$isMissingDescriptionAtom.reportRead();
    return super.isMissingDescription;
  }

  @override
  set isMissingDescription(bool value) {
    _$isMissingDescriptionAtom.reportWrite(value, super.isMissingDescription,
        () {
      super.isMissingDescription = value;
    });
  }

  late final _$getAllActiveOrdersAsyncAction =
      AsyncAction('OrdersControllerBase.getAllActiveOrders', context: context);

  @override
  Future<void> getAllActiveOrders() {
    return _$getAllActiveOrdersAsyncAction
        .run(() => super.getAllActiveOrders());
  }

  late final _$changeOrderStatusAsyncAction =
      AsyncAction('OrdersControllerBase.changeOrderStatus', context: context);

  @override
  Future<void> changeOrderStatus(int index, StatusEnum? value) {
    return _$changeOrderStatusAsyncAction
        .run(() => super.changeOrderStatus(index, value));
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
  void changeOrderState(OrderState value) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.changeOrderState');
    try {
      return super.changeOrderState(value);
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
  void setReasonIndex(int value) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.setReasonIndex');
    try {
      return super.setReasonIndex(value);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReasonDescription(String value) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.setReasonDescription');
    try {
      return super.setReasonDescription(value);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateReasonDescription(String? value) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.validateReasonDescription');
    try {
      return super.validateReasonDescription(value);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
orderState: ${orderState},
ordersList: ${ordersList},
statusFiltered: ${statusFiltered},
statusIndex: ${statusIndex},
reasonIndex: ${reasonIndex},
reasonDescription: ${reasonDescription},
isMissingDescription: ${isMissingDescription}
    ''';
  }
}
