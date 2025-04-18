part of '../../infrastructure_part.dart';

@RestApi()
abstract class WorkoutApi {
  factory WorkoutApi(Dio dio, {String baseUrl}) = _WorkoutApi;

  @GET('workout_type/list/')
  Future<ResponseWrapperDto<WorkoutTypeInfraDto>> getWorkoutTypeList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('workout_type/{id}/')
  Future<WorkoutTypeInfraDto> getWorkoutType({@Path() required int id});

  @GET('workout/list/')
  Future<ResponseWrapperDto<WorkoutInfraDto>> getWorkoutList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('coach_id') int? coachId,
    @Query('workout_type_id') int? workoutTypeId,
    @Query('date') String? date,
  });

  @PATCH('workout/update/{id}/')
  Future<void> clientSignUpWorkout({@Path() required int id});

  @GET('client_workout/list/')
  Future<ResponseWrapperDto<WorkoutInfraDto>> getClientWorkoutList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('date') String? date,
  });
}
