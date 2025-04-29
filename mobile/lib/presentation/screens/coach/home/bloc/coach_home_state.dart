part of '../coach_home_part.dart';

@freezed
abstract class CoachHomeState with _$CoachHomeState {
  const factory CoachHomeState({
    required Status status,
    @Default(' ') String coachName,
    @Default(' ') String coachProfilePicture,
    @Default(' ') String coachMonthHours,
    @Default(' ') String coachMonthWorkouts,
    @Default(' ') String coachMonthEvents,
    @Default([]) List<ClientModel> coachClients,
    @Default([]) List<WorkoutModel> todayWorkoutsList,
  }) = _CoachHomeState;
}
