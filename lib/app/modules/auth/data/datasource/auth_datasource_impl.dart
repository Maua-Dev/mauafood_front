import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:mauafood_front/app/modules/auth/infra/datasources/auth_datasouce_interface.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

class AuttDatasourceImpl extends AuthDatasourceInterface {
  @override
  Future<bool> postLoginUser(String email, String password) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      return res.isSignedIn;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> postRegisterUser(UserModel user) async {
    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: user.email,
      const CognitoUserAttributeKey.custom('id'): user.id.toString(),
      CognitoUserAttributeKey.name: user.fullName,
      CognitoUserAttributeKey.identities: user.cpf,
      const CognitoUserAttributeKey.custom('isStudent'):
          user.isStudent.toString(),
      const CognitoUserAttributeKey.custom('notifications'):
          user.notifications.toString(),
    };
    try {
      SignUpResult res = await Amplify.Auth.signUp(
          username: user.email,
          password: user.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      return res.isSignUpComplete;
    } catch (e) {
      throw Exception();
    }
  }
}
