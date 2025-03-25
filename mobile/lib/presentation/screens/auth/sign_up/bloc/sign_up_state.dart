part of '../sign_up_part.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    required Status status,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
    String? errorMessage,
  }) = _SignUpState;
}
