part of '../domain_part.dart';

@freezed
abstract class ClientModel with _$ClientModel {
  const factory ClientModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required DateTime birthday,
    required String phone,
    bool? isHealthy,
    String? profilePicture,
  }) = _ClientModel;
}
