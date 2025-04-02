part of '../sign_up_part.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.authUserUseCases})
    : super(const SignUpState(status: Status.loaded)) {
    on<SignUpEvent>(_signUpEvent);
  }

  final AuthUserUseCases authUserUseCases;

  Future<void> _signUpEvent(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      final errors = {
        ...ValidationHelper.validateText(text: event.name),
        ...ValidationHelper.validateText(text: event.lastName),
        ...ValidationHelper.validateDate(date: event.birth),
        ...ValidationHelper.validateEmail(email: event.email),
        ...ValidationHelper.validatePhone(phone: event.phone),
        ...ValidationHelper.validatePassword(
          password: event.password,
          confirmPassword: event.confirmPassword,
        ),
        ...ValidationHelper.isConfirmPDn(isConfirmPDn: event.isConfirmPDn),
      };

      if (errors.isNotEmpty) {
        emit(state.copyWith(status: Status.loaded, errors: errors));
        return;
      }

      emit(state.copyWith(status: Status.loading));

      await authUserUseCases.signUp(
        name: event.name,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
        password: event.password,
        birth: event.birth!,
        isHealthy: event.isHealthy,
      );

      emit(state.copyWith(status: Status.success));
    } catch (error) {
      if (error is ApiError) {
        emit(
          state.copyWith(
            status: Status.failure,
            // errorMessage: error.errorMessage,
          ),
        );
      } else {
        emit(state.copyWith(status: Status.failure));
      }
    }
  }
}
