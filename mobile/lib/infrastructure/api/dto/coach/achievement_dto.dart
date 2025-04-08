part of '../../../infrastructure_part.dart';

@freezed
abstract class AchievementInfraDto with _$AchievementInfraDto {
  const factory AchievementInfraDto({required int id, required String name}) =
      _AchievementInfraDto;

  factory AchievementInfraDto.fromJson(Map<String, Object?> json) =>
      _$AchievementInfraDtoFromJson(json);
}
