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
}
