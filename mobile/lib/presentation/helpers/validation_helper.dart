part of 'helpers_part.dart';

class ValidationHelper {
  static Map<InputErrorTypeEnum, InputFieldError> validateText({
    required String text,
  }) {
    if (text.isEmpty) {
      return {InputErrorTypeEnum.textField: InputFieldError.emptyField};
    }
    return {};
  }

  static Map<InputErrorTypeEnum, InputFieldError> validatePhone({
    required String phone,
  }) {
    bool isPhoneValid = RegExpConstants.phoneRegExp.hasMatch(phone);
    if (!isPhoneValid && phone.isNotEmpty) {
      return {InputErrorTypeEnum.phone: InputFieldError.wrongPhoneNumber};
    } else if (phone.isEmpty) {
      return {InputErrorTypeEnum.phone: InputFieldError.emptyField};
    }
    return {};
  }

  static Map<InputErrorTypeEnum, InputFieldError> validateEmail({
    required String email,
  }) {
    bool isEmailValid = RegExpConstants.emailRegExp.hasMatch(email);
    if (!isEmailValid && email.isNotEmpty) {
      return {InputErrorTypeEnum.email: InputFieldError.incorrectMail};
    } else if (email.isEmpty) {
      return {InputErrorTypeEnum.email: InputFieldError.emptyField};
    }
    return {};
  }

  static Map<InputErrorTypeEnum, InputFieldError> validatePassword({
    required String password,
    required String confirmPassword,
  }) {
    bool isPasswordValid = RegExpConstants.passwordRegExp.hasMatch(password);
    if (password.isEmpty) {
      return {InputErrorTypeEnum.password: InputFieldError.emptyField};
    } else if (!isPasswordValid && password.isNotEmpty) {
      return {InputErrorTypeEnum.password: InputFieldError.incorrectPassword};
    } else if (password != confirmPassword) {
      return {InputErrorTypeEnum.password: InputFieldError.passwordNotMatch};
    }
    return {};
  }

  static Map<InputErrorTypeEnum, InputFieldError> validateDate({
    required DateTime? date,
  }) {
    if (date == null) {
      return {InputErrorTypeEnum.birth: InputFieldError.emptyField};
    }
    return {};
  }

  static Map<InputErrorTypeEnum, InputFieldError> isConfirmPDn({
    required bool isConfirmPDn
  }) {
    if (isConfirmPDn == false) {
      return {InputErrorTypeEnum.isConfirmPDn: InputFieldError.isConfirmPDn};
    }
    return {};
  }
}
