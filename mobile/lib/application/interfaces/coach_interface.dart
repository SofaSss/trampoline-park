part of '../application_part.dart';

abstract class ICoachService {
  Future<List<CoachModel>> getCoachList({int? limit, int? offset});
  Future<CoachModel> getCoachById({required int id});
  Future<CoachModel> getCurrentCoach();
  Future<CoachModel> updateCoach({
    File? profilePicture,
    String? phone,
    String? quote,
    int? experience,
  });
}
