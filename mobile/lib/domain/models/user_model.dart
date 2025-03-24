part of '../domain_part.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required DateTime birthday,
    required String phone,
    bool? isHealthy,
    String? profilePicture,
  }) = _UserModel;
}
