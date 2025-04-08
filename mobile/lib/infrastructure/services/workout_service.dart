part of '../infrastructure_part.dart';

class WorkoutService implements IWorkoutService {
  final WorkoutApi workoutApi;

  WorkoutService({required this.workoutApi});

  @override
  Future<List<WorkoutTypeModel>> getListWorkoutList({
    int? limit,
    int? offset,
  }) async {
    final ResponseWrapperDto<WorkoutTypeInfraDto> response = await workoutApi
        .getWorkoutTypeList(limit: limit, offset: offset);

    final List<WorkoutTypeModel> listModel =
        response.results.map((workout) {
          return WorkoutTypeModel(
            id: workout.id,
            name: workout.name,
            description: workout.description,
            price: workout.price,
            workoutPicture: workout.workoutPicture,
            duration: workout.duration,
            maxClients: workout.maxClients,
          );
        }).toList();

    return listModel;
  }
}
