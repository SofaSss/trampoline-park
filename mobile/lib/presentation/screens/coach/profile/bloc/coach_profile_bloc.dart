part of '../coach_profile_part.dart';

class CoachProfileBloc extends Bloc<CoachProfileEvent, CoachProfileState> {
  CoachProfileBloc({required this.coachUseCases})
    : super(CoachProfileState(status: StatusProfile.loaded)) {
    on<_LoadData>(_loadData);
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
}
