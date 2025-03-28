part of '../../infrastructure_part.dart';

@freezed 
abstract class GetUserInfraDto with _$GetUserInfraDto{
  const factory GetUserInfraDto({
    required int id,
    required String username,
    required String role,
  })=_GetUserInfraDto;

  factory GetUserInfraDto.fromJson(Map<String, Object?> json) =>
      _$GetUserInfraDtoFromJson(json);
}