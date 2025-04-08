part of '../domain_part.dart';

@freezed 
abstract class CommunicationModel with _$CommunicationModel{
  const factory CommunicationModel({
    required int id,
    required String link,
    required String icon, 
  })=_CommunicationModel;
}