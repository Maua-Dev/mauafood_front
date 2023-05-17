import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/infra/auth_storage_interface.dart';

class AuthStorageImpl implements AuthStorageInterface {
  final Box storage;

  AuthStorageImpl._(this.storage);

  static Future<AuthStorageImpl> instance() async {
    await Hive.initFlutter();
    return AuthStorageImpl._(await Hive.openBox('box'));
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await storage.put('refreshToken', refreshToken);
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await storage.put('accessToken', accessToken);
  }

  @override
  Future<String> getRefreshToken() async {
    return await storage.get('refreshToken');
  }

  @override
  Future<String> getAccessToken() async {
    return await storage.get('accessToken');
  }

  @override
  Future<void> cleanSecureStorage() async {
    await storage.clear();
  }

  @override
  Future<String> getRole() async {
    return await storage.get('role');
  }

  @override
  Future<void> saveRole(String role) async {
    await storage.put('role', role);
  }

  @override
  Future<String> getIdToken() async {
    return await storage.get('idToken');
  }

  @override
  Future<void> saveIdToken(String idToken) async {
    await storage.put('idToken', idToken);
  }
}
