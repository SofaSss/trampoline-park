part of '../domain_part.dart';

@freezed
abstract class UnregisteredClient with _$UnregisteredClient{
  const factory UnregisteredClient({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required DateTime birth,
    required bool isHealthy,
  }) = _UnregisteredClient;
}