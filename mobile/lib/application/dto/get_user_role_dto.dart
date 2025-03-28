part of '../application_part.dart';

@freezed
abstract class GetUserRoleDto with _$GetUserRoleDto {
  const factory GetUserRoleDto({required String role}) = _GetUserRoleDto;
}
