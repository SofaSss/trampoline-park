part of '../sign_up_workout_part.dart';

class SignUpWorkoutBloc extends Bloc<SignUpWorkoutEvent, SignUpWorkoutState> {
  SignUpWorkoutBloc({
    required this.clientUseCases,
    required this.coachUseCases,
    required this.workoutUseCases,
  }) : super(SignUpWorkoutState(status: WorkoutStatus.loaded)) {
    on<_LoadData>(_loadData);
    on<_ClientSignUpWorkout>(_clientSignUpWorkout);
  }

  final WorkoutUseCases workoutUseCases;
  final CoachUseCases coachUseCases;
  final ClientUseCases clientUseCases;

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
    final currentClient = await clientUseCases.getCurrentClient();

    final workoutTypeList = await workoutUseCases.getWorkoutTypeList();

    final coachList = await coachUseCases.getCoachList();

    emit(
      state.copyWith(
        status: WorkoutStatus.loaded,
        workoutList: workoutList,
        coachList: coachList,
        workoutTypeList: workoutTypeList,
        clientId: currentClient.id,
      ),
    );
  }

  Future<void> _clientSignUpWorkout(
    _ClientSignUpWorkout event,
    Emitter<SignUpWorkoutState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutStatus.loading));
    await workoutUseCases.clientSignUpWorkout(id: event.workoutId);
    emit(state.copyWith(status: WorkoutStatus.success));
  }
}
