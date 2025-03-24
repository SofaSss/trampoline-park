part of '../sign_up_part.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.userUseCases})
    : super(const SignUpState(status: Status.loaded)) {
    on<SignUpEvent>(_signUpEvent);
  }

  final UserUseCases userUseCases;

  Future<void> _signUpEvent(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    await userUseCases.signUp(
      name: event.name,
      lastName: event.lastName,
      email: event.email,
      phone: event.phone,
      password: event.password,
      birth: event.birth,
      isHealthy: event.isHealthy,
    );

    emit(state.copyWith(status: Status.success));
  }
}
