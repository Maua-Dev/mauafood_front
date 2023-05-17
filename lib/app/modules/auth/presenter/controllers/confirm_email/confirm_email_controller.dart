import 'package:mobx/mobx.dart';

import '../../../domain/usecases/confirm_email.dart';
import '../../ui/states/confirm_email_state.dart';

part 'confirm_email_controller.g.dart';

class ConfirmEmailController = ConfirmEmailControllerBase
    with _$ConfirmEmailController;

abstract class ConfirmEmailControllerBase with Store {
  final ConfirmEmailInterface _confirmEmail;

  ConfirmEmailControllerBase(this._confirmEmail);

  @observable
  ConfirmEmailState state = ConfirmEmailInitialState();

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String code = '';

  @action
  void setCode(String value) => code = value;

  @action
  Future<void> confirmEmail() async {
    state = ConfirmEmailLoadingState();
    var result = await _confirmEmail(email, code);
    state = result.fold((failure) {
      return ConfirmEmailErrorState(error: failure);
    }, (isConfirmed) {
      return const ConfirmEmailSuccessState();
    });
  }
}
