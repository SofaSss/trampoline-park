part of '../service_detail_part.dart';

@freezed
abstract class ServiceDetailState with _$ServiceDetailState {
  const factory ServiceDetailState({
    required Status status,
    @Default(' ') String serviceName,
    @Default(' ') String serviceDescription,
    @Default(' ') String serviceImage,
    @Default(' ') String serviceDuration,
  }) = _ServiceDetailState;
}
