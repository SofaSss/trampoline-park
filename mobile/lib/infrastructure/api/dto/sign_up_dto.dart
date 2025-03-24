part of '../../infrastructure_part.dart';

@freezed
 abstract class SignUpDto with _$SignUpDto{
  const factory SignUpDto({
    @JsonKey(name: 'first_name')  required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'phone_number') required String phone,
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    @JsonKey(name: 'is_healthy') required bool isHealthy,
    required UserDto user,
  }) = _SignUpDto;

  factory SignUpDto.fromJson(Map<String, Object?> json) => _$SignUpDtoFromJson(json);
}