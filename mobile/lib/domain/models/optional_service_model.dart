part of '../domain_part.dart';

@freezed
abstract class OptionalServiceModel with _$OptionalServiceModel {
  const factory OptionalServiceModel({
    required int id,
    required String name,
    required String optionalServicePicture,
    required int type,
    required int price,
  }) = _OptionalServiceModel;
}
