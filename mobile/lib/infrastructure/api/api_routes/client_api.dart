part of '../../infrastructure_part.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  @GET('client/{id}/')
  Future<ClientInfraDto> getClient({@Path('id') required int id});
}
