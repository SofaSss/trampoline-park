part of '../application_part.dart';

class TokenUseCases {
  final ITokenService tokenService;

  TokenUseCases({required this.tokenService});

  Future<bool> isFirstRun() async {
    return await tokenService.isFirstRun();
  }

  Future<void> setIsFirstRun({required bool isFirstRun}) async {
    if (isFirstRun) {
      await tokenService.deleteAccessToken();
      await tokenService.deleteRefreshToken();
      await tokenService.setIsFirstRun(isFirstRun: false);
    }
  }

  Future<void> safeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    TokenDto tokenDto = TokenDto(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    await tokenService.safeTokens(tokenDto: tokenDto);
  }

  Future<TokenDto?> refreshTokens() async {
    final String? refreshToken = await getRefreshToken();
    if (refreshToken != null) {
      final TokenDto tokenDto = await tokenService.refreshTokens(
        refreshToken: refreshToken,
      );
      await safeTokens(
        accessToken: tokenDto.accessToken,
        refreshToken: tokenDto.refreshToken,
      );

      final newAccessToken = await getAccessToken();
      final newRefreshToken = await getRefreshToken();

      if (newAccessToken == null || newRefreshToken == null) return null;

      return TokenDto(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );
    }
    return null;
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
