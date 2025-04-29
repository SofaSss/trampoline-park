part of '../../../../infrastructure_part.dart';

@freezed 
abstract class EventInfraDto with _$EventInfraDto{
  const factory EventInfraDto({
    required int id,
    required String name,
    required String date,
    required int coach,
    @JsonKey(name: 'event_start_time') required String eventStartTime,
    @JsonKey(name: 'event_end_time') required String eventEndTime,
    @JsonKey(name: 'is_photographer') required bool isPhotographer,
    @JsonKey(name: 'is_videographer') required bool isVideographer,
    @JsonKey(name: 'optional_service') required List<int?> optionalService,
    @JsonKey(name: 'coach_costume') required int coachCostume,
    @JsonKey(name: 'clients') required int client,
  })=_EventInfraDto;

  factory EventInfraDto.fromJson(Map<String, Object?> json) =>
      _$EventInfraDtoFromJson(json);
}