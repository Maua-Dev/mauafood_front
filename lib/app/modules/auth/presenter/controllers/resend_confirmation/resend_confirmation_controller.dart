import 'package:mobx/mobx.dart';
import '../../../../../shared/utils/validation_utils.dart';
import '../../../domain/usecases/resend_confirmation_code_usecase.dart';
import '../../states/resend_confirmation_state.dart';

part 'resend_confirmation_controller.g.dart';

class ResendConfirmationController = ResendConfirmationControllerBase
    with _$ResendConfirmationController;

abstract class ResendConfirmationControllerBase with Store {
  final IResendConfirmationCodeUsecase _resendConfirmationCode;

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
    return ValidationUtils.validateEmail(value);
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
