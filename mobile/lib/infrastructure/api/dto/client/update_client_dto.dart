part of '../../../infrastructure_part.dart';

@freezed
abstract class UpdateClientInfraDto with _$UpdateClientInfraDto {
  const factory UpdateClientInfraDto({
    @JsonKey(name: 'phone_number') String? phone,
    @JsonKey(name: 'is_healthy') bool? isHealthy,
    @JsonKey(name: 'profile_picture') @FileConverter() File? profilePicture,
  }) = _UpdateClientInfraDto;

  factory UpdateClientInfraDto.fromJson(Map<String, Object?> json) =>
      _$UpdateClientInfraDtoFromJson(json);
}

