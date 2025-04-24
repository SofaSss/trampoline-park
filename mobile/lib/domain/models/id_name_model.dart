part of '../domain_part.dart';

@freezed
abstract class IdNameModel with _$IdNameModel {
  const factory IdNameModel({required int id, required String name}) =
      _IdNameModel;
}
