part of '../application_part.dart';

abstract class IWorkoutService {
  Future<List<WorkoutTypeModel>> getListWorkoutList({int? limit, int? offset});
}
