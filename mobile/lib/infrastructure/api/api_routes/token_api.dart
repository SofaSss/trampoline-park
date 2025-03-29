part of '../../infrastructure_part.dart';

@RestApi()
abstract class TokenApi {
  factory TokenApi(Dio dio, {String baseUrl}) = _TokenApi;

  @POST('auth/jwt/refresh/')
  Future<AccessTokenInfraDto> refreshTokens({
    @Body() required Map<String, dynamic> refresh,
  });
}
