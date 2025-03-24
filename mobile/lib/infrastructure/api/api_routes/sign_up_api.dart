part of '../../infrastructure_part.dart';

@RestApi()
abstract class SignUpApi {
  factory SignUpApi(Dio dio, {String baseUrl}) = _SignUpApi;

  @POST('api/client/create/')
  Future<SignUpDto> signUp(
    @Body() Map<String, dynamic> signUpDto,
  );
}