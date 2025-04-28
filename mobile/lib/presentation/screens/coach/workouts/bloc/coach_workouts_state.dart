part of '../coach_workouts_part.dart';

@freezed
abstract class CoachWorkoutsState with _$CoachWorkoutsState {
  const factory CoachWorkoutsState({
    required WorkoutStatus status,
    @Default([]) List<WorkoutModel> workoutList,
  }) = _CoachWorkoutsState;
}
