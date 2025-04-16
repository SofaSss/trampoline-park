part of '../sign_up_workout_part.dart';

class SignUpWorkoutBloc extends Bloc<SignUpWorkoutEvent, SignUpWorkoutState> {
  SignUpWorkoutBloc({required this.workoutUseCases})
    : super(SignUpWorkoutState(status: WorkoutStatus.loaded)) {
    on<_LoadData>(_loadData);
  }

  final WorkoutUseCases workoutUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<SignUpWorkoutState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutStatus.loading));
    final workoutList = await workoutUseCases.getWorkoutList(
      //  limit: limit,
      // offset: offset,
      coachId: event.coachId,
      workoutTypeId: event.workoutTypeId,
      date: event.date,
    );

    emit(
      state.copyWith(
        status: WorkoutStatus.loaded,
        workoutList: workoutList,
      ),
    );
  }
}
