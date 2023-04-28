import '../constants/strings_constants.dart';

class Validator {
  static String? validatorUsername(String? username) {
    if (username?.isEmpty ?? true) {
      return StringConstants.requiredField;
    }
    return null;
  }

  static String? validatorPassword(String? password) {
    if (password?.isEmpty ?? true) {
      return StringConstants.requiredField;
    }

    if(password!.length < 3) {
      return StringConstants.passwordLength;
    }

    return null;
  }

  static String? validatorNameHouse(String? username) {
    if (username?.isEmpty ?? true) {
      return StringConstants.requiredField;
    }
    return null;
  }
}