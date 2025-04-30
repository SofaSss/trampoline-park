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

  @GET('coach/specialty/list/')
  Future<ResponseWrapperDto<SpecialtyInfraDto>> getCoachSpecialtyList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @POST('coach/specialty/create/')
  Future<void> createCoachSpecialty({
    @Body() required Map<String, dynamic> name,
  });

  @GET('coach/achievement/list/')
  Future<ResponseWrapperDto<AchievementInfraDto>> getCoachAchievementList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @POST('coach/achievement/create/')
  Future<void> createCoachAchievement({
    @Body() required Map<String, dynamic> name,
  });

  @GET('coach/{id}/')
  Future<CoachInfraDto> getCoachById({@Path() required int id});

  @PATCH('coach/{id}/')
  @MultiPart()
  Future<CoachInfraDto> updateCoach({
    @Path('id') required int id,
    @Part(name: 'profile_picture') File? profilePicture,
    @Part(name: 'phone_number') String? phone,
    @Part(name: 'quote') String? quote,
    @Part(name: 'experience') int? experience,
  });
}
