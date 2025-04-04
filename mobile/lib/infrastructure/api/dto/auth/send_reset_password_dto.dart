part of '../../../infrastructure_part.dart';

@freezed
abstract class SendResetPasswordInfraDto with _$SendResetPasswordInfraDto {
  const factory SendResetPasswordInfraDto({required String email}) =
      _SendResetPasswordInfraDto;

  factory SendResetPasswordInfraDto.fromJson(Map<String, Object?> json) =>
      _$SendResetPasswordInfraDtoFromJson(json);
}
