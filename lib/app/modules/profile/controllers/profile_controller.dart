import 'package:auth_package/core/auth_store.dart';
import 'package:mauafood_front/app/modules/profile/domain/usecases/get_favorites_usecase.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final AuthStore _authStore;
  late GetFavoritesUsecaseImpl _getFavorites;

  var favoritesList = [];

  ProfileControllerBase(this._authStore);

  @computed
  String get name => _authStore.user?.email ?? '';

  Future<void> getFavorites() async {
    var result = await _getFavorites();

    result.fold((failure) => null, (successList) async {
      favoritesList = successList;
    });
  }
}
