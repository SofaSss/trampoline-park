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
}
