import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/forgot_password.dart';
import '../../states/forgot_password_state.dart';

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

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @action
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\."
        r"[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(value)) {
      return S.current.invalidEmailAlert;
    }
    return null;
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
