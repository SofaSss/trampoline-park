part of '../application_part.dart';

abstract class ICoachService {
  Future<List<CoachModel>> getCoachList({int? limit, int? offset});
}
