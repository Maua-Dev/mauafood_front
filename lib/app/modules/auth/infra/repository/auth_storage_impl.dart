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
  Future<void> saveId(String id) async {
    await storage.put('id', id);
  }

  @override
  Future<void> saveFullName(String fullName) async {
    await storage.put('fullName', fullName);
  }

  @override
  Future<String?> getId() async {
    return await storage.get('id') as String?;
  }

  @override
  Future<String?> getFullName() async {
    return await storage.get('fullName') as String?;
  }

  @override
  Future<void> cleanSecureStorage() async {
    await storage.clear();
  }
}
