import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:mobx/mobx.dart';
import '../../../domain/usecases/register_user.dart';
import '../../ui/states/register_state.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final RegisterUserInterface _register;

  RegisterControllerBase(this._register);

  @observable
  RegisterState state = RegisterInitialState();

  @action
  void changeState(RegisterState value) => state = value;

  @action
  Future<void> registerUser() async {
    changeState(RegisterLoadingState());
    var result = await _register(fullName, cpf, isStudent, email, password,
        emailNotification, appNotification, acceptTerms);
    changeState(result.fold((failure) {
      return RegisterErrorState(error: failure);
    }, (user) {
      return const RegisterSuccessState();
    }));
  }

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @observable
  String fullName = '';

  @action
  void setFullName(String value) => fullName = value;

  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  @observable
  bool isStudent = false;

  @action
  void setIsStudent(bool value) => isStudent = value;

  @observable
  bool emailNotification = false;

  @action
  void setEmailNotification(bool value) => emailNotification = value;

  @observable
  bool appNotification = false;

  @action
  void setAppNotification(bool value) => appNotification = value;

  @observable
  bool acceptTerms = false;

  @action
  void setAcceptTerms(bool value) => acceptTerms = value;

  @action
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (value.length < 3 || !value.contains(' ')) {
      return S.current.invalidFullNameAlert;
    }
    return null;
  }

  @action
  String? validateCpf(String? value) {
    value = value!.replaceAll('.', '');
    value = value.replaceAll('-', '');
    if (value.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!CPFValidator.isValid(value)) {
      return S.current.invalidCpfAlert;
    }
    return null;
  }

  @action
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\."
        r"[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(value)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  @action
  String? validatePassword(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(value)) {
      return S.current.passwordInstructionsAlert;
    }
    return null;
  }

  @action
  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (value != password) {
      return S.current.equalPasswordAlert;
    }
    return null;
  }
}
