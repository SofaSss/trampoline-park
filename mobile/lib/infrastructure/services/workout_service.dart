part of '../infrastructure_part.dart';

class WorkoutService implements IWorkoutService {
  final WorkoutApi workoutApi;
  final CoachService coachService;
  final ClientService clientService;

  WorkoutService({
    required this.clientService, 
    required this.coachService,
    required this.workoutApi,
  });

  @override
  Future<List<WorkoutTypeModel>> getListWorkoutModel({
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

  @override
  Future<List<WorkoutModel>> getWorkoutList({
    int? limit,
    int? offset,
    int? coachId,
    int? workoutTypeId,
    DateTime? date,
  }) async {
    final response = await workoutApi.getWorkoutList(
      limit: limit,
      offset: offset,
      date: date != null ? DateFormat('yyyy-MM-dd').format(date) : null,
      coachId: coachId,
      workoutTypeId: workoutTypeId,
    );

    final List<WorkoutModel> workoutModelList = await Future.wait(
      response.results.map((workout) async {
        return WorkoutModel(
          id: workout.id,
          dateTime: workout.dateTime,
          workoutType: await getWorkoutType(id: workout.workoutType),
          coach: await coachService.getCoachById(id: workout.coach),
          clients: await Future.wait(
            workout.clients.map((id) async {
              return await clientService.getClientById(id: id);
            }),
          ),
        );
      }),
    );

    return workoutModelList;
  }

  @override
  Future<void> clientSignUpWorkout({required int id}) async {
    await workoutApi.clientSignUpWorkout(id: id);
  }

  @override
  Future<List<WorkoutModel>> getClientWorkoutList({
    int? limit,
    int? offset,
    DateTime? date,
  }) async {
    final response = await workoutApi.getClientWorkoutList(
      limit: limit,
      offset: offset,
      date: date != null ? DateFormat('yyyy-MM-dd').format(date) : null,
    );

    final List<WorkoutModel> workoutModelList = await Future.wait(
      response.results.map((workout) async {
        return WorkoutModel(
          id: workout.id,
          dateTime: workout.dateTime,
          workoutType: await getWorkoutType(id: workout.workoutType),
          coach: await coachService.getCoachById(id: workout.coach),
          clients: await Future.wait(
            workout.clients.map((id) async {
              return await clientService.getClientById(id: id);
            }),
          ),
        );
      }),
    );

    return workoutModelList;
  }
}
