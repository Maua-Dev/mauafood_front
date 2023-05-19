import 'package:dio/dio.dart';

import 'http_request_interface.dart';

class DioHttpRequest implements IHttpRequest {
  final Dio _dio;

  DioHttpRequest({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Response> get(String url) async {
    return _dio.get(url);
  }

  @override
  Future<Response> post(String url, dynamic data) async {
    return _dio.post(url, data: data);
  }

  @override
  Future<Response> put(String url, dynamic data) async {
    return _dio.put(url, data: data);
  }

  @override
  void setAuthorizationToken(String authorizationToken) {
    if (authorizationToken.isNotEmpty) {
      _dio.options.headers["authorization"] = authorizationToken;
    }
  }

  @override
  void clearAuthorizationToken() {
    _dio.options.headers.remove("authorization");
  }
}
