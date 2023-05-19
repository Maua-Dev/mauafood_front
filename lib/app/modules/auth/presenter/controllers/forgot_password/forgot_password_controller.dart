import 'package:mobx/mobx.dart';
import '../../../../../shared/helpers/utils/validation_utils.dart';
import '../../../../../shared/domain/storage/auth_storage_interface.dart';
import '../../../../../shared/domain/usecases/forgot_password_usecase.dart';
import '../../states/forgot_password_state.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  final IAuthStorage storage;
  final IForgotPasswordUsecase _forgotPassword;

  ForgotPasswordControllerBase(this.storage, this._forgotPassword);

  @observable
  ForgotPasswordState state = ForgotPasswordInitialState();

  @action
  void changeState(ForgotPasswordState value) => state = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @action
  String? validateEmail(String? value) {
    return ValidationHelper.validateEmail(value);
  }

  @action
  Future<void> forgotPasswordUser() async {
    changeState(ForgotPasswordLoadingState());
    var result = await _forgotPassword(email);
    changeState(result.fold((failure) {
      return ForgotPasswordErrorState(failure);
    }, (isLogged) {
      return const ForgotPasswordSuccessState();
    }));
  }
}
