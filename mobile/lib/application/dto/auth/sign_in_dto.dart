part of '../../application_part.dart';

@freezed
abstract class SignInDto with _$SignInDto{
  const factory SignInDto({
    required String email,
    required String password,
  }) = _SignInDto;
}