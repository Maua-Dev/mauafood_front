import 'package:dio/dio.dart';
import '../../domain/storage/auth_storage_interface.dart';
import '../enums/token_enum.dart';
import 'http_request_interface.dart';

class HttpService {
  final IAuthStorage storage;
  final IHttpRequest httpRequest;

  HttpService({
    required this.storage,
    required this.httpRequest,
  });

  Future<Response> get(String url, dynamic data,
      {TokenEnum tokenType = TokenEnum.NOTOKEN}) async {
    return await _handleRequest(() => httpRequest.get(url), tokenType);
  }

  Future<Response> post(String url, dynamic data,
      {TokenEnum tokenType = TokenEnum.NOTOKEN}) async {
    return await _handleRequest(() => httpRequest.post(url, data), tokenType);
  }

  Future<Response> put(String url, dynamic data,
      {TokenEnum tokenType = TokenEnum.NOTOKEN}) async {
    return await _handleRequest(() => httpRequest.put(url, data), tokenType);
  }

  Future<Response> _handleRequest(
      Future<Response> Function() request, TokenEnum tokenType) async {
    try {
      await _setToken(tokenType);
      return await request();
    } on DioError catch (e) {
      return _handleError(e, request, tokenType);
    }
  }

  Future<void> _refreshTokens() async {
    // lógica para dar refresh em todos os tokens do storage
    await storage.saveRefreshToken('validToken');
    await storage.saveAccessToken('validToken');
    await storage.saveIdToken('validToken');
    return Future.value();
  }

  Future<void> _setToken(TokenEnum tokenType) async {
    var token = '';
    switch (tokenType) {
      case TokenEnum.ACCESSTOKEN:
        token = await storage.getAccessToken();
        break;
      case TokenEnum.IDTOKEN:
        token = await storage.getIdToken();
        break;
      case TokenEnum.REFRESHTOKEN:
        token = await storage.getRefreshToken();
        break;
      case TokenEnum.NOTOKEN:
        break;
    }
    httpRequest.setAuthorizationToken(token);
  }

  Future<Response> _handleError(DioError e, Future<Response> Function() request,
      TokenEnum tokenType) async {
    if (e.response == null || e.response!.statusCode == 401) {
      httpRequest.clearAuthorizationToken();
      await _refreshTokens();
      await _setToken(tokenType);
      return await request();
    }
    return Future.value(e.response);
  }
}
