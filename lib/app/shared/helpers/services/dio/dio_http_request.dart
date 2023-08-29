import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../http/http_request_interface.dart';
import 'package:image/image.dart';
import 'dart:typed_data';

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

  @override
  Future<Response> uploadPhotoToS3(String url, Uint8List photo) async {
    Image image = decodeImage(Uint8List.fromList(photo))!;
    Uint8List jpgData = Uint8List.fromList(encodeJpg(image));
    return _dio.put(url, data: jpgData);
  }
}
