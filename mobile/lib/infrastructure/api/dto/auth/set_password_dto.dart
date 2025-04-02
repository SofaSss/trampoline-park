part of '../../../infrastructure_part.dart';

@freezed
abstract class SetPasswordInfraDto with _$SetPasswordInfraDto{
  const factory SetPasswordInfraDto ({
    @JsonKey(name: 'new_password') required String newPassword,
    @JsonKey(name: 're_new_password') required String reNewPassword,
    @JsonKey(name: 'current_password') required String oldPassword,
  }) = _SetPasswordInfraDto;
   factory SetPasswordInfraDto.fromJson(Map<String, Object?> json) =>
      _$SetPasswordInfraDtoFromJson(json);
}