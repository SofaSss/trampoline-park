part of '../sign_in_part.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    required Status status,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
  }) = _SignInState;
}
