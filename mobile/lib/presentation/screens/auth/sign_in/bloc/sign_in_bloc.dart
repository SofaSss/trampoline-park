part of '../sign_in_part.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.userUseCases})
    : super(const SignInState(status: Status.loaded)) {
    on<SignInEvent>(_signInEvent);
  }

  final UserUseCases userUseCases;

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
        emit(state.copyWith(errors: errors, status: Status.loaded));
        return;
      }

      emit(state.copyWith(status: Status.loading));

      await userUseCases.signIn(email: event.email, password: event.password);

      emit(state.copyWith(status: Status.success));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
