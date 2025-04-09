part of '../coach_detail_part.dart';

@freezed
abstract class CoachDetailEvent with _$CoachDetailEvent {
  const factory CoachDetailEvent.loadData({required int id}) = _LoadData;
}
