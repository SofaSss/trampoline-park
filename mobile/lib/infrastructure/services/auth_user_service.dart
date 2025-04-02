part of '../infrastructure_part.dart';

class AuthUserService implements IAuthUserService {
  final AuthUserApi userApi;
  final TokenStorage tokenStorage;

  AuthUserService({required this.tokenStorage, required this.userApi});

  @override
  Future<void> signUp({required UnregisteredClient model}) async {
    final signUpDto = SignUpInfraDto(
      firstName: model.name,
      lastName: model.lastName,
      phone: model.phone,
      dateOfBirth: DateFormat('yyyy-MM-dd').format(model.birth),
      isHealthy: model.isHealthy,
      user: UnregisteredUserInfraDto(
        username: model.email,
        email: model.email,
        password: model.password,
      ),
    );

    await userApi.signUp(signUpDto.toJson());
  }

  @override
  Future<TokenDto> signIn({required SignInDto dto}) async {
    final SignInInfraDto signInInfraDto = SignInInfraDto(
      email: dto.email,
      password: dto.password,
    );

    final TokenInfraDto tokenInfraDto = await userApi.signIn(
      signInInfraDto.toJson(),
    );

    final TokenDto tokenDto = TokenDto(
      accessToken: tokenInfraDto.accessToken,
      refreshToken: tokenInfraDto.refreshToken,
    );

    await tokenStorage.safeTokens(tokenDto: tokenInfraDto);
    return tokenDto;
  }

  @override
  Future<GetUserRoleDto> getUserRole() async {
    final user = await userApi.getUser();
    final GetUserRoleDto userRoleDto = GetUserRoleDto(role: user.role);
    return userRoleDto;
  }

  @override
  Future<void> activateUser({required ActivateDto activateDto}) async {
    final ActivateInfraDto activateInfraDto = ActivateInfraDto(
      uid: activateDto.uid,
      token: activateDto.token,
    );
    await userApi.activateUser(activateDto: activateInfraDto.toJson());
  }

  @override
  Future<void> setPassword({required SetPasswordDto setPasswordDto}) async {
    final SetPasswordInfraDto setPasswordInfraDto = SetPasswordInfraDto(
      newPassword: setPasswordDto.newPassword,
      reNewPassword: setPasswordDto.reNewPassword,
      oldPassword: setPasswordDto.oldPassword,
    );
    await userApi.setPassword(setPasswordDto: setPasswordInfraDto.toJson());
  }

  @override
  Future<void> deleteAccount({
    required DeleteAccountDto deleteAccountDto,
  }) async {
    final DeleteAccountInfraDto password = DeleteAccountInfraDto(
      password: deleteAccountDto.password,
    );
    await userApi.deleteAccount(password: password.toJson());
  }
}
