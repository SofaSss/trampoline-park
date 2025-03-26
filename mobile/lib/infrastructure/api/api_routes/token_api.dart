part of '../../infrastructure_part.dart';

@RestApi()
abstract class TokenApi {
  factory TokenApi(Dio dio, {String baseUrl}) = _TokenApi;

  @POST('auth//jwt/refresh/')
  Future<TokenInfraDto> refreshTokens({
    @Query('refresh_token') required String refreshToken,
  });
}
