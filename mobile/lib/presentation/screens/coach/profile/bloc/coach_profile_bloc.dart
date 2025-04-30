part of '../coach_profile_part.dart';

class CoachProfileBloc extends Bloc<CoachProfileEvent, CoachProfileState> {
  CoachProfileBloc({
    required this.tokenUseCases,
    required this.authUserUseCases,
    required this.coachUseCases,
  }) : super(CoachProfileState(status: StatusProfile.loaded)) {
    on<_LoadData>(_loadData);
    on<_UpdateCoachData>(_updateCoachData);
    on<_SignOut>(_signOut);
    on<_SetPassword>(_setPassword);
  }

  final CoachUseCases coachUseCases;
  final TokenUseCases tokenUseCases;
  final AuthUserUseCases authUserUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<CoachProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusProfile.loading));
      final coach = await coachUseCases.getCurrentCoach();
      emit(
        state.copyWith(
          status: StatusProfile.loaded,
          firstName: coach.firstName,
          lastName: coach.lastName,
          quote: coach.quote,
          birthday: DateFormat('dd-MM-yyyy').format(coach.birthday),
          email: coach.email,
          phone: coach.phone,
          achievements: coach.achievements,
          specialties: coach.specialties,
          profilePicture: coach.profilePicture,
          experience: coach.experience.toString(),
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: StatusProfile.failure));
    }
  }

  Future<void> _updateCoachData(
    _UpdateCoachData event,
    Emitter<CoachProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusProfile.loading));
      await coachUseCases.updateCoach(
        profilePicture: event.profilePicture,
        phone: event.phone,
        experience: event.experience,
        quote: event.quote,
      );
      add(_LoadData());
      emit(state.copyWith(status: StatusProfile.success));
    } catch (_) {
      emit(state.copyWith(status: StatusProfile.failure));
    }
  }

  Future<void> _signOut(_SignOut event, Emitter<CoachProfileState> emit) async {
    try {
      emit(state.copyWith(status: StatusProfile.loading));
      await tokenUseCases.deleteAccessToken();
      await tokenUseCases.deleteRefreshToken();
      emit(state.copyWith(status: StatusProfile.successSignOut));
    } catch (_) {
      emit(state.copyWith(status: StatusProfile.failure));
    }
  }

  Future<void> _setPassword(
    _SetPassword event,
    Emitter<CoachProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusProfile.loading));
      final errors = {
        ...ValidationHelper.validateText(text: event.oldPassword),
        ...ValidationHelper.validatePassword(
          password: event.newPassword,
          confirmPassword: event.reNewPassword,
        ),
      };
      if (errors.isNotEmpty) {
        emit(state.copyWith(status: StatusProfile.loaded, errors: errors));
        return;
      }

      await authUserUseCases.setPassword(
        newPassword: event.newPassword,
        reNewPassword: event.reNewPassword,
        oldPassword: event.oldPassword,
      );
      add(_LoadData());
      emit(state.copyWith(status: StatusProfile.success));
    } catch (e) {
      if (e is ApiError) {
        final Map<String, String> apiErrors = {};
        e.errorMessages?.forEach((key, value) {
          apiErrors[key] = value;
        });
        emit(
          state.copyWith(status: StatusProfile.loaded, apiErrors: apiErrors),
        );
      } else {
        emit(state.copyWith(status: StatusProfile.failure));
      }
    }
  }
}
