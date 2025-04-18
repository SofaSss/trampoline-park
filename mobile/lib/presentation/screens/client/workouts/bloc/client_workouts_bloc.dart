part of '../client_workouts_part.dart';

class ClientWorkoutsBloc
    extends Bloc<ClientWorkoutsEvent, ClientWorkoutsState> {
  ClientWorkoutsBloc({required this.workoutUseCases})
    : super(ClientWorkoutsState(status: WorkoutStatus.loaded)) {
    on<_LoadData>(_loadData);
  }

  final WorkoutUseCases workoutUseCases;

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
