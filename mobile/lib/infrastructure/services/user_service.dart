part of '../infrastructure_part.dart';

class UserService implements IAuthUserService {
  final UserApi userApi;
  final TokenStorage tokenStorage;

  UserService({required this.tokenStorage, required this.userApi});

  @override
  Future<void> signUp({required UnregisteredUser model}) async {
    final signUpDto = SignUpInfraDto(
      firstName: model.name,
      lastName: model.lastName,
      phone: model.phone,
      dateOfBirth: DateFormat('yyyy-MM-dd').format(model.birth),
      isHealthy: model.isHealthy,
      user: UserInfraDto(
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
}
