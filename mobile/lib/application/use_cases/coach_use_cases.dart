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
  }) async {
    return await coachService.updateCoach(
      profilePicture: profilePicture,
      phone: phone,
      quote: quote,
      experience: experience,
    );
  }
}
