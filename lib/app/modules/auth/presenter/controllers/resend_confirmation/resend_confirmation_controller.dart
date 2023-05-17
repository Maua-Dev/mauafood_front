import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../domain/usecases/resend_confirmation_code.dart';
import '../../states/resend_confirmation_state.dart';

part 'resend_confirmation_controller.g.dart';

class ResendConfirmationController = ResendConfirmationControllerBase
    with _$ResendConfirmationController;

abstract class ResendConfirmationControllerBase with Store {
  final ResendConfirmationCodeInterface _resendConfirmationCode;

  ResendConfirmationControllerBase(this._resendConfirmationCode);

  @observable
  ResendConfirmationState state = ResendConfirmationInitialState();

  @action
  void changeState(ResendConfirmationState value) => state = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @action
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(value)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  @action
  Future<void> resendConfirmationCode() async {
    changeState(ResendConfirmationLoadingState());
    var result = await _resendConfirmationCode(email);
    changeState(result.fold((failure) {
      return ResendConfirmationErrorState(error: failure);
    }, (isConfirmed) {
      return const ResendConfirmationSuccessState();
    }));
  }
}
