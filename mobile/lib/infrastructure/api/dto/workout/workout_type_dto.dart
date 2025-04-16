part of '../../../infrastructure_part.dart';

@freezed
abstract class WorkoutTypeInfraDto with _$WorkoutTypeInfraDto {
  const factory WorkoutTypeInfraDto({
    required int id,
    required String name,
    required String description,
    required int price,
    @JsonKey(name: 'workout_picture') required String workoutPicture,
    required int duration,
    @JsonKey(name: 'max_clients') required int maxClients,
  }) = _WorkoutTypeInfraDto;

    factory WorkoutTypeInfraDto.fromJson(Map<String, Object?> json) =>
      _$WorkoutTypeInfraDtoFromJson(json);
}
