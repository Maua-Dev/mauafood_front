import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

class UserController {
  final GetUser _getUser;

  UserController(this._getUser) {
    loadUser();
  }

  User? user;

  Future<void> loadUser() async {
    final user = await _getUser();
    user.fold((l) => null, (r) => this.user = r);
  }
}
