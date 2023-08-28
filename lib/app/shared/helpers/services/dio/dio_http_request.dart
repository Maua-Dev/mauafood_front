import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../http/http_request_interface.dart';
import 'package:image/image.dart' as img;

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
    img.Image image = img.decodeImage(Uint8List.fromList(photo))!;
    Uint8List jpegData = Uint8List.fromList(img.encodeJpg(image));
    return _dio.put(url, data: photo);
  }
}
