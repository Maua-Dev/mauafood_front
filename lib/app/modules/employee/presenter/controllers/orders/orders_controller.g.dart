// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersController on OrdersControllerBase, Store {
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

  late final _$OrdersControllerBaseActionController =
      ActionController(name: 'OrdersControllerBase', context: context);

  @override
  void setIsPanelExpanded(int index) {
    final _$actionInfo = _$OrdersControllerBaseActionController.startAction(
        name: 'OrdersControllerBase.setIsPanelExpanded');
    try {
      return super.setIsPanelExpanded(index);
    } finally {
      _$OrdersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ordersList: ${ordersList}
    ''';
  }
}
