import 'package:mobx/mobx.dart';

import '../../../domain/infra/auth_storage_interface.dart';
import '../../../domain/usecases/logout_user_usecase.dart';
import '../../states/logout_state.dart';

part 'logout_controller.g.dart';

class LogoutController = LogoutControllerBase with _$LogoutController;

abstract class LogoutControllerBase with Store {
  final AuthStorageInterface storage;
  final ILogoutUserUsecase _logout;

  LogoutControllerBase(this._logout, this.storage);

  @observable
  LogoutState state = LogoutInitialState();

  @action
  void changeState(LogoutState value) => state = value;

  @action
  Future<void> logoutUser() async {
    changeState(LogoutLoadingState());
    var result = await _logout();
    changeState(result.fold((failure) {
      return LogoutErrorState(failure);
    }, (isLogged) {
      return const LogoutSuccessState();
    }));
    if (state is LogoutSuccessState) {
      await storage.cleanSecureStorage();
    }
  }
}
