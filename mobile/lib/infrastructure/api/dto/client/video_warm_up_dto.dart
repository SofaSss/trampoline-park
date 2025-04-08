part of '../../../infrastructure_part.dart';

@freezed
abstract class VideoWarmUpInfraDto with _$VideoWarmUpInfraDto {
  const factory VideoWarmUpInfraDto({required int id, required String video}) =
      _VideoWarmUpInfraDto;
  
  factory VideoWarmUpInfraDto.fromJson(Map<String, Object?> json) =>
      _$VideoWarmUpInfraDtoFromJson(json);
}
