import 'dart:io';

import 'package:dio/dio.dart';

abstract class IHttpRequest {
  Future<Response> get(String url);
  Future<Response> post(String url, {dynamic data});
  Future<Response> put(String url, {dynamic data});
  Future<Response> postPhoto(String url, File photo);
}
