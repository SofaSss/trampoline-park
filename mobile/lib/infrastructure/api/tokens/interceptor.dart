part of '../../infrastructure_part.dart';

class DioInterceptor extends Interceptor {
  final TokenUseCases tokenUseCase;

  DioInterceptor(this.tokenUseCase);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final excludePaths = [
      'client/create/',
      'auth/jwt/create/',
      'auth/jwt/refresh/',
      'auth/users/reset_password/',
      'auth/users/reset_password_confirm/',
    ];
    final isUnSignInPath = excludePaths.any((p) => (options.path.contains(p)));
    if (isUnSignInPath) {
      return handler.next(options);
    }
    final accessToken = await tokenUseCase.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    } else {
      final refreshToken = await tokenUseCase.getRefreshToken();
      if (refreshToken == null) {
        return handler.reject(DioException(requestOptions: options));
      }

      final tokens = await tokenUseCase.refreshTokens();
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    }

    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;

    if (err.response?.statusCode == 401) {
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
