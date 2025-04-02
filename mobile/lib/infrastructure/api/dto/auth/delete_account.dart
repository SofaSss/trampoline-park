part of '../../../infrastructure_part.dart';

@freezed
abstract class DeleteAccountInfraDto with _$DeleteAccountInfraDto {
  const factory DeleteAccountInfraDto({
    @JsonKey(name: 'current_password') required String password,
  }) = _DeleteAccountInfraDto;

  factory DeleteAccountInfraDto.fromJson(Map<String, Object?> json) =>
      _$DeleteAccountInfraDtoFromJson(json);
}
