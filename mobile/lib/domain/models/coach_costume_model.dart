part of '../domain_part.dart';

@freezed
abstract class CoachCostumeModel with _$CoachCostumeModel {
  const factory CoachCostumeModel({
    required int id,
    required String name,
    required String picture,
    required int price,
  }) = _CoachCostumeModel;
}
