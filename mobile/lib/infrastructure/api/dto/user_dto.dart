part of '../../infrastructure_part.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required String username,
    required String email,
    required String password,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json) =>
      _$UserDtoFromJson(json);
}
