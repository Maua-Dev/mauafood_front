import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';

abstract class AuthDatasourceInterface {
  Future<bool> postLoginUser(String email, String password);
  Future<bool> postRegisterUser(UserModel user);
}
