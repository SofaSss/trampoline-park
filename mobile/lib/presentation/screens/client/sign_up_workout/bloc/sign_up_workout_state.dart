part of '../sign_up_workout_part.dart';

@freezed
abstract class SignUpWorkoutState with _$SignUpWorkoutState {
  const factory SignUpWorkoutState({
    required WorkoutStatus status,
    @Default([ ]) List<WorkoutModel> workoutList,
    @Default(' ') String time,
    @Default(' ') String duration,
    @Default(' ') String freeSpace,
    @Default(' ') String workoutType,
    @Default(' ') String coachPicture,
    @Default(' ') String coachFirstName,
    @Default(' ') String coachLastName,
    @Default(' ') String price,
  }) = _SignUpWorkoutState;
}
