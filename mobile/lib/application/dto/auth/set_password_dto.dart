part of '../../application_part.dart';

@freezed
abstract class SetPasswordDto with _$SetPasswordDto {
  const factory SetPasswordDto({
    required String newPassword,
    required String reNewPassword,
    required String oldPassword,
  }) = _SetPasswordDto;
}
