part of '../application_part.dart';

abstract class ICoachService {
  Future<List<CoachModel>> getCoachList({int? limit, int? offset});
  Future<CoachModel> getCoachById({required int id});
}
