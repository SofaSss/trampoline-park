part of '../client_detail_part.dart';

@freezed
abstract class ClientDetailEvent with _$ClientDetailEvent {
  const factory ClientDetailEvent.loadData({
    required int clientId
  }) = _LoadData;
}