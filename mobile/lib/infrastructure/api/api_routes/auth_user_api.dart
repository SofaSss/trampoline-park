part of '../../infrastructure_part.dart';

@RestApi()
abstract class AuthUserApi {
  factory AuthUserApi(Dio dio, {String baseUrl}) = _AuthUserApi;

  @POST('client/create/')
  Future<void> signUp(@Body() Map<String, dynamic> signUpDto);

  @POST('auth/jwt/create/')
  Future<TokenInfraDto> signIn(@Body() Map<String, dynamic> signInDto);

  @GET('auth/users/me/')
  Future<GetUserInfraDto> getUser();

  @POST('auth/users/activation/')
  Future<void> activateUser({
    @Body() required Map<String, dynamic> activateDto,
  });

  @POST('auth/users/set_password/')
  Future<void> setPassword({
    @Body() required Map<String, dynamic> setPasswordDto,
  });

  @DELETE('auth/users/me/')
  Future<void> deleteAccount({@Body() required Map<String, dynamic> password});
}
