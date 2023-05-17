import 'package:mobx/mobx.dart';
import '../../../../../shared/infra/user_roles_enum.dart';
import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/get_user_attributes.dart';
import '../../../domain/usecases/login_user.dart';
import '../../ui/states/login_state.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginUserInterface login;
  final AuthStorageInterface storage;
  final GetUserAttributesInterface getUserAttributes;
  bool _loggedIn = false;
  UserRolesEnum? _userRole;

  bool get isLoggedIn => _loggedIn;
  UserRolesEnum? get userRole => _userRole;

  LoginControllerBase(this.login, this.storage, this.getUserAttributes);

  @observable
  LoginState state = LoginInitialState();

  @action
  void changeState(LoginState value) => state = value;

  @action
  Future<void> loginWithEmail(String email, String password) async {
    changeState(LoginLoadingState());
    var eitherIsLogged = await login(email, password);
    var userAttributes = await getUserAttributes();
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
