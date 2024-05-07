import 'dart:async';

import 'package:mauafood_front/app/modules/profile/presenter/states/order_status_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/domain/usecases/abort_order_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_current_order_state_by_id_usecase.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:mauafood_front/app/shared/infra/models/order_model.dart';
import 'package:mobx/mobx.dart';
part 'order_status_controller.g.dart';

// ignore: library_private_types_in_public_api
class OrderStatusController = _OrderStatusStoreBase
    with _$OrderStatusController;

abstract class _OrderStatusStoreBase with Store {
  final IGetCurrentOrderStateByIdUsecase _getCurrentOrderStateByIdUsecase;
  final IAbortOrderUsecase _abortOrderUsecase;

  void longPooling(OrderModel order) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentOrderStateById(order);
      if (order.status == StatusEnum.READY) {
        timer.cancel();
      }
    });
  }

  OrderModel orderToGet = OrderModel(
      status: StatusEnum.PENDING,
      id: "",
      totalPrice: 0,
      userName: "",
      userId: "",
      creationTime: 0,
      products: []);

  _OrderStatusStoreBase(
      this._getCurrentOrderStateByIdUsecase, this._abortOrderUsecase);

  @observable
  OrderStatusState state = const InitialOrderStatusState();

  @action
  void changeState(OrderStatusState value) => state = value;

  @action
  Future<void> getCurrentOrderStateById(OrderModel order) async {
    changeState(const LoadingOrderStatusState());

    var response = await _getCurrentOrderStateByIdUsecase(order.id);

    changeState(response.fold((l) => ErrorOrderStatusState(l.message), ((r) {
      order.status = r.status;
      orderToGet = order;
      return SuccessOrderStatusState(order);
    })));
  }

  @action
  Future<void> abortOrder() async {
    changeState(const LoadingOrderStatusState());
    var result = await _abortOrderUsecase(orderToGet.id, "");

    changeState(
      result.fold(
        (l) {
          GlobalSnackBar.error(l.message);
          return state;
        },
        (r) {
          return SuccessOrderStatusState(orderToGet);
        },
      ),
    );
  }
}
