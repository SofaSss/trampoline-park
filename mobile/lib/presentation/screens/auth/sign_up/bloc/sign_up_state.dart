part of '../sign_up_part.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    required StatusProfile status,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
    @Default({}) Map<String, dynamic> apiErrors,
  }) = _SignUpState;
}
