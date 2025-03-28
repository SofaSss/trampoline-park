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
    ..registerLazySingleton<UserApi>(() => UserApi(dio))
    ..registerLazySingleton<IAuthUserService>(
      () => UserService(userApi: injection(), tokenStorage: injection()),
    )
    ..registerLazySingleton<AuthUserUseCases>(
      () => AuthUserUseCases(authUserService: injection()),
    );
}
