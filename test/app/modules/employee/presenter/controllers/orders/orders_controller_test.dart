import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/orders/order_state.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/orders/orders_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/abort_order_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/change_order_status_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_all_active_orders.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mockito/mockito.dart';

class GetAllActiveOrdersSucessUsecaseMock extends Mock
    implements IGetAllActiveOrdersUsecase {
  @override
  Future<Either<Failure, List<OrderModel>>> call() async {
    final orders = [
      OrderModel(
        userName: 'John Doe',
        userId: '123',
        id: '456',
        totalPrice: 10,
        status: StatusEnum.PENDING,
        products: [],
        creationTime: DateTime.now().millisecondsSinceEpoch,
      ),
    ];
    return right(orders);
  }
}

class GetAllActiveOrdersFailedUsecaseMock extends Mock
    implements IGetAllActiveOrdersUsecase {
  @override
  Future<Either<Failure, List<OrderModel>>> call() async {
    return left(Failure(message: ''));
  }
}

class ChangeOrderStatusSucessUsecaseMock extends Mock
    implements IChangeOrderStatusUsecase {}

class AbortOrderSucessUsecaseMock extends Mock implements IAbortOrderUsecase {}

void main() {
  group('OrdersController', () {
    late OrdersController controller;
    GetAllActiveOrdersSucessUsecaseMock mockGetAllActiveOrdersSucessUsecase =
        GetAllActiveOrdersSucessUsecaseMock();
    GetAllActiveOrdersFailedUsecaseMock mockGetAllActiveOrdersFailedUsecase =
        GetAllActiveOrdersFailedUsecaseMock();
    ChangeOrderStatusSucessUsecaseMock mockChangeOrderStatusSucessUsecase =
        ChangeOrderStatusSucessUsecaseMock();
    AbortOrderSucessUsecaseMock mockAbortOrderSucessUsecase =
        AbortOrderSucessUsecaseMock();

    setUp(() async {
      await S.load(const Locale.fromSubtags(languageCode: 'en'));
    });

    test('must change order state correctly', () {
      controller = OrdersController(
        mockGetAllActiveOrdersSucessUsecase,
        mockChangeOrderStatusSucessUsecase,
        mockAbortOrderSucessUsecase,
      );
      controller.changeOrderState(OrderInitialState());
      expect(controller.orderState, isA<OrderInitialState>());
      controller
          .changeOrderState(OrderErrorState(failure: Failure(message: '')));
      expect(controller.orderState, isA<OrderErrorState>());
      controller.changeOrderState(const OrderLoadingState(1));
      expect(controller.orderState, isA<OrderLoadingState>());
      controller.changeOrderState(OrderLoadedSuccessState());
      expect(controller.orderState, isA<OrderLoadedSuccessState>());
    });

    test('must change state correctly', () {
      controller = OrdersController(
        mockGetAllActiveOrdersSucessUsecase,
        mockChangeOrderStatusSucessUsecase,
        mockAbortOrderSucessUsecase,
      );

      final orders = [
        OrderModel(
          userName: 'John Doe',
          userId: '123',
          id: '456',
          totalPrice: 10,
          status: StatusEnum.PENDING,
          products: [],
          creationTime: DateTime.now().millisecondsSinceEpoch,
        ),
      ];

      controller.changeState(OrdersInitialState());
      expect(controller.state, isA<OrdersInitialState>());
      controller.changeState(OrdersErrorState(failure: Failure(message: '')));
      expect(controller.state, isA<OrdersErrorState>());
      controller.changeState(OrdersLoadingState());
      expect(controller.state, isA<OrdersLoadingState>());
      controller.changeState(OrdersLoadedSuccessState(ordersList: orders));
      expect(controller.state, isA<OrdersLoadedSuccessState>());
    });

    test('must update ordersList when getAllActiveOrdersUsecase returns data',
        () async {
      controller = OrdersController(
        mockGetAllActiveOrdersSucessUsecase,
        mockChangeOrderStatusSucessUsecase,
        mockAbortOrderSucessUsecase,
      );
      await controller.getAllActiveOrders();
      expect(controller.ordersList, isNotEmpty);
    });

    test('must return OrdersErrorState', () async {
      controller = OrdersController(
        mockGetAllActiveOrdersFailedUsecase,
        mockChangeOrderStatusSucessUsecase,
        mockAbortOrderSucessUsecase,
      );

      await controller.getAllActiveOrders();
      expect(controller.state, isA<OrdersErrorState>());
    });
  });
}
