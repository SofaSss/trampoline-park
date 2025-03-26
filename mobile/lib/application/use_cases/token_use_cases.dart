part of '../application_part.dart';

class TokenUseCases {
  final ITokenService tokenService;

  TokenUseCases({required this.tokenService});

  Future<void> safeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    TokenModel tokenModel = TokenModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    await tokenService.safeTokens(tokenModel: tokenModel);
  }

  Future<String?> getAccessToken() async {
    return await tokenService.getAccessToken();
  }

  Future<void> deleteAccessToken() async {
    await tokenService.deleteAccessToken();
  }

  Future<String?> getRefreshToken() async {
    return await tokenService.getRefreshToken();
  }

  Future<void> deleteRefreshToken() async {
    await tokenService.deleteRefreshToken();
  }
}
