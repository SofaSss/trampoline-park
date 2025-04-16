part of '../../../infrastructure_part.dart';

@freezed
abstract class WorkoutInfraDto with _$WorkoutInfraDto {
  const factory WorkoutInfraDto({
    required int id,
    @JsonKey(name: 'datetime') required DateTime dateTime,
    @JsonKey(name: 'workout_type') required int workoutType,
    required int coach,
    required List<int> clients,
  }) = _WorkoutInfraDto;

    factory WorkoutInfraDto.fromJson(Map<String, Object?> json) =>
      _$WorkoutInfraDtoFromJson(json);
}

