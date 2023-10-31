import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mobx/mobx.dart';
part 'order_status_controller.g.dart';

class OrderStatusController = _OrderStatusStoreBase with _$OrderStatusStore;

abstract class _OrderStatusStoreBase with Store {
  @observable
  StatusEnum? orderStatus = StatusEnum.READY;
}
