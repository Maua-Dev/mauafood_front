import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'popup_controller.g.dart';

class PopupStore = PopupStoreBase with _$PopupStore;

abstract class PopupStoreBase with Store {
  @observable
  bool showPopup = true;
  bool evaluated = true;

  @action
  void togglePopup() {
    showPopup = !showPopup;
  }
  @action
  void openPopUp(){
    showPopup = showPopup;
  }

  @action
  void evaluatedPopUp(){
    evaluated = !evaluated;
  }

 @observable
int grade = 0;

@action
void setStars(int value) {
  grade = value;
  autorun((_) { 
  });


 int getStars(){
  return grade;
 }
}
}