part of '../sign_up_workout_part.dart';

@freezed
abstract class SignUpWorkoutEvent with _$SignUpWorkoutEvent {
  const factory SignUpWorkoutEvent.loadData({
    int? coachId,
    int? workoutTypeId,
    DateTime? date,
  }) = _LoadData;

  const factory SignUpWorkoutEvent.clientSignUpWorkout({
    required int workoutId,
  }) = _ClientSignUpWorkout;
}
