part of '../sign_in_part.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    required SignInStatus status,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
    @Default({})  Map<String, dynamic> apiErrors,
  }) = _SignInState;
}
