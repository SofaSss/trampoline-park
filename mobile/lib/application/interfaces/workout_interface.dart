part of '../application_part.dart';

abstract class IWorkoutService {
  Future<List<WorkoutTypeModel>> getListWorkoutList({int? limit, int? offset});
  Future<WorkoutTypeModel> getWorkoutType({required int id});
  Future<List<WorkoutModel>> getWorkoutList({
    int? limit,
    int? offset,
    int? coachId,
    int? workoutTypeId,
    DateTime? date,
  });
  Future<List<WorkoutModel>> getClientWorkoutList({
    int? limit,
    int? offset,
    DateTime? date,
  });

  Future<void> clientSignUpWorkout({required int id});
}
