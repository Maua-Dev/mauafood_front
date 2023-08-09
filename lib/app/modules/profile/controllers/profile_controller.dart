import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final UserController _userController;

  ProfileControllerBase(this._userController);

  @observable
  int photoIndex = 0;

  @observable
  int tempPhotoIndex = 0;

  @action
  void setPhotoIndex() {
    photoIndex = tempPhotoIndex;
  }

  @action
  void getTempPhotoIndex(int index) {
    tempPhotoIndex = index;
  }

  @computed
  String get name => _userController.user?.name ?? '';
}
