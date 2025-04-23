part of '../../infrastructure_part.dart';

@RestApi()
abstract class CoachApi {
  factory CoachApi(Dio dio, {String baseUrl}) = _CoachApi;

  @GET('coach/me/')
  Future<CoachInfraDto> getCurrentCoach();

  @GET('coach/list/')
  Future<ResponseWrapperDto<CoachInfraDto>> getCoachList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('coach/{id}/')
  Future<CoachInfraDto> getCoachById({@Path() required int id});
}
