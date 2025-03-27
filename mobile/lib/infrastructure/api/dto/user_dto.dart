part of '../../infrastructure_part.dart';

@freezed
abstract class UserInfraDto with _$UserInfraDto {
  const factory UserInfraDto({
    required String username,
    required String email,
    required String password,
  }) = _UserInfraDto;

  factory UserInfraDto.fromJson(Map<String, Object?> json) =>
      _$UserInfraDtoFromJson(json);
}
