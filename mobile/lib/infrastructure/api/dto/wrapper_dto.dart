part of '../../infrastructure_part.dart';

@Freezed(genericArgumentFactories: true)
abstract class ResponseWrapperDto<T> with _$ResponseWrapperDto<T> {
  const factory ResponseWrapperDto({
    required int? count,
    required String? next,
    required String? previous,
    required List<T> results,
  }) = _ResponseWrapperDto;

  factory ResponseWrapperDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ResponseWrapperDtoFromJson(json, fromJsonT);
}
