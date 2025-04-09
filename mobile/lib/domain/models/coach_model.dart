part of '../domain_part.dart';

@freezed
abstract class CoachModel with _$CoachModel {
  const factory CoachModel({
    required int id,
    required String firstName,
    required String lastName,
    required DateTime birthday,
    required String phone,
    required String profilePicture,
    required int experience,
    required String quote,
    required String email,
    required List<String> specialties,
    required List<String> achievements,
  }) = _CoachModel;
}
