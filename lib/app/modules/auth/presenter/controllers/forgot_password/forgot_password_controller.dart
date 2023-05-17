import 'package:mobx/mobx.dart';

import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/forgot_password.dart';
import '../../ui/states/forgot_password_state.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  final AuthStorageInterface storage;
  final ForgotPasswordInterface _forgotPassword;

  ForgotPasswordControllerBase(this.storage, this._forgotPassword);

  @observable
  ForgotPasswordState state = ForgotPasswordInitialState();

  @action
  void changeState(ForgotPasswordState value) => state = value;

  @action
  Future<void> forgotPasswordUser(String email) async {
    changeState(ForgotPasswordLoadingState());
    var result = await _forgotPassword(email);
    changeState(result.fold((failure) {
      return ForgotPasswordErrorState(failure);
    }, (isLogged) {
      return const ForgotPasswordSuccessState();
    }));
  }
}
