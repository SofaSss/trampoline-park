part of '../../infrastructure_part.dart';

@RestApi()
abstract class SignUpApi {
  factory SignUpApi(Dio dio, {String baseUrl}) = _SignUpApi;

  @POST('api/client/create/')
  Future<void> signUp(
    @Body() Map<String, dynamic> signUpDto,
  );
}