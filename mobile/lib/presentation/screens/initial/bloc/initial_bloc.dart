part of '../initial_part.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc({required this.tokenUseCases, required this.userUseCases})
    : super(InitialState(status: InitialStatus.loading)) {
    on<_CheckToken>(_checkToken);
  }

  final TokenUseCases tokenUseCases;
  final AuthUserUseCases userUseCases;

  Future<void> _checkToken(
    InitialEvent event,
    Emitter<InitialState> emit,
  ) async {
    try {
      final String? refreshToken = await tokenUseCases.getRefreshToken();
      final bool isClient = await userUseCases.isClient();
      final bool isCoach = await userUseCases.isCoach();

      if (refreshToken != null) {
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
