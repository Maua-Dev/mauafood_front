import 'package:mobx/mobx.dart';

class PopupStore with Store {

  @observable
  bool showPopup = true;

  @action
  void togglePopup(){
    showPopup = !showPopup;
  }

  @observable
  List<bool> stars = ;

  @action
  void setStars(int index){
    


    for (int i = 0; i <= index; i++){
        print(stars[i]);

      stars[i] = true;
    
    print(stars[i]);
    }  

  }



}
