import 'package:mauafood_front/app/shared/domain/usecases/send_feedback_usecase.dart';
import 'package:mauafood_front/app/shared/infra/models/feedback_model.dart';
import 'package:mobx/mobx.dart';

part 'popup_controller.g.dart';

class PopupStore = PopupStoreBase with _$PopupStore;

abstract class PopupStoreBase with Store {
  final SendFeedbackUsecase _sendFeedback;

  PopupStoreBase(this._sendFeedback);
  @observable
  bool showPopup = true;
  bool evaluated = true;

  @action
  void togglePopup() {
    showPopup = !showPopup;
  }

  @action
  void openPopUp() {
    showPopup = showPopup;
  }

<<<<<<< HEAD
  @action
  void evaluatedPopUp(){
    evaluated = !evaluated;
  }

 @observable
int grade = 0;
=======
  Future<void> sendFeedback() async {
    FeedbackModel feedback = FeedbackModel.newInstance();
>>>>>>> f92fd381683f4cd70178d65042dda4447f1f7467

    feedback = feedback.copyWith(
        value: grade, orderId: "4b685f9a-5262-49aa-a7a7-ad7ddffc51b9");

    var result = await _sendFeedback(feedback);
    result.fold((l) => print(l), (r) => togglePopup());
  }

  @observable
  int grade = 0;

  @action
  void setStars(int value) {
    grade = value;
    autorun((_) {});

    // ignore: unused_element
    int getStars() {
      return grade;
    }
  }
}
