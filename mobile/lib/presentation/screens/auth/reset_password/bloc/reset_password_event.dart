part of '../reset_password_part.dart';

@freezed
abstract class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.resetPassword({
    required String uid,
    required String token,
    required String password,
    required String rePassword,
  }) = _ResetPassword;
}
