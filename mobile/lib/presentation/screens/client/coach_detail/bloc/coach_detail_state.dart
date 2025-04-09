part of '../coach_detail_part.dart';

@freezed
abstract class CoachDetailState with _$CoachDetailState {
  const factory CoachDetailState({
    required Status status,
    @Default(' ') String coachPicture,
    @Default(' ') String experience,
    @Default(' ') String firstName,
    @Default(' ') String lastName,
    @Default(' ') String quote,
    @Default([]) List<String> specialties,
    @Default([]) List<String> achievements,
  }) = _CoachDetailState;
}
