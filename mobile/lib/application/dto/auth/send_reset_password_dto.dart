part of '../../application_part.dart';

@freezed
abstract class SendResetPasswordDto with _$SendResetPasswordDto {
  const factory SendResetPasswordDto({required String email}) =
      _SendResetPasswordDto;
}
