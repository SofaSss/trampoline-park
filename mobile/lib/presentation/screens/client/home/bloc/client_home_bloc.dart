part of '../client_home_part.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc({
    required this.coachUseCases,
    required this.workoutUseCases,
    required this.clientUseCases,
  }) : super(ClientHomeState(status: Status.loaded)) {
    on<_GetProfilePicture>(_getProfilePicture);
    on<_GetWorkoutTypeList>(_getWorkoutTypeList);
    on<_GetCoachList>(_getCoachList);
    on<_GetVideoWarmUp>(_getVideoWarmUp);
    on<_GetCommunicationList>(_getCommunicationList);
  }

  final ClientUseCases clientUseCases;
  final WorkoutUseCases workoutUseCases;
  final CoachUseCases coachUseCases;

  Future<void> _getProfilePicture(
    _GetProfilePicture event,
    Emitter<ClientHomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final client = await clientUseCases.getCurrentClient();
      final profilePicture = client.profilePicture;
      emit(
        state.copyWith(status: Status.loaded, profilePicture: profilePicture),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _getWorkoutTypeList(
    _GetWorkoutTypeList event,
    Emitter<ClientHomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final workouts = await workoutUseCases.getWorkoutTypeList();
      emit(state.copyWith(status: Status.loaded, workouts: workouts));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _getCoachList(
    _GetCoachList event,
    Emitter<ClientHomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final coaches = await coachUseCases.getCoachList();
      emit(state.copyWith(status: Status.loaded, coaches: coaches));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _getVideoWarmUp(
    _GetVideoWarmUp event,
    Emitter<ClientHomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final video = await clientUseCases.getVideoWarmUp();
      final videoExcursion = await clientUseCases.getVideoExcursion();
      emit(
        state.copyWith(
          status: Status.loaded,
          videoUrl: video.video,
          videoExcursionUrl: videoExcursion.video,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _getCommunicationList(
    _GetCommunicationList event,
    Emitter<ClientHomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final communications = await clientUseCases.getCommunicationList();
      emit(
        state.copyWith(status: Status.loaded, communications: communications),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
