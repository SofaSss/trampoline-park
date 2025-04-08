part of '../service_detail_part.dart';

@freezed
abstract class ServiceDetailEvent with _$ServiceDetailEvent {
  const factory ServiceDetailEvent.loadData({required int id}) = _LoadData;
}
