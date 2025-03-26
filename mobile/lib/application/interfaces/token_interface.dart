part of '../application_part.dart';

abstract class ITokenService{

  Future<void> safeTokens({
    required TokenModel tokenModel,
  });

  Future<String?> getAccessToken();

  Future<void> deleteAccessToken();

  Future<String?> getRefreshToken();

  Future<void> deleteRefreshToken();
}