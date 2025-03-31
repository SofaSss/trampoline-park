part of '../../../infrastructure_part.dart';

@freezed
abstract class ActivateInfraDto with _$ActivateInfraDto {
  const factory ActivateInfraDto({required String uid, required String token}) =
      _ActivateInfraDto;

  factory ActivateInfraDto.fromJson(Map<String, Object?> json) =>
      _$ActivateInfraDtoFromJson(json);
}
