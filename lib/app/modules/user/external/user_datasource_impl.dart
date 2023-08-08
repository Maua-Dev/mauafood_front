import 'package:dio/dio.dart';
import 'package:mauafood_front/app/modules/user/domain/errors/errors.dart';
import 'package:mauafood_front/app/modules/user/infra/datasources/user_datasource.dart';
import 'package:mauafood_front/app/modules/user/infra/models/user_model.dart';

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
      throw Exception();
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final res = await _client.get('/get-user');
      if (res.statusCode == 200) {
        return UserModel.fromJson(res.data['user']);
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      e.response?.statusCode == 404
          ? throw UserNotFound(message: 'User Not Found')
          : throw Exception();
    }
  }
}
