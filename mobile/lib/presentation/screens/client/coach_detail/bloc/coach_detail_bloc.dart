part of '../coach_detail_part.dart';

class CoachDetailBloc extends Bloc<CoachDetailEvent, CoachDetailState> {
  CoachDetailBloc({required this.coachUseCases})
    : super(CoachDetailState(status: Status.loaded)) {
    on<_LoadData>(_loadData);
  }

  final CoachUseCases coachUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<CoachDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final coach = await coachUseCases.getCoachById(id: event.id);

      emit(
        state.copyWith(
          status: Status.loaded,
          coachPicture: coach.profilePicture,
          firstName: coach.firstName,
          lastName: coach.lastName,
          quote: coach.quote,
          experience: coach.experience.toString(),
          specialties: coach.specialties,
          achievements: coach.achievements,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
