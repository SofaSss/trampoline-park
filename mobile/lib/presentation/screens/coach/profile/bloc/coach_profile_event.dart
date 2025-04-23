part of '../coach_profile_part.dart';

@freezed
abstract class CoachProfileEvent with _$CoachProfileEvent {
  const factory CoachProfileEvent.loadData() = _LoadData;
}