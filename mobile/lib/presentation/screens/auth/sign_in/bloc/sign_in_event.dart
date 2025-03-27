part of '../sign_in_part.dart';

@freezed
abstract class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signIn({
    required String email,
    required String password,
  }) = _SignInEvent;
}
