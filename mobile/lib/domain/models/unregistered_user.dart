part of '../domain_part.dart';

@freezed
abstract class UnregisteredUser with _$UnregisteredUser{
  const factory UnregisteredUser({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required DateTime birth,
    required bool isHealthy,
  }) = _UnregisteredUser;
}