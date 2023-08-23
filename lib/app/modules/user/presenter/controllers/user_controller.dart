import 'package:auth_package/core/auth_store.dart';
import 'package:mauafood_front/app/modules/user/domain/usecases/check_first_use.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

class UserController {
  final GetUser _getUser;
  final AuthStore _authStore;
  final CheckFirstUse _checkFirstUse;
  UserController(
    this._getUser,
    this._authStore,
    this._checkFirstUse,
  );

  bool get isLogged => _authStore.isLogged;

  User? user;

  Future<void> loadUser() async {
    final user = await _getUser();
    user.fold((l) => null, (r) => this.user = r);
  }

  Future<bool> isFirstUse() async {
    final isFirstUse = await _checkFirstUse();
    return isFirstUse.fold((l) => true, (r) => r);
  }
}
