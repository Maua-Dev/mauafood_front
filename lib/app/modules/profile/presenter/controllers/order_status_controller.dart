import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/abort_order_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_current_order_state_by_id_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mobx/mobx.dart';

part 'order_status_controller.g.dart';

class OrderStatusController = _OrderStatusStoreBase
    with _$OrderStatusController;

abstract class _OrderStatusStoreBase with Store {
  final IGetCurrentOrderStateByIdUsecase _getCurrentOrderStateByIdUsecase;
  final IAbortOrderUsecase _abortOrderUsecase;

  _OrderStatusStoreBase(
      this._getCurrentOrderStateByIdUsecase, this._abortOrderUsecase);

  @observable
  StatusEnum orderStatus = StatusEnum.PENDING;

  Timer? _timerPending;
  Timer? _timerPreparing;

  @observable
  int counter = 0;

  @action
  void startPolling(String id) {
    print(" antes $counter");
    startTimer();
  }

  void startTimer() {
    counter = 0;
    _timerPending = Timer.periodic(const Duration(seconds: 5), (timer) {
      addToCounter();
      if (counter > 5) {
        timer.cancel();
      }
    });
  }

  @action
  void addToCounter() {
    counter++;
    print(counter);
  }

  // @action
  // void startPolling(OrderModel order) {
  //   Future.delayed(const Duration(seconds: 5), () async {
  //     var result = await _getCurrentOrderStateByIdUsecase(order.id);
  //     result.fold((l) => print(l), (r) {
  //       orderStatus = r.status;
  //       if (orderStatus == StatusEnum.PENDING) {
  //         startPolling(order);
  //       }
  //     });
  //   });
  // }
}
