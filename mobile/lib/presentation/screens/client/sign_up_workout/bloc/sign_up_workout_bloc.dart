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
    if (event.reset) {
      emit(state.copyWith(workoutList: [], hasReachedEnd: false));
    }

    if (state.hasReachedEnd && !event.reset) return;

    if (state.workoutList.isEmpty) {
      emit(state.copyWith(status: WorkoutStatus.loading));
    } else {
      emit(state.copyWith(status: WorkoutStatus.loadingMore));
    }

    final offset = state.workoutList.length;

    final workoutList = await workoutUseCases.getWorkoutList(
      limit: AppConstants.limit,
      offset: offset,
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
        workoutList: [...state.workoutList, ...workoutList],
        coachList: coachList,
        workoutTypeList: workoutTypeList,
        clientId: currentClient.id,
        hasReachedEnd: workoutList.length < AppConstants.limit,
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
