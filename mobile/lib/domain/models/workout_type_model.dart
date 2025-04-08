part of '../domain_part.dart';

@freezed
abstract class WorkoutTypeModel with _$WorkoutTypeModel{
  const factory WorkoutTypeModel({
    required int id,
    required String name,
    required String description,
    required int price,
    required String workoutPicture,
    required int duration,
    required int maxClients,
  }) = _WorkoutTypeModel;
}