part of '../application_part.dart';

abstract class IAuthUserService {
  Future<void> signUp({required UnregisteredUser model});

  Future<TokenDto> signIn({required SignInDto dto});

  Future<GetUserRoleDto> getUserRole();
}
