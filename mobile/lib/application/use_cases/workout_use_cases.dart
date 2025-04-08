part of '../application_part.dart';

class WorkoutUseCases {
  final IWorkoutService workoutService;

  WorkoutUseCases({required this.workoutService});

  Future<List<WorkoutTypeModel>> getWorkoutTypeList({
    int? limit,
    int? offset,
  }) async {
    return await workoutService.getListWorkoutList(
      limit: limit,
      offset: offset,
    );
  }

  Future<WorkoutTypeModel> getWorkoutType({required int id}) async {
    return await workoutService.getWorkoutType(id: id);
  }
}
