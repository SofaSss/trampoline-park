part of '../infrastructure_part.dart';

class UserService implements IUserService {
  final SignUpApi signUpApi;

  UserService({required this.signUpApi});

  @override
  Future<void> signUp(UnregisteredUser model) async {
    final signUpDto = SignUpDto(
      firstName: model.name,
      lastName: model.lastName,
      phone: model.phone,
      dateOfBirth: DateFormat('yyyy-MM-dd').format(model.birth),
      isHealthy: model.isHealthy,
      user: UserDto(
        username: model.email,
        email: model.email,
        password: model.password,
      ),
    );

    await signUpApi.signUp(signUpDto.toJson());
  }
}
