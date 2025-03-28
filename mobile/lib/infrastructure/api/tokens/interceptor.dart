part of '../../infrastructure_part.dart';

class DioInterceptor extends Interceptor {
  final TokenUseCases tokenUseCase;

  DioInterceptor(this.tokenUseCase);
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // if (await HasNetworkHelper.hasNetwork()) {
    final accessToken = await tokenUseCase.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
    // } else {
    //   return handler.reject(ConnectionException(requestOptions: options));
    // }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;

    if (err.response?.statusCode == 401) {
      try {
        await tokenUseCase.deleteAccessToken();
        final newTokens = await tokenUseCase.refreshTokens();

        if (newTokens == null) {
          return handler.reject(TokenException(requestOptions: options));
        }

        options.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';

        final request = await injection<Dio>().fetch(options);

        return handler.resolve(request);
      } catch (e) {
        return handler.reject(TokenException(requestOptions: options));
      }
    }

    return handler.next(err);
  }
}
