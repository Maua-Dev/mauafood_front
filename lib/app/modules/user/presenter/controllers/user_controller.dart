import 'package:auth_package/core/auth_store.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

class UserController {
  final GetUser _getUser;
  final AuthStore _authStore;
  UserController(
    this._getUser,
    this._authStore,
  );

  bool get isLogged => _authStore.isLogged;

  User? user;

  Future<void> loadUser() async {
    final user = await _getUser();
    user.fold((l) => null, (r) => this.user = r);
  }
}
