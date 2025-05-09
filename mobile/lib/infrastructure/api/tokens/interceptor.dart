part of '../../infrastructure_part.dart';

class DioInterceptor extends Interceptor {
  final TokenUseCases tokenUseCase;

  final excludePaths = [
    'client/create/',
    'auth/jwt/create/',
    'auth/jwt/refresh/',
    'auth/users/activation/',
    'auth/users/reset_password/',
    'auth/users/reset_password_confirm/',
  ];

  DioInterceptor(this.tokenUseCase);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isUnSignInPath = excludePaths.any((p) => (options.path.contains(p)));
    if (isUnSignInPath) {
      return handler.next(options);
    }
    final accessToken = await tokenUseCase.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    } else {
      return handler.reject(TokenException(requestOptions: options));
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;

    if (err.response?.statusCode == 401) {
      final isUnSignInPath = excludePaths.any(
        (p) => (options.path.contains(p)),
      );
      if (isUnSignInPath) {
        return handler.reject(err);
      }
      try {
        await tokenUseCase.deleteAccessToken();
        final newTokens = await tokenUseCase.refreshTokens();

        options.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';

        final request = await injection<Dio>().fetch(options);

        return handler.resolve(request);
      } catch (e) {
        await tokenUseCase.deleteRefreshToken();
        return handler.reject(TokenException(requestOptions: options));
      }
    }

    if (err.response?.statusCode == 400) {
      try {
        final apiError = ApiError(
          requestOptions: options,
          response: err.response,
          error: err.error,
          type: err.type,
        );

        return handler.reject(apiError);
      } catch (e) {
        final apiError = ApiError(requestOptions: options);
        return handler.reject(apiError);
      }
    }

    return handler.next(err);
  }
}
