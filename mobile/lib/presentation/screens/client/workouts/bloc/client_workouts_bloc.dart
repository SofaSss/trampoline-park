part of '../client_workouts_part.dart';

class ClientWorkoutsBloc
    extends Bloc<ClientWorkoutsEvent, ClientWorkoutsState> {
  ClientWorkoutsBloc({required this.workoutUseCases})
    : super(ClientWorkoutsState(status: WorkoutStatus.loaded)) {
    on<_LoadData>(_loadData);
    on<_LoadRatingData>(_loadRatingData);
  }

  final WorkoutUseCases workoutUseCases;

  Future<void> _loadRatingData(
    _LoadRatingData event,
    Emitter<ClientWorkoutsState> emit,
  ) async {
    final workoutList = await workoutUseCases.getCLientWorkoutList();
    if (workoutList.length <= 20) {
      final stayedWorkouts = 20 - workoutList.length;
      emit(
        state.copyWith(
          status: WorkoutStatus.loaded,
          isFirstRating: true,
          stayedWorkout: stayedWorkouts,
        ),
      );
    } else if (workoutList.length > 20 && workoutList.length <= 50) {
      final stayedWorkouts = 50 - workoutList.length;
      emit(
        state.copyWith(
          status: WorkoutStatus.loaded,
          isSecondRating: true,
          stayedWorkout: stayedWorkouts,
        ),
      );
    } else if (workoutList.length > 50) {
      emit(state.copyWith(status: WorkoutStatus.loaded, isThirdRating: true));
    }
  }

  Future<void> _loadData(
    _LoadData event,
    Emitter<ClientWorkoutsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutStatus.loading));
    final workoutList = await workoutUseCases.getCLientWorkoutList(
      date: event.date,
    );

    emit(
      state.copyWith(status: WorkoutStatus.loaded, workoutList: workoutList),
    );
  }
}
