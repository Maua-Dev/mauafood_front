import '../models/user_model.dart';

abstract class UserDatasource {
  Future<UserModel> getUser();
  Future<UserModel> createUser();
  Future<UserModel> updateUser(Map data);
}
