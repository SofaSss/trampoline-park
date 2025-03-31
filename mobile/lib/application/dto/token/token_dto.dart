part of '../../application_part.dart';

@freezed
abstract class TokenDto with _$TokenDto {
  const factory TokenDto({
    required String accessToken,
    required String refreshToken,
  }) = _TokenDto;
}
