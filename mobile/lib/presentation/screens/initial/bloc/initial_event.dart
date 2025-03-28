part of '../initial_part.dart';

@freezed
abstract class InitialEvent with _$InitialEvent {
  const factory InitialEvent.checkToken() = _CheckToken;
}
