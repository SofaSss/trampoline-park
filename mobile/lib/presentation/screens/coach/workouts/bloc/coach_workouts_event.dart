part of '../coach_workouts_part.dart';

@freezed
abstract class CoachWorkoutsEvent with _$CoachWorkoutsEvent {
  const factory CoachWorkoutsEvent.loadData({
    required DateTime date,
    int? workoutTypeId,
  }) = _LoadData;
}
