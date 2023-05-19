import 'package:mauafood_front/app/modules/menu/presenter/states/contact/contact_state.dart';
import 'package:mauafood_front/app/shared/domain/usecases/contact_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/utils/validation_helper.dart';

part 'contact_controller.g.dart';

class ContactController = ContactControllerBase with _$ContactController;

abstract class ContactControllerBase with Store {
  final IContactUsecase _contactUsecase;

  ContactControllerBase(this._contactUsecase);

  @observable
  ContactState state = ContactInitialState();

  @action
  void changeState(ContactState value) => state = value;

  @observable
  String message = '';

  @observable
  String email = '';

  @observable
  String name = '';

  @action
  void setMessage(String value) => message = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setName(String value) => name = value;

  @action
  String? validateName(String? value) {
    return ValidationHelper.validateName(value);
  }

  @action
  String? validateEmail(String? value) {
    return ValidationHelper.validateEmail(value);
  }

  @action
  String? validateMessage(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    }
    return null;
  }

  @action
  Future<void> sendEmail() async {
    changeState(ContactLoadingState());
    var result = await _contactUsecase(name, email, message);
    changeState(result.fold((l) => ContactErrorState(failure: l), (list) {
      return ContactLoadedSuccessState();
    }));
  }
}
