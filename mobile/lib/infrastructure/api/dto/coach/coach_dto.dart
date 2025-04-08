part of '../../../infrastructure_part.dart';

@freezed
abstract class CoachInfraDto with _$CoachInfraDto {
  const factory CoachInfraDto({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    @JsonKey(name: 'phone_number') required String phone,
    @JsonKey(name: 'profile_picture') required String profilePicture,
    required int experience,
    required String quote,
    required GetUserInfraDto user,
    required List<SpecialtyInfraDto> specialties,
    required List<AchievementInfraDto> achievements,
  }) = _CoachInfraDto;

  factory CoachInfraDto.fromJson(Map<String, Object?> json) =>
      _$CoachInfraDtoFromJson(json);
}
