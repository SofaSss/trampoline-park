part of '../../application_part.dart';

@freezed
abstract class ResetPasswordDto with _$ResetPasswordDto {
  const factory ResetPasswordDto({
    required String uid,
    required String token,
    required String password,
    required String rePassword,
  }) = _ResetPasswordDto;
}
