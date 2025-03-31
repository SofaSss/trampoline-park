part of '../../../infrastructure_part.dart';

@freezed
abstract class UnregisteredUserInfraDto with _$UnregisteredUserInfraDto {
  const factory UnregisteredUserInfraDto({
    required String username,
    required String email,
    required String password,
  }) = _UnregisteredUserInfraDto;

  factory UnregisteredUserInfraDto.fromJson(Map<String, Object?> json) =>
      _$UnregisteredUserInfraDtoFromJson(json);
}
