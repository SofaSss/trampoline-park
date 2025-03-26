part of '../domain_part.dart';

@freezed
abstract class TokenModel with _$TokenModel {
  const factory TokenModel({
    required String accessToken,
    required String refreshToken,
  }) = _TokenModel;
}
