part of '../../infrastructure_part.dart';

@freezed
abstract class TokenInfraDto with _$TokenInfraDto {
  const factory TokenInfraDto({
    @JsonKey(name: 'access') required String accessToken,
    @JsonKey(name: 'refresh') required String refreshToken,
  }) = _TokenInfraDto;

  factory TokenInfraDto.fromJson(Map<String, Object?> json) =>
      _$TokenInfraDtoFromJson(json);
}
