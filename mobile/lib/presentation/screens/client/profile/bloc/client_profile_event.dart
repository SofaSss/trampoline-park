part of '../client_profile_part.dart';

@freezed
abstract class ClientProfileEvent with _$ClientProfileEvent {
  const factory ClientProfileEvent.getCurrentClient() = _GetCurrentClient;

  const factory ClientProfileEvent.updateClient({
    File? profilePicture,
    String? phoneNumber,
    bool? isHealthy,
  }) = _UpdateClient;

  const factory ClientProfileEvent.signOut() = _SignOut;

  const factory ClientProfileEvent.setPassword({
    required String oldPassword,
    required String newPassword,
    required String reNewPassword,
  }) = _SetPassword;

  const factory ClientProfileEvent.deleteAccount({required String password}) =
      _DeleteAccount;
}
