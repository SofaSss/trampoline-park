part of '../domain_part.dart';

@freezed
abstract class VideoWarmUpModel with _$VideoWarmUpModel {
  const factory VideoWarmUpModel({required int id, required String video}) =
      _VideoWarmUpModel;
}
