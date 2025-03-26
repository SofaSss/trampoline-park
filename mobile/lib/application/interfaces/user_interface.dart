part of '../application_part.dart';

abstract class IUserService {
  Future<void> signUp(UnregisteredUser model);

  Future<TokenDto> signIn(SignInDto dto);
}
