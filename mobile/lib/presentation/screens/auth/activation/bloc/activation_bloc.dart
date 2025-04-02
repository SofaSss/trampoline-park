part of '../activation_part.dart';

class ActivationBloc extends Bloc<ActivationEvent, ActivationState> {
  ActivationBloc({required this.authUserUseCases})
    : super(const ActivationState(status: StatusProfile.loading)) {
    on<ActivationEvent>(_activationEvent);
  }

  final AuthUserUseCases authUserUseCases;

  Future<void> _activationEvent(
    ActivationEvent event,
    Emitter<ActivationState> emit,
  ) async {
    try {
      await authUserUseCases.activateUser(uid: event.uid, token: event.token);
      emit(state.copyWith(status: StatusProfile.success));
    } catch (_) {
      emit(state.copyWith(status: StatusProfile.failure));
    }
  }
}
