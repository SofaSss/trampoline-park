part of '../../../../infrastructure_part.dart';

@freezed
abstract class CoachCostumeInfraDto with _$CoachCostumeInfraDto {
  const factory CoachCostumeInfraDto({
    required int id,
    required String name,
    @JsonKey(name: 'coach_costume_picture') required String picture,
    required int price,
  }) = _CoachCostumeInfraDto;

  factory CoachCostumeInfraDto.fromJson(Map<String, Object?> json) =>
      _$CoachCostumeInfraDtoFromJson(json);
}
