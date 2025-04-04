part of '../reset_password_part.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({required this.authUserUseCases})
    : super(ResetPasswordState(status: Status.loaded)) {
    on<_ResetPassword>(_resetPassword);
  }

  final AuthUserUseCases authUserUseCases;

  Future<void> _resetPassword(
    _ResetPassword event,
    Emitter<ResetPasswordState> emit,
  ) async {
    try {
      final errors = {
        ...ValidationHelper.validatePassword(
          password: event.password,
          confirmPassword: event.rePassword,
        ),
      };
      if (errors.isNotEmpty) {
        emit(state.copyWith(errors: errors, status: Status.loaded));
        return;
      }
      emit(state.copyWith(status: Status.loading));
      await authUserUseCases.resetPassword(
        uid: event.uid,
        token: event.token,
        password: event.password,
        rePassword: event.rePassword,
      );
      emit(state.copyWith(status: Status.success));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
