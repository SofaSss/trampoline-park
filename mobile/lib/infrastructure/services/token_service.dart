part of '../infrastructure_part.dart';

class TokenService implements ITokenService {
  final TokenStorage tokenStorage;
  final TokenApi tokenApi;

  TokenService({required this.tokenApi, required this.tokenStorage});

  @override
  Future<void> safeTokens({required TokenDto tokenDto}) async {
    final TokenInfraDto tokenInfraDto = TokenInfraDto(
      accessToken: tokenDto.accessToken,
      refreshToken: tokenDto.refreshToken,
    );
    await tokenStorage.safeTokens(tokenDto: tokenInfraDto);
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

  @override
  Future<TokenDto> refreshTokens({required String refreshToken}) async {
    final refresh = await tokenStorage.getRefreshToken();
    if (refresh == null) {
      throw Exception();
    }
    final Map<String, dynamic> data = {'refresh': refresh};
    final  accessToken = await tokenApi.refreshTokens(refresh: data);
    final TokenDto tokenDto = TokenDto(
      accessToken: accessToken.access,
      refreshToken: refresh,
    );
    return tokenDto;
  }
}
