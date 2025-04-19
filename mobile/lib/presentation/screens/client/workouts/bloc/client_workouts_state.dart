part of '../client_workouts_part.dart';

@freezed
abstract class ClientWorkoutsState with _$ClientWorkoutsState {
  const factory ClientWorkoutsState({
    required WorkoutStatus status,
    @Default([]) List<WorkoutModel> workoutList,
    @Default(false) bool isFirstRating,
    @Default(false) bool isSecondRating,
    @Default(false) bool isThirdRating,
    @Default(0) int stayedWorkout
  }) = _ClientWorkoutsState;
}
