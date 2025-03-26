part of '../infrastructure_part.dart';

class TokenService implements ITokenService {
  final TokenStorage tokenStorage;

  TokenService({required this.tokenStorage});

  @override
  Future<void> safeTokens({required TokenModel tokenModel}) async {
    final TokenDto tokenDto = TokenDto(
      accessToken: tokenModel.accessToken,
      refreshToken: tokenModel.refreshToken,
    );
    await tokenStorage.safeTokens(tokenDto: tokenDto);
  }

  @override
  Future<String?> getAccessToken() async {
    return await tokenStorage.getAccessToken();
  }

  @override
  Future<void> deleteAccessToken() async {
    await tokenStorage.deleteAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return await tokenStorage.getRefreshToken();
  }

  @override
  Future<void> deleteRefreshToken() async {
    await tokenStorage.deleteRefreshToken();
  }
}
