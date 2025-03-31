part of '../../../infrastructure_part.dart';

@freezed
abstract class ClientInfraDto with _$ClientInfraDto {
  const factory ClientInfraDto({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    @JsonKey(name: 'phone_number') required String phone,
    @JsonKey(name: 'is_healthy') required bool isHealthy,
    required GetUserInfraDto user,
  }) = _ClientInfraDto;

  factory ClientInfraDto.fromJson(Map<String, Object?> json) =>
      _$ClientInfraDtoFromJson(json);
}


// abstract class ClientModel with _$ClientModel {
//   const factory ClientModel({
//     required int id,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required DateTime birthday,
//     required String phone,
//     bool? isHealthy,
//     String? profilePicture,
//   }) = _ClientModel;
// }