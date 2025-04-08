part of '../../infrastructure_part.dart';

@Freezed(genericArgumentFactories: true)
abstract class ResponseWrapperDto<T> with _$ResponseWrapperDto<T> {
  const factory ResponseWrapperDto({
    required int? count,
    required int? next,
    required int? previous,
    required List<T> results,
  }) = _ResponseWrapperDto;

  factory ResponseWrapperDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ResponseWrapperDtoFromJson(json, fromJsonT);
}
