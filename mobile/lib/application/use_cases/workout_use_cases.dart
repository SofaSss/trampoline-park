part of '../application_part.dart';

class WorkoutUseCases {
  final IWorkoutService workoutService;

  WorkoutUseCases({required this.workoutService});

  Future<List<WorkoutTypeModel>> getWorkoutTypeList({
    int? limit,
    int? offset,
  }) async {
    return await workoutService.getListWorkoutModel(
      limit: limit,
      offset: offset,
    );
  }

  Future<WorkoutTypeModel> getWorkoutType({required int id}) async {
    return await workoutService.getWorkoutType(id: id);
  }

  Future<List<WorkoutModel>> getWorkoutList({
    int? limit,
    int? offset,
    int? coachId,
    int? workoutTypeId,
    DateTime? date,
  }) async {
    return await workoutService.getWorkoutList(
      limit: limit,
      offset: offset,
      coachId: coachId,
      workoutTypeId: workoutTypeId,
      date: date,
    );
  }

  Future<void> clientSignUpWorkout({required int id}) async {
    await workoutService.clientSignUpWorkout(id: id);
  }

  Future<List<WorkoutModel>> getCLientWorkoutList({
    int? limit,
    int? offset,
    DateTime? date,
  }) async {
    return await workoutService.getClientWorkoutList(
      limit: limit,
      offset: offset,
      date: date,
    );
  }
}
