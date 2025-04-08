part of '../client_home_part.dart';

@freezed
abstract class ClientHomeState with _$ClientHomeState {
  const factory ClientHomeState({
    required Status status,
    String? profilePicture,
    @Default([]) List<WorkoutTypeModel> workouts,
    @Default([]) List<CoachModel> coaches,
    @Default([]) List<CommunicationModel> communications,
    @Default("") String videoUrl,
    @Default("") String videoExcursionUrl,
  }) = _ClientHomeState;
}
