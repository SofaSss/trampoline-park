part of '../application_part.dart';

abstract class IAuthUserService {
  Future<void> signUp({required UnregisteredClient model});

  Future<TokenDto> signIn({required SignInDto dto});

  Future<GetUserRoleDto> getUserRole();

  Future<void> activateUser({required ActivateDto activateDto});

  Future<void> setPassword({required SetPasswordDto setPasswordDto});

  Future<void> deleteAccount({required DeleteAccountDto deleteAccountDto});
}
