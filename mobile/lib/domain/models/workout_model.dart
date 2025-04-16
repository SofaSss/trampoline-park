part of '../domain_part.dart';

@freezed
abstract class WorkoutModel with _$WorkoutModel {
  const factory WorkoutModel({
    required int id,
    required DateTime dateTime,
    required WorkoutTypeModel workoutType,
    required CoachModel coach,
    required List<int> clients,
  }) = _WorkoutModel;
}



