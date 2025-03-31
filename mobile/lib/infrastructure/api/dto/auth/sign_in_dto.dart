part of '../../../infrastructure_part.dart';

@freezed
abstract class SignInInfraDto with _$SignInInfraDto {
  const factory SignInInfraDto({
    @JsonKey(name: 'username') required String email,
    required String password,
  }) = _SignInInfraDto;

  factory SignInInfraDto.fromJson(Map<String, Object?> json) =>
      _$SignInInfraDtoFromJson(json);
}
