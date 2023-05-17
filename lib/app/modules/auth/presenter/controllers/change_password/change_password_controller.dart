import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/utils/validation_utils.dart';
import '../../../domain/usecases/confirm_reset_password.dart';
import '../../states/change_password_state.dart';

part 'change_password_controller.g.dart';

class ChangePasswordController = ChangePasswordControllerBase
    with _$ChangePasswordController;

abstract class ChangePasswordControllerBase with Store {
  final ConfirmResetPasswordInterface _confirmResetPassword;

  ChangePasswordControllerBase(this._confirmResetPassword);

  @observable
  ChangePasswordState state = ChangePasswordInitialState();

  @action
  void changeState(ChangePasswordState value) => state = value;

  @observable
  String code = '';

  @action
  void setCode(String value) => code = value;

  @observable
  String newPassword = '';

  @action
  void setNewPassword(String value) => newPassword = value;

  @observable
  String confirmNewPassword = '';

  @action
  void setConfirmNewPassword(String value) => confirmNewPassword = value;

  @action
  String? validatePassword(String? password) {
    return ValidationUtils.validatePassword(password);
  }

  @action
  String? validateConfirmPassword(String? confirmPassword) {
    return ValidationUtils.validateConfirmPassword(
        newPassword, confirmPassword);
  }

  @action
  Future<void> changePassword() async {
    state = ChangePasswordLoadingState();
    var result = await _confirmResetPassword('', code, newPassword);
    state = result.fold((failure) {
      return ChangePasswordErrorState(error: failure);
    }, (isConfirmed) {
      return const ChangePasswordSuccessState();
    });
  }

  @action
  String? validateCode(String? code) {
    return ValidationUtils.validateCode(code);
  }
}
