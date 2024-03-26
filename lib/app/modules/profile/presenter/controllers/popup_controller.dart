import 'package:mobx/mobx.dart';

class PopupStore with Store {

  @observable
  bool showPopup = true;

  @action
  void togglePopup(){
    showPopup = !showPopup;
  }
  
}