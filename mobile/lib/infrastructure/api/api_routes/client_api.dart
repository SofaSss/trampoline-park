part of '../../infrastructure_part.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  @GET('client/me/')
  Future<ClientInfraDto> getCurrentClient();

  @PATCH('client/{id}/')
  @MultiPart()
  Future<ClientInfraDto> updateClient({
    @Path('id') required int id,
    @Part(name: 'profile_picture') File? profilePicture,
    @Part(name: 'phone_number') String? phone,
    @Part(name: 'is_healthy') bool? isHealthy,
  });

  @GET('client/{id}/')
  Future<ClientInfraDto> getClient({@Path('id') required int id});

  @GET('video_warm_up/{id}/')
  Future<VideoWarmUpInfraDto> getVideoWarmUp({@Path('id') required int id});

  @GET('communication/list/')
  Future<ResponseWrapperDto<CommunicationInfraDto>> getCommunicationList({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });
}
