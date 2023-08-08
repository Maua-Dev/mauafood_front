import 'package:mauafood_front/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final UserController _userController;

  ProfileControllerBase(this._userController);

  @computed
  String get name => _userController.user?.name ?? '';
}
