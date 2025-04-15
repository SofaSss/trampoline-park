part of '../../infrastructure_part.dart';

@RestApi()
abstract class EventApi {
  factory EventApi(Dio dio, {String baseUrl}) = _EventApi;

  @GET('coach_costume/list/')
  Future<ResponseWrapperDto<CoachCostumeInfraDto>> getListCoachCostume({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('type_optional_service/list/')
  Future<ResponseWrapperDto<TypeOptionalServiceInfraDto>>
  getListTypeOptionalService({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });

  @GET('optional_service/list/')
  Future<ResponseWrapperDto<OptionalServiceInfraDto>> getListOptionalService({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('type_optional_service_id') required int typeOptionalService,
  });

  @POST('event/create/')
  Future<void> createEvent({
    @Body() required Map<String, dynamic> createEventInfraDto,
  });

  @GET('photo_video_price/1/')
  Future<PhotoVideoPriceInfraDto> getPhotoVideoPrice();
}
