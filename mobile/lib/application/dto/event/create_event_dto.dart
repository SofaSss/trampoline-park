part of '../../application_part.dart';

@freezed
abstract class CreateEventDto with _$CreateEventDto {
  const factory CreateEventDto({
    required String name,
    required DateTime date,
    required DateTime eventStartTime,
    required DateTime eventEndTime,
    required bool isPhotographer,
    required bool isVideographer,
    required List<int?> optionalService,
    required int coachCostume,
    required int client,
  }) = _CreateEventDto;
}
