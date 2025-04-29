part of '../coach_home_part.dart';

@freezed
abstract class CoachHomeEvent with _$CoachHomeEvent {
  const factory CoachHomeEvent.loadData() = _LoadData;
}
