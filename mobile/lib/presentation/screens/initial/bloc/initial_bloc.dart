part of '../initial_part.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc({required this.tokenUseCases, required this.userUseCases})
    : super(InitialState(status: InitialStatus.loading)) {
    on<InitialEvent>(_initialEvent);
  }

  final TokenUseCases tokenUseCases;
  final AuthUserUseCases userUseCases;

  Future<void> _initialEvent(
    InitialEvent event,
    Emitter<InitialState> emit,
  ) async {
    try {
      final String? accessToken = await tokenUseCases.getAccessToken();
      final bool isFirstRun = await tokenUseCases.isFirstRun();
      final bool isClient = await userUseCases.isClient();
      final bool isCoach = await userUseCases.isCoach();
      await tokenUseCases.setIsFirstRun(isFirstRun: isFirstRun);

      if (accessToken != null) {
        if (isClient) {
          emit(state.copyWith(status: InitialStatus.toClientMainScreen));
        } else if (isCoach) {
          emit(state.copyWith(status: InitialStatus.toCoachMainScreen));
        }
      } else {
        emit(state.copyWith(status: InitialStatus.toOnBoardingScreen));
      }
    } catch (_) {
      emit(state.copyWith(status: InitialStatus.toOnBoardingScreen));
    }
  }
}
