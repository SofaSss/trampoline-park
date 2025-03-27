part of '../infrastructure_part.dart';

class UserService implements IUserService {
  final UserApi userApi;

  UserService({required this.userApi});

  @override
  Future<void> signUp(UnregisteredUser model) async {
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
  Future<TokenDto> signIn(SignInDto dto) async {
    final SignInInfraDto signInInfraDto = SignInInfraDto(
      email: dto.email,
      password: dto.password,
    );

    TokenInfraDto tokenInfraDto = await userApi.signIn(signInInfraDto.toJson());

    TokenDto tokenDto = TokenDto(
      accessToken: tokenInfraDto.accessToken,
      refreshToken: tokenInfraDto.refreshToken,
    );
    return tokenDto;
  }
}
