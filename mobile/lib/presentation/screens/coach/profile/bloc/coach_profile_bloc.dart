part of '../coach_profile_part.dart';

class CoachProfileBloc extends Bloc<CoachProfileEvent, CoachProfileState> {
  CoachProfileBloc({required this.coachUseCases})
    : super(CoachProfileState(status: StatusProfile.loaded)) {
    on<_LoadData>(_loadData);
    on<_UpdateCoachData>(_updateCoachData);
    on<_GetCoachAchievementList>(_getCoachAchievementList);
    on<_GetCoachSpecialtyList>(_getCoachSpecialtyList);
    on<_CreateCoachAchievement>(_createCoachAchievement);
    on<_CreateCoachSpecialty>(_createCoachSpecialty);
  }

  final CoachUseCases coachUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<CoachProfileState> emit,
  ) async {
    emit(state.copyWith(status: StatusProfile.loading));
    final coach = await coachUseCases.getCurrentCoach();
    emit(
      state.copyWith(
        status: StatusProfile.loaded,
        firstName: coach.firstName,
        lastName: coach.lastName,
        quote: coach.quote,
        birthday: DateFormat('dd-MM-yyyy').format(coach.birthday),
        email: coach.email,
        phone: coach.phone,
        achievements: coach.achievements,
        specialties: coach.specialties,
        profilePicture: coach.profilePicture,
        experience: coach.experience.toString(),
      ),
    );
  }

  Future<void> _updateCoachData(
    _UpdateCoachData event,
    Emitter<CoachProfileState> emit,
  ) async {
    emit(state.copyWith(status: StatusProfile.loading));
    await coachUseCases.updateCoach(
      profilePicture: event.profilePicture,
      phone: event.phone,
      experience: event.experience,
      quote: event.quote,
      achievementList: event.achievementList,
      specialtyList: event.specialtyList
    );
    add(_LoadData());
    emit(state.copyWith(status: StatusProfile.success));
  }

  Future<void> _getCoachAchievementList(
    _GetCoachAchievementList event,
    Emitter<CoachProfileState> emit,
  ) async {
    emit(state.copyWith(status: StatusProfile.loading));
    final coachAchievements = await coachUseCases.getCoachAchievementsList();
    emit(
      state.copyWith(
        status: StatusProfile.loaded,
        coachAchievements: coachAchievements,
      ),
    );
  }

  Future<void> _getCoachSpecialtyList(
    _GetCoachSpecialtyList event,
    Emitter<CoachProfileState> emit,
  ) async {
    emit(state.copyWith(status: StatusProfile.loading));
    final coachSpecialties = await coachUseCases.getCoachSpecialtyList();
    emit(
      state.copyWith(
        status: StatusProfile.loaded,
        coachSpecialties: coachSpecialties,
      ),
    );
  }

  Future<void> _createCoachAchievement(
    _CreateCoachAchievement event,
    Emitter<CoachProfileState> emit,
  ) async {
    await coachUseCases.createCoachAchievement(name: event.name);
  }

  Future<void> _createCoachSpecialty(
    _CreateCoachSpecialty event,
    Emitter<CoachProfileState> emit,
  ) async {
    await coachUseCases.createCoachSpecialty(name: event.name);
  }
}
