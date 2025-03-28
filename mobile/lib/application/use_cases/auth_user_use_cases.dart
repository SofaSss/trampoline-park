part of '../application_part.dart';

class AuthUserUseCases {
  final IAuthUserService authUserService;

  AuthUserUseCases({required this.authUserService});

  Future<void> signUp({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required DateTime birth,
    required bool isHealthy,
  }) async {
    UnregisteredUser unregisteredUser = UnregisteredUser(
      name: name,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      birth: birth,
      isHealthy: isHealthy,
    );
    await authUserService.signUp(model: unregisteredUser);
  }

  Future<TokenDto> signIn({
    required String email,
    required String password,
  }) async {
    final SignInDto signInModel = SignInDto(email: email, password: password);
    return await authUserService.signIn(dto: signInModel);
  }

  Future<bool> isClient() async {
    final userRole = await authUserService.getUserRole();
    return userRole.role == 'CLIENT';
  }

  Future<bool> isCoach() async {
    final userRole = await authUserService.getUserRole();
    return userRole.role == 'COACH';
  }
}
