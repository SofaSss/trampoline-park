part of '../coach_profile_part.dart';

@freezed
abstract class CoachProfileState with _$CoachProfileState {
  const factory CoachProfileState({
    required StatusProfile status,
    @Default(' ') String profilePicture,
    @Default(' ') String firstName,
    @Default(' ') String lastName,
    @Default(' ') String quote,
    @Default(' ') String email,
    @Default(' ') String phone,
    @Default(' ') String birthday,
    @Default(' ') String experience,
    @Default([]) List<String> achievements,
    @Default([]) List<String> specialties,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
    @Default({}) Map<String, String> apiErrors,
  }) = _CoachProfileState;
}
