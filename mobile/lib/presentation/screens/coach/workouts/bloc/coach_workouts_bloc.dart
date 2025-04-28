part of '../coach_workouts_part.dart';

class CoachWorkoutsBloc extends Bloc<CoachWorkoutsEvent, CoachWorkoutsState> {
  CoachWorkoutsBloc({required this.workoutUseCases})
    : super(_CoachWorkoutsState(status: WorkoutStatus.loaded)) {
    on<_LoadData>(_loadData);
  }

  final WorkoutUseCases workoutUseCases;
  Future<void> _loadData(
    _LoadData event,
    Emitter<CoachWorkoutsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: WorkoutStatus.loading));
      final workoutList = await workoutUseCases.getWorkoutList(
        date: event.date,
      );
      emit(
        state.copyWith(status: WorkoutStatus.loaded, workoutList: workoutList),
      );
    } catch (_) {
      emit(state.copyWith(status: WorkoutStatus.failure));
    }
  }
}
