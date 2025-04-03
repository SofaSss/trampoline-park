part of '../sign_in_part.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.authUserUseCases})
    : super(const SignInState(status: SignInStatus.loaded)) {
    on<SignInEvent>(_signInEvent);
  }

  final AuthUserUseCases authUserUseCases;

  Future<void> _signInEvent(
    SignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    try {
      final errors = {
        ...ValidationHelper.validateEmail(email: event.email),
        ...ValidationHelper.validatePassword(
          password: event.password,
          confirmPassword: event.password,
        ),
      };

      if (errors.isNotEmpty) {
        emit(state.copyWith(errors: errors, status: SignInStatus.loaded));
        return;
      }

      emit(state.copyWith(status: SignInStatus.loading));

      await authUserUseCases.signIn(email: event.email, password: event.password);

      final isClient = await authUserUseCases.isClient();
      final isCoach = await authUserUseCases.isCoach();

      if (isClient) {
        emit(state.copyWith(status: SignInStatus.toClientMainScreen));
      } else if (isCoach) {
        emit(state.copyWith(status: SignInStatus.toCoachMainScreen));
      }
    } catch (e) {
      if (e is ApiError) {
        final Map<String, String> apiErrors = {};
        e.errorMessages?.forEach((key, value) {
          apiErrors[key] = value;
        });
        emit(
          state.copyWith(status: SignInStatus.loaded, apiErrors: apiErrors),
        );
      } else {
        emit(state.copyWith(status: SignInStatus.failure));
      }
    }
  }
}
