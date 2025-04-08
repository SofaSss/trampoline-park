part of '../client_home_part.dart';

@freezed
abstract class ClientHomeEvent with _$ClientHomeEvent {
  const factory ClientHomeEvent.getProfilePicture() = _GetProfilePicture;
  const factory ClientHomeEvent.getWorkoutTypeList() = _GetWorkoutTypeList;
  const factory ClientHomeEvent.getCoachList() = _GetCoachList;
  const factory ClientHomeEvent.getVideoWarmUp() = _GetVideoWarmUp;
  const factory ClientHomeEvent.getCommunicationList() = _GetCommunicationList;
}
