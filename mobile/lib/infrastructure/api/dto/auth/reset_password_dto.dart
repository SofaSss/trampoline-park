part of '../../../infrastructure_part.dart';

@freezed
abstract class ResetPasswordInfraDto with _$ResetPasswordInfraDto {
  const factory ResetPasswordInfraDto({
    required String uid,
    required String token,
    @JsonKey(name: 'new_password') required String password,
    @JsonKey(name: 're_new_password') required String rePassword,
  }) = _ResetPasswordInfraDto;

  factory ResetPasswordInfraDto.fromJson(Map<String, Object?> json) =>
      _$ResetPasswordInfraDtoFromJson(json);
}
