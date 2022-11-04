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
  Future<String?> getRefreshToken() async {
    return await storage.get('refreshToken') as String?;
  }

  @override
  Future<String?> getAccessToken() async {
    return await storage.get('accessToken') as String?;
  }

  @override
  Future<void> cleanSecureStorage() async {
    await storage.clear();
  }
}
