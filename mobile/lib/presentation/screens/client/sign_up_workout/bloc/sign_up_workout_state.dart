part of '../sign_up_workout_part.dart';

@freezed
abstract class SignUpWorkoutState with _$SignUpWorkoutState {
  const factory SignUpWorkoutState({
    required WorkoutStatus status,
    @Default([]) List<WorkoutModel> workoutList,
    @Default([]) List<CoachModel> coachList,
    @Default([]) List<WorkoutTypeModel> workoutTypeList,
    @Default(0) int clientId,
    @Default(false) bool hasReachedEnd,
  }) = _SignUpWorkoutState;
}
