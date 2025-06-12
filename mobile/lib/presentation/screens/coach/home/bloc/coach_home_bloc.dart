part of '../coach_home_part.dart';

class CoachHomeBloc extends Bloc<CoachHomeEvent, CoachHomeState> {
  CoachHomeBloc({
    required this.eventUseCases,
    required this.workoutUseCases,
    required this.coachUseCases,
  }) : super(CoachHomeState(status: Status.loaded)) {
    on<_LoadData>(_loadData);
  }

  final CoachUseCases coachUseCases;
  final WorkoutUseCases workoutUseCases;
  final EventUseCases eventUseCases;

  Future<void> _loadData(_LoadData event, Emitter<CoachHomeState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final coach = await coachUseCases.getCurrentCoach();
      final coachTodayWorkouts = await workoutUseCases.getWorkoutList(
        date: DateTime.now().toLocal(),
      );
      final coachEventList = await eventUseCases.getListEvent();
      final coachWorkouts = await workoutUseCases.getWorkoutList();
      final coachHours =
          coachWorkouts
              .map((workout) => workout.workoutType.duration)
              .fold(0, (sum, item) => sum + item)
              .toString();
      final coachAllWorkouts =
          coachWorkouts.where((workout) => workout.clients.isNotEmpty).toList();
      final coachWorkoutsCount = coachAllWorkouts.length.toString();
      final eventCount = coachEventList.length.toString();

      final Set<ClientModel> uniqueClients = <ClientModel>{};

      for (final workout in coachWorkouts) {
        uniqueClients.addAll(workout.clients);
      }

      final coachClients = uniqueClients.toList();

      emit(
        state.copyWith(
          status: Status.loaded,
          coachName: coach.firstName,
          coachProfilePicture: coach.profilePicture,
          todayWorkoutsList: coachTodayWorkouts,
          coachMonthHours: coachHours,
          coachMonthWorkouts: coachWorkoutsCount,
          coachMonthEvents: eventCount,
          coachClients: coachClients,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
