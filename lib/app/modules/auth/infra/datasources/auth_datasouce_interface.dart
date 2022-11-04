import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

abstract class AuthDatasourceInterface {
  Future<CognitoAuthSession> postLoginUser(String email, String password);
  Future<bool> postRegisterUser(UserModel user);
  Future<bool> postEmailConfirmation(String email, String confirmationCode);
}
