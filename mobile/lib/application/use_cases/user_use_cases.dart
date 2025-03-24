part of '../application_part.dart';

class UserUseCases {
  final IUserService userService;

  UserUseCases({required this.userService});

  Future<UnregisteredUser> signUp({
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
    await userService.signUp(unregisteredUser);
    return unregisteredUser;
  }
}
