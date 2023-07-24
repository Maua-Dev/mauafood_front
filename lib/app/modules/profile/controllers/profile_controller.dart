import 'package:auth_package/core/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final AuthStore _authStore;

  ProfileControllerBase(this._authStore);

  @computed
  String get name => _authStore.user?.email ?? '';
}
