part of '../coach_profile_part.dart';

@freezed
abstract class CoachProfileEvent with _$CoachProfileEvent {
  const factory CoachProfileEvent.loadData() = _LoadData;
  const factory CoachProfileEvent.updateCoachData({
    File? profilePicture,
    String? phone,
    String? quote,
    int? experience,
    List<int>? achievementList,
    List<int>? specialtyList,
  }) = _UpdateCoachData;
  const factory CoachProfileEvent.getCoachAchievementList() =
      _GetCoachAchievementList;
  const factory CoachProfileEvent.getCoachSpecialtyList() =
      _GetCoachSpecialtyList;
  const factory CoachProfileEvent.createCoachAchievement({
    required String name,
  }) = _CreateCoachAchievement;
  const factory CoachProfileEvent.createCoachSpecialty({required String name}) =
      _CreateCoachSpecialty;

  const factory CoachProfileEvent.signOut() = _SignOut;

  const factory CoachProfileEvent.setPassword({
    required String oldPassword,
    required String newPassword,
    required String reNewPassword,
  }) = _SetPassword;
}
