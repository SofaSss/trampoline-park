part of '../domain_part.dart';

@freezed
abstract class PhotoVideoPriceModel with _$PhotoVideoPriceModel {
  const factory PhotoVideoPriceModel({
    required int id,
    required int photographerPrice,
    required int videographerPrice,
  }) = _PhotoVideoPriceModel;
}
