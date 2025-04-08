part of '../../../infrastructure_part.dart';

@freezed
abstract class SpecialtyInfraDto with _$SpecialtyInfraDto {
  const factory SpecialtyInfraDto({required int id, required String name}) =
      _SpecialtyInfraDto;

  factory SpecialtyInfraDto.fromJson(Map<String, Object?> json) =>
      _$SpecialtyInfraDtoFromJson(json);
}
