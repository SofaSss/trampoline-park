part of '../../infrastructure_part.dart';

@freezed
abstract class SignUpInfraDto with _$SignUpInfraDto {
  const factory SignUpInfraDto({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'phone_number') required String phone,
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    @JsonKey(name: 'is_healthy') required bool isHealthy,
    required UserInfraDto user,
  }) = _SignUpInfraDto;

  factory SignUpInfraDto.fromJson(Map<String, Object?> json) =>
      _$SignUpInfraDtoFromJson(json);
}
