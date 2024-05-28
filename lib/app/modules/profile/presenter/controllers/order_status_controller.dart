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

  _OrderStatusStoreBase(
      this._getCurrentOrderStateByIdUsecase, this._abortOrderUsecase) {
    startPolling();
  }

  @action
  void longPooling(OrderModel order) {
    int i = 0;
    setValue();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      // getCurrentOrderStateById(order);
      print("Entrou");
      if (order.status == StatusEnum.READY || i > 5) {
        timer.cancel();
      }
    });
  }

  @observable
  bool value = false;

  Timer? _timer;

  // Inicia o polling
  @action
  void startPolling() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      print("Entrou");
      setValue();
    });
  }

  // Para o polling
  @action
  void stopPolling() {
    _timer?.cancel();
  }

  // Método que deve ser chamado quando o controlador é descartado
  void dispose() {
    stopPolling();
  }

  @action
  void setValue() {
    if (orderToGet.status == StatusEnum.READY) {
      print("Mudou pra pending");
      orderToGet = orderToGet.copyWith(status: StatusEnum.PENDING);
    }
    if (orderToGet.status == StatusEnum.PREPARING) {
      print("Mudou pra ready");
      orderToGet = orderToGet.copyWith(status: StatusEnum.READY);
    }
    if (orderToGet.status == StatusEnum.PENDING) {
      print("Mudou pra preparing");
      orderToGet = orderToGet.copyWith(status: StatusEnum.PREPARING);
    }
  }

  @observable
  OrderModel orderToGet = OrderModel(
      status: StatusEnum.PENDING,
      id: "",
      totalPrice: 0,
      userName: "",
      userId: "",
      creationTime: 0,
      products: []);

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
