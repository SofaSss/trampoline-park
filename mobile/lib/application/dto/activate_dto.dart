part of '../application_part.dart';

@freezed
abstract class ActivateDto with _$ActivateDto {
  const factory ActivateDto({required String uid, required String token}) =
      _ActivateDto;
}
