part of 'application_part.dart';

final injection = GetIt.instance;

Future<void> setUpDependencies() async {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  injection
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<SignUpApi>(() => SignUpApi(dio))
    ..registerLazySingleton<IUserService>(
      () => UserService(signUpApi: injection()),
    )
    ..registerLazySingleton<UserUseCases>(
      () => UserUseCases(userService: injection()),
    );
}
