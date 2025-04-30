part of '../infrastructure_part.dart';

class CoachService implements ICoachService {
  final CoachApi coachApi;

  CoachService({required this.coachApi});

  @override
  Future<List<CoachModel>> getCoachList({int? limit, int? offset}) async {
    final ResponseWrapperDto<CoachInfraDto> response = await coachApi
        .getCoachList(limit: limit, offset: offset);
    final List<CoachModel> coachList =
        response.results.map((coach) {
          return CoachModel(
            id: coach.id,
            firstName: coach.firstName,
            lastName: coach.lastName,
            birthday: DateTime.parse(coach.dateOfBirth),
            phone: coach.phone,
            profilePicture: coach.profilePicture,
            experience: coach.experience,
            quote: coach.quote,
            email: coach.user.username,
            specialties:
                coach.specialties.map((specialty) {
                  return specialty.name;
                }).toList(),
            achievements:
                coach.achievements.map((achievement) {
                  return achievement.name;
                }).toList(),
          );
        }).toList();
    return coachList;
  }

  @override
  Future<CoachModel> getCoachById({required int id}) async {
    final CoachInfraDto coachInfraDto = await coachApi.getCoachById(id: id);
    final CoachModel coachModel = CoachModel(
      id: coachInfraDto.id,
      firstName: coachInfraDto.firstName,
      lastName: coachInfraDto.lastName,
      birthday: DateTime.parse(coachInfraDto.dateOfBirth),
      phone: coachInfraDto.phone,
      profilePicture: coachInfraDto.profilePicture,
      experience: coachInfraDto.experience,
      quote: coachInfraDto.quote,
      email: coachInfraDto.user.username,
      specialties:
          coachInfraDto.specialties.map((specialty) {
            return specialty.name;
          }).toList(),
      achievements:
          coachInfraDto.achievements.map((achievement) {
            return achievement.name;
          }).toList(),
    );

    return coachModel;
  }

  @override
  Future<CoachModel> getCurrentCoach() async {
    final coachDto = await coachApi.getCurrentCoach();
    final coachModel = CoachModel(
      id: coachDto.id,
      firstName: coachDto.firstName,
      lastName: coachDto.lastName,
      birthday: DateTime.parse(coachDto.dateOfBirth),
      phone: coachDto.phone,
      profilePicture: coachDto.profilePicture,
      experience: coachDto.experience,
      quote: coachDto.quote,
      email: coachDto.user.username,
      specialties:
          coachDto.specialties.map((specialty) {
            return specialty.name;
          }).toList(),
      achievements:
          coachDto.achievements.map((achievement) {
            return achievement.name;
          }).toList(),
    );
    return coachModel;
  }

  @override
  Future<CoachModel> updateCoach({
    File? profilePicture,
    String? phone,
    String? quote,
    int? experience,
  }) async {
    final currentCoach = await coachApi.getCurrentCoach();
    final coachDto = await coachApi.updateCoach(
      id: currentCoach.id,
      profilePicture: profilePicture,
      phone: phone,
      quote: quote,
      experience: experience,
    );
    final coachModel = CoachModel(
      id: coachDto.id,
      firstName: coachDto.firstName,
      lastName: coachDto.lastName,
      birthday: DateTime.parse(coachDto.dateOfBirth),
      phone: coachDto.phone,
      profilePicture: coachDto.profilePicture,
      experience: coachDto.experience,
      quote: coachDto.quote,
      email: coachDto.user.username,
      specialties:
          coachDto.specialties.map((specialty) {
            return specialty.name;
          }).toList(),
      achievements:
          coachDto.achievements.map((achievement) {
            return achievement.name;
          }).toList(),
    );

    return coachModel;
  }
}
