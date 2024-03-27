import 'package:mobx/mobx.dart';

part 'popup_controller.g.dart';

class PopupStore = PopupStoreBase with _$PopupStore;

abstract class PopupStoreBase with Store {
  @observable
  bool showPopup = true;

  @action
  void togglePopup() {
    showPopup = !showPopup;
  }

  @observable
  int grade = 0;

  @action
  void setStars(int value) {
    grade = value;
  }
}
