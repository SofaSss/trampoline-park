part of '../../../../infrastructure_part.dart';

@freezed 
abstract class CreateEventInfraDto with _$CreateEventInfraDto{
  const factory CreateEventInfraDto({
    required String name,
    required String date,
    @JsonKey(name: 'event_start_time') required String eventStartTime,
    @JsonKey(name: 'event_end_time') required String eventEndTime,
    @JsonKey(name: 'is_photographer') required bool isPhotographer,
    @JsonKey(name: 'is_videographer') required bool isVideographer,
    @JsonKey(name: 'optional_service') required List<int?> optionalService,
    @JsonKey(name: 'coach_costume') required int coachCostume,
    @JsonKey(name: 'clients') required int client,
  })=_CreateEventInfraDto;

  factory CreateEventInfraDto.fromJson(Map<String, Object?> json) =>
      _$CreateEventInfraDtoFromJson(json);
}

