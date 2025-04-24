part of '../application_part.dart';

class CoachUseCases {
  final ICoachService coachService;

  CoachUseCases({required this.coachService});

  Future<List<CoachModel>> getCoachList({int? limit, int? offset}) async {
    return await coachService.getCoachList(limit: limit, offset: offset);
  }

  Future<CoachModel> getCoachById({required int id}) async {
    return await coachService.getCoachById(id: id);
  }

  Future<CoachModel> getCurrentCoach() async {
    return await coachService.getCurrentCoach();
  }

  Future<CoachModel> updateCoach({
    File? profilePicture,
    String? phone,
    String? quote,
    int? experience,
    List<int>? achievementList,
    List<int>? specialtyList,
  }) async {
    return await coachService.updateCoach(
      profilePicture: profilePicture,
      phone: phone,
      quote: quote,
      experience: experience,
      achievementList: achievementList,
      specialtyList: specialtyList,
    );
  }

  Future<void> createCoachAchievement({required String name}) async {
    await coachService.createCoachAchievement(name: name);
  }

  Future<List<IdNameModel>> getCoachAchievementsList() async {
    return await coachService.getCoachAchievementsList();
  }

  Future<void> createCoachSpecialty({required String name}) async {
    await coachService.createCoachSpecialty(name: name);
  }

  Future<List<IdNameModel>> getCoachSpecialtyList() async {
    return await coachService.getCoachSpecialtyList();
  }
}
