part of '../coach_profile_part.dart';

@freezed
abstract class CoachProfileEvent with _$CoachProfileEvent {
  const factory CoachProfileEvent.loadData() = _LoadData;
  const factory CoachProfileEvent.updateCoachData({
    File? profilePicture,
    String? phone,
    String? quote,
    int? experience,
  }) = _UpdateCoachData;

  const factory CoachProfileEvent.signOut() = _SignOut;

  const factory CoachProfileEvent.setPassword({
    required String oldPassword,
    required String newPassword,
    required String reNewPassword,
  }) = _SetPassword;
}
