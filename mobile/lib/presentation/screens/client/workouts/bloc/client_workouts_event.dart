part of '../client_workouts_part.dart';

@freezed
abstract class ClientWorkoutsEvent with _$ClientWorkoutsEvent {
  const factory ClientWorkoutsEvent.loadData({
    required DateTime date,
  }) = _LoadData;
}