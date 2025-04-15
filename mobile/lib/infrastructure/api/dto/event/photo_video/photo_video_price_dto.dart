part of '../../../../infrastructure_part.dart';

@freezed
abstract class PhotoVideoPriceInfraDto with _$PhotoVideoPriceInfraDto {
  const factory PhotoVideoPriceInfraDto({
    required int id,
    @JsonKey(name: 'photographer_price') required int photographerPrice,
    @JsonKey(name: 'videographer_price') required int videographerPrice,
  }) = _PhotoVideoPriceInfraDto;

  factory PhotoVideoPriceInfraDto.fromJson(Map<String, Object?> json) =>
      _$PhotoVideoPriceInfraDtoFromJson(json);
}
