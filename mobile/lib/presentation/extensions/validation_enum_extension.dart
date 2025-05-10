part of 'extensions_part.dart';

extension InputFieldErrorX on InputFieldError {
  String localize(S locale) {
    return switch (this) {
      InputFieldError.wrongPhoneNumber => locale.wrongPhoneNumber,
      InputFieldError.incorrectMail => locale.incorrectMail,
      InputFieldError.incorrectPassword => locale.incorrectPassword,
      InputFieldError.passwordNotMatch => locale.passwordNotMatch,
      InputFieldError.emptyField => locale.emptyField,
      InputFieldError.isConfirmPDn => locale.isConfirmPDn,
      InputFieldError.isPolicy => locale.isPolicy,
    };
  }
}
