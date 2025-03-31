part of '../../../infrastructure_part.dart';

@freezed
abstract class AccessTokenInfraDto with _$AccessTokenInfraDto{
  const factory AccessTokenInfraDto({
    required String access,
  }) =_AccessTokenInfraDto;

  factory AccessTokenInfraDto.fromJson(Map<String, Object?> json) =>
      _$AccessTokenInfraDtoFromJson(json);
}