import 'package:mauafood_front/app/modules/user/domain/usecases/update_user.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/helpers/services/s3/assets_s3.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final UserController _userController;

  final UpdatePhoto _updateUser;

  final profilePictures = [
    profilePictureCoxinha,
    profilePictureSoda,
    profilePicturePotato,
    profilePictureHamburguer,
  ];

  ProfileControllerBase(this._userController, this._updateUser);

  @observable
  int photoIndex = 0;

  @observable
  int tempPhotoIndex = 0;

  @observable
  String photo = profilePictureCoxinha;

  @action
  Future setPhotoIndex() async {
    photoIndex = tempPhotoIndex;
    final user =
        _userController.user!.copyWith(photo: profilePictures[photoIndex]);
    final res = await _updateUser(user);
    res.fold((l) => print("DEU RUIM"), (r) => print("funcionou"));
    photo = user.photo;
  }

  @action
  void getTempPhotoIndex(int index) {
    tempPhotoIndex = index;
  }

  @computed
  String get name => _userController.user?.name ?? '';
}
