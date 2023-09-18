import 'package:dio/dio.dart';
import 'package:mauafood_front/app/modules/user/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/user/infra/datasources/user_datasource.dart';
import 'package:mauafood_front/app/modules/user/infra/models/user_model.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

import '../../../shared/helpers/services/http/http_request_interface.dart';

class UserDatasourceImpl implements UserDatasource {
  final IHttpRequest _client;

  UserDatasourceImpl(this._client);
  @override
  Future<UserModel> createUser() async {
    final res = await _client.post('/create-user');
    if (res.statusCode == 201) {
      return UserModel.fromJson(res.data['user']);
    } else {
      throw Failure(message: 'Error to create user');
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final res = await _client.get('/get-user');
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data['user']);
      } else {
        throw Failure(message: 'Error to get user');
      }
    } on DioError catch (e) {
      e.response?.statusCode == 404
          ? throw UserNotFound(message: 'User Not Found')
          : throw Failure(message: 'Error to get user');
    }
  }

  @override
  Future<UserModel> updateUser(Map data) async {
    try {
      final res = await _client.post('/update-user', data: data);
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data['user']);
      } else {
        throw Failure(message: 'Error to get user');
      }
    } on DioError catch (_) {
      throw Failure(message: 'Error to update user');
    }
  }
}
