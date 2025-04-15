part of '../../../../infrastructure_part.dart';

@freezed
abstract class OptionalServiceInfraDto with _$OptionalServiceInfraDto {
  const factory OptionalServiceInfraDto({
    required int id,
    required String name,
    @JsonKey(name: 'optional_service_picture') required String servicePicture,
    @JsonKey(name: 'price') required int servicePrice,
    @JsonKey(name: 'type') required int typeId,
  }) = _OptionalServiceInfraDto;

  factory OptionalServiceInfraDto.fromJson(Map<String, Object?> json) =>
      _$OptionalServiceInfraDtoFromJson(json);
}
