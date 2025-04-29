part of '../domain_part.dart';

@freezed
abstract class EventModel with _$EventModel {
  const factory EventModel({
    required int id,
    required String name,
    required String date,
    required int coach,
    required String eventStartTime,
    required String eventEndTime,
    required bool isPhotographer,
    required bool isVideographer,
    required List<int?> optionalService,
    required int coachCostume,
    required int client,
  }) = _EventModel;
}
