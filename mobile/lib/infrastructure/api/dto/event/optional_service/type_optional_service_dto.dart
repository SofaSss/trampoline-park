part of '../../../../infrastructure_part.dart';

@freezed
abstract class TypeOptionalServiceInfraDto with _$TypeOptionalServiceInfraDto {
  const factory TypeOptionalServiceInfraDto({
    required int id,
    required String name,
  }) = _TypeOptionalServiceInfraDto;

  factory TypeOptionalServiceInfraDto.fromJson(Map<String, Object?> json) =>
      _$TypeOptionalServiceInfraDtoFromJson(json);
}
