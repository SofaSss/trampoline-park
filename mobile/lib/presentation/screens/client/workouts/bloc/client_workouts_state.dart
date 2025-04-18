part of '../client_workouts_part.dart';

@freezed
abstract class ClientWorkoutsState with _$ClientWorkoutsState {
  const factory ClientWorkoutsState({
    required WorkoutStatus status,
    @Default([]) List<WorkoutModel> workoutList,
  }) = _ClientWorkoutsState;
}
