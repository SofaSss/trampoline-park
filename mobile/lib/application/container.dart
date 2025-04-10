part of 'application_part.dart';

final injection = GetIt.instance;

Future<void> setUpDependencies() async {
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  injection
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<TokenApi>(() => TokenApi(dio))
    ..registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage())
    ..registerLazySingleton<TokenStorage>(
      () => TokenStorage(storage: injection()),
    )
    ..registerLazySingleton<ITokenService>(
      () => TokenService(tokenApi: injection(), tokenStorage: injection()),
    )
    ..registerLazySingleton<TokenUseCases>(
      () => TokenUseCases(tokenService: injection()),
    );

  final tokenInterceptor = DioInterceptor(injection<TokenUseCases>());
  dio.interceptors.add(tokenInterceptor);

  injection
    ..registerLazySingleton<DioInterceptor>(() => tokenInterceptor)
    ..registerLazySingleton<AuthUserApi>(() => AuthUserApi(dio))
    ..registerLazySingleton<IAuthUserService>(
      () => AuthUserService(userApi: injection(), tokenStorage: injection()),
    )
    ..registerLazySingleton<AuthUserUseCases>(
      () => AuthUserUseCases(authUserService: injection()),
    )
    ..registerLazySingleton<ClientApi>(() => ClientApi(dio))
    ..registerLazySingleton<IClientService>(
      () => ClientService(clientApi: injection()),
    )
    ..registerLazySingleton<ClientUseCases>(
      () => ClientUseCases(clientService: injection()),
    )
    ..registerLazySingleton<WorkoutApi>(() => WorkoutApi(dio))
    ..registerLazySingleton<IWorkoutService>(
      () => WorkoutService(workoutApi: injection()),
    )
    ..registerLazySingleton<WorkoutUseCases>(
      () => WorkoutUseCases(workoutService: injection()),
    )
    ..registerLazySingleton<CoachApi>(() => CoachApi(dio))
    ..registerLazySingleton<ICoachService>(
      () => (CoachService(coachApi: injection())),
    )
    ..registerLazySingleton<CoachUseCases>(
      () => CoachUseCases(coachService: injection()),
    );
}
