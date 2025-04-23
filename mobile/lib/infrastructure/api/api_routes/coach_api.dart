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
