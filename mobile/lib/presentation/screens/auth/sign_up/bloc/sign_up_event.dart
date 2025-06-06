part of '../sign_up_part.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signUp({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required DateTime? birth,
    required bool isHealthy,
    required bool isConfirmPDn,
    required bool isPolicy,
  }) = _SignUp;
}
