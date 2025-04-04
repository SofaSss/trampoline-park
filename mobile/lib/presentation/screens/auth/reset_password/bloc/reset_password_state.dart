part of '../reset_password_part.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required Status status,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
  }) = _ResetPasswordState;
}
