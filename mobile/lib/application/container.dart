part of 'application_part.dart';

final injection = GetIt.instance;

Future<void> setUpDependencies() async {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  injection
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<UserApi>(() => UserApi(dio))
    ..registerLazySingleton<IUserService>(
      () => UserService(userApi: injection()),
    )
    ..registerLazySingleton<UserUseCases>(
      () => UserUseCases(userService: injection()),
    );
}
