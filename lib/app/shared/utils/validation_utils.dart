import '../../../../../../generated/l10n.dart';

class ValidationUtils {
  static String? validateCode(String? code) {
    if (code!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (code.length < 6) {
      return S.current.codeErrorAlert;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\."
        r"[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (email!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(email)) {
      return S.current.invalidEmailAlert;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (!regExp.hasMatch(password)) {
      return S.current.passwordInstructionsAlert;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return S.current.requiredFieldAlert;
    } else if (confirmPassword != password) {
      return S.current.equalPasswordAlert;
    }
    return null;
  }
}
