part of '../application_part.dart';

abstract class ITokenService {
  Future<TokenDto> refreshTokens({required String refreshToken});

  Future<void> safeTokens({required TokenDto tokenDto});

  Future<String?> getAccessToken();

  Future<void> deleteAccessToken();

  Future<String?> getRefreshToken();

  Future<void> deleteRefreshToken();
}
