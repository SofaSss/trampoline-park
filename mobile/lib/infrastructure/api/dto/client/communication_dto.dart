part of '../../../infrastructure_part.dart';
@freezed 
abstract class CommunicationInfraDto with _$CommunicationInfraDto{
  const factory CommunicationInfraDto({
    required int id,
    required String name,
    required String link,
    required String icon, 
  })=_CommunicationInfraDto;

  factory CommunicationInfraDto.fromJson(Map<String, Object?> json) =>
      _$CommunicationInfraDtoFromJson(json);
}