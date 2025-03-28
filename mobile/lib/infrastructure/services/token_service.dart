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
    final refresh = tokenStorage.getRefreshToken();
    final Map<String, dynamic> data = {'refresh': refresh};
    final TokenInfraDto tokenInfraDto = await tokenApi.refreshTokens(
      refresh: data,
    );
    final TokenDto tokenDto = TokenDto(
      accessToken: tokenInfraDto.accessToken,
      refreshToken: tokenInfraDto.refreshToken,
    );
    return tokenDto;
  }

  @override
  Future<bool> isFirstRun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstRun = prefs.getBool('isFirstRun');
    return isFirstRun ?? true;
  }

  @override
  Future<void> setIsFirstRun({required bool isFirstRun}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstRun', isFirstRun);
  }
}
