import 'package:mobx/mobx.dart';
import '../../../../../shared/utils/validation_utils.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/get_user_attributes.dart';
import '../../../domain/usecases/login_user.dart';
import '../../states/login_state.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginUserInterface _login;
  final AuthStorageInterface storage;
  final GetUserAttributesInterface _getUserAttributes;

  LoginControllerBase(this._login, this.storage, this._getUserAttributes);

  @observable
  LoginState state = LoginInitialState();

  @action
  void changeState(LoginState value) => state = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @action
  String? validateEmail(String? value) {
    return ValidationUtils.validateEmail(value);
  }

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @action
  String? validatePassword(String? value) {
    return ValidationUtils.validatePassword(value);
  }

  @action
  Future<void> loginWithEmail() async {
    changeState(LoginLoadingState());
    var loginResult = await _login(email, password);
    var userAttributes = await _getUserAttributes();
    userAttributes.fold((failure) => changeState(LoginErrorState(failure)),
        (attributes) async {
      var role = attributes
          .firstWhere(
              (element) => element.userAttributeKey.toString() == 'custom:role')
          .value;
      await storage.saveRole(role);
    });
    loginResult.fold((failure) {
      return changeState(LoginErrorState(failure));
    }, (authSession) async {
      return changeState(LoginSuccessState(authSession: authSession));
    });
    if (state is LoginSuccessState) {
      var successState = state as LoginSuccessState;
      await storage.saveAccessToken(
          successState.authSession.userPoolTokens!.accessToken);
      await storage.saveRefreshToken(
          successState.authSession.userPoolTokens!.refreshToken);
      await storage
          .saveIdToken(successState.authSession.userPoolTokens!.idToken);
    }
  }
}
