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

  @action
  void togglePopup() {
    showPopup = !showPopup;
  }

  @action
  void openPopUp() {
    showPopup = showPopup;
  }

  Future<void> sendFeedback() async {
    FeedbackModel feedback = FeedbackModel.newInstance();

    feedback = feedback.copyWith(value: grade);

    var result = await _sendFeedback(feedback);
    result.fold((l) => print("NÂO FUNCIONOU"), (r) => print(r));
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
