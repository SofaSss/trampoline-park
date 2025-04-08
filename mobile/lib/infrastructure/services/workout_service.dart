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

  @override
  Future<WorkoutTypeModel> getWorkoutType({required int id}) async {
    final WorkoutTypeInfraDto workoutTypeInfraDto = await workoutApi
        .getWorkoutType(id: id);
    final WorkoutTypeModel workoutTypeModel = WorkoutTypeModel(
      id: workoutTypeInfraDto.id,
      name: workoutTypeInfraDto.name,
      description: workoutTypeInfraDto.description,
      price: workoutTypeInfraDto.price,
      workoutPicture: workoutTypeInfraDto.workoutPicture,
      duration: workoutTypeInfraDto.duration,
      maxClients: workoutTypeInfraDto.maxClients,
    );
    return workoutTypeModel;
  }
}
