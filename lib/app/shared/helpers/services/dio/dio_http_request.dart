import 'package:dio/dio.dart';

import '../http/http_request_interface.dart';

class DioHttpRequest implements IHttpRequest {
  final Dio _dio;

  DioHttpRequest({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String url, {dynamic data}) async {
    return _dio.post(url, data: data);
  }

  @override
  Future<Response> put(String url, {dynamic data}) async {
    return _dio.put(url, data: data);
  }
}
