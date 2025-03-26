part of '../../infrastructure_part.dart';

class AccessTokenInterceptors extends Interceptor {
  final TokenUseCases tokenUseCase;

  AccessTokenInterceptors(this.tokenUseCase);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await HasNetworkHelper.hasNetwork()) {
      final accessToken = await tokenUseCase.getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      return handler.next(options);
    } else {
      return handler.reject(ConnectionException(requestOptions: options));
    }
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

        final request = await Dio().fetch(options);

        return handler.resolve(request);
      } catch (e) {
        return handler.reject(TokenException(requestOptions: options));
      }
    } else if (err.response?.statusCode == 400) {
      final responseData = err.response!.data;
      final error = responseData['error'] ?? '';
      final errorDescription =
          responseData['error_description'] ?? responseData['detail'];
      if (error == 'invalid_grant') {
        handler.reject(
          ApiError(
            requestOptions: err.requestOptions,
            errorMessage: errorDescription,
          ),
        );
        return;
      }
    } else if (err.response?.statusCode == 413) {
      return handler.reject(ApiError(requestOptions: err.requestOptions));
    }

    if (err.response != null) {
      final responseData = err.response!.data;
      final signUpErrorMessage = responseData['detail'];
      return handler.reject(
        ApiError(
          requestOptions: err.requestOptions,
          errorMessage: signUpErrorMessage,
        ),
      );
    }

    return handler.next(err);
  }
}
