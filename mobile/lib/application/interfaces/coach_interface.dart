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
    List<int>? achievementList,
    List<int>? specialtyList
  });
  Future<void> createCoachAchievement({required String name});
  Future<List<IdNameModel>>  getCoachAchievementsList();
  Future<void> createCoachSpecialty({required String name});
  Future<List<IdNameModel>>  getCoachSpecialtyList();
}
