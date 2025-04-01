part of '../client_profile_part.dart';

@freezed
abstract class ClientProfileEvent with _$ClientProfileEvent {
  const factory ClientProfileEvent.getCurrentClient() = _GetCurrentClient;
}
