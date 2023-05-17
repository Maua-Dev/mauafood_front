import 'package:mobx/mobx.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/infra/user_roles_enum.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/get_user_attributes.dart';
import '../../../domain/usecases/login_user.dart';
import '../../ui/states/login_state.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginUserInterface _login;
  final AuthStorageInterface storage;
  final GetUserAttributesInterface _getUserAttributes;
  bool _loggedIn = false;
  UserRolesEnum? _userRole;

  bool get isLoggedIn => _loggedIn;
  UserRolesEnum? get userRole => _userRole;

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

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @action
  String? validatePassword(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(value)) {
      return S.current.passwordInstructionsAlert;
    }
    return null;
  }

  @action
  Future<void> loginWithEmail() async {
    changeState(LoginLoadingState());
    var eitherIsLogged = await _login(email, password);
    var userAttributes = await _getUserAttributes();
    userAttributes.fold((failure) => changeState(LoginErrorState(failure)),
        (attributes) async {
      var role = attributes
          .firstWhere(
              (element) => element.userAttributeKey.toString() == 'custom:role')
          .value;
      _userRole = UserRolesEnumExtension.stringToEnumMap(role);
      await storage.saveRole(role);
    });
    changeState(eitherIsLogged.fold((failure) {
      return LoginErrorState(failure);
    }, (authSession) {
      _loggedIn = true;
      storage.saveAccessToken(authSession.userPoolTokens!.accessToken);
      storage.saveRefreshToken(authSession.userPoolTokens!.refreshToken);
      return LoginSuccessState(
          isLogged: _loggedIn, userRole: userRole ?? UserRolesEnum.user);
    }));
  }
}
