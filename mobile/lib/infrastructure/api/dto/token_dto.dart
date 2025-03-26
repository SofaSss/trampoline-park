part of '../../infrastructure_part.dart';

@freezed
abstract class TokenDto with _$TokenDto{
  const factory TokenDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _TokenDto;

  factory TokenDto.fromJson (Map<String, Object?> json) => _$TokenDtoFromJson(json);
}