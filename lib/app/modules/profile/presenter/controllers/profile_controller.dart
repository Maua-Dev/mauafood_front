import 'package:mauafood_front/app/modules/user/domain/usecases/update_user.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mobx/mobx.dart';

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

  ProfileControllerBase(this._userController, this._updateUser) {
    photo = _userController.user?.photo ?? profilePictureCoxinha;
    photoIndex = profilePictures.indexOf(photo);
    tempPhotoIndex = photoIndex;
  }

  bool successful = true;

  @observable
  int photoIndex = 0;

  @observable
  int tempPhotoIndex = 0;

  @observable
  String photo = profilePictureCoxinha;

  @action
  Future<void> setPhotoIndex() async {
    successful = true;
    photoIndex = tempPhotoIndex;
    final user =
        _userController.user!.copyWith(photo: profilePictures[photoIndex]);
    final res = await _updateUser(user);
    res.fold(
      (l) => successful = false,
      (r) => successful = true,
    );
    photo = user.photo;
  }

  @action
  void getTempPhotoIndex(int index) {
    tempPhotoIndex = index;
  }

  @computed
  String get name => _userController.user?.name ?? '';
}
