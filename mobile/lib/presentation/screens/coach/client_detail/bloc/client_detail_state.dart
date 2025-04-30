part of '../client_detail_part.dart';

@freezed
abstract class ClientDetailState with _$ClientDetailState {
  const factory ClientDetailState({
    required Status status,
    @Default(true) bool? isHealthy,
    @Default(' ') String firstName,
    @Default(' ') String lastName,
    @Default(0) int age,
    @Default(' ') String?  profilePicture,
  }) = _ClientDetailState;
}
