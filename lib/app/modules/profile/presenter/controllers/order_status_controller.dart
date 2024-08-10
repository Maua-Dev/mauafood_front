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

  @observable
  Timer? _timer;

  @action
  Future<void> startPolling(String id) async {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      var result = await getCurrentOrderStateById(id);
      if (result.status == StatusEnum.READY) {
        stopPolling();
      }
      orderStatus = result.status;
    });
  }

  @action
  void stopPolling() {
    _timer?.cancel();
  }

  @action
  Future<OrderStatusModel> getCurrentOrderStateById(String id) async {
    var response = await _getCurrentOrderStateByIdUsecase(id);

    return response.fold(
      (l) => OrderStatusModel(
        status: StatusEnum.PENDING,
        id: id,
        abortedReason: null,
      ),
      (r) {
        return OrderStatusModel(
          status: r.status,
          id: r.id,
          abortedReason: r.abortedReason,
        );
      },
    );
  }
}
