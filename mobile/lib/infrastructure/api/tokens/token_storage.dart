part of '../../infrastructure_part.dart';

class TokenStorage {
  final fvs.FlutterSecureStorage storage;

  TokenStorage({required this.storage});

  Future<void> safeTokens({required TokenDto tokenDto}) async {
    await storage.write(key: 'access_token', value: tokenDto.accessToken);
    await storage.write(key: 'refresh_token', value: tokenDto.refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: 'access_token');
  }

  Future<void> deleteAccessToken() async {
    await storage.delete(key: 'access_token');
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

  Future<void> deleteRefreshToken() async {
    await storage.delete(key: 'refresh_token');
  }
}
