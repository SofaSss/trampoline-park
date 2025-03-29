part of '../../infrastructure_part.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST('client/create/')
  Future<void> signUp(@Body() Map<String, dynamic> signUpDto, );

  @POST('auth/jwt/create/')
  Future<TokenInfraDto> signIn(@Body() Map<String, dynamic> signInDto);

  @GET('auth/users/me/')
  Future<GetUserInfraDto> getUser();
}
