part of '../client_profile_part.dart';

@freezed 
abstract class ClientProfileState with _$ClientProfileState{
  const factory ClientProfileState({
    required Status status,
    String? profilePicture,
    String? name,
    String? lastName,
    DateTime? birthday,
    bool? isHealthy,
    String? email,
    String? phone,
  })=_ClientProfileState;

}