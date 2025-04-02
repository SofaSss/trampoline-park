part of '../client_profile_part.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  ClientProfileBloc({
    required this.authUserUseCases,
    required this.tokenUseCases,
    required this.clientUseCases,
  }) : super(const ClientProfileState(status: StatusProfile.loading)) {
    on<_GetCurrentClient>(_getCurrentClient);
    on<_UpdateClient>(_updateClient);
    on<_SignOut>(_signOut);
    on<_SetPassword>(_setPassword);
    on<_DeleteAccount>(_deleteAccount);
  }

  final ClientUseCases clientUseCases;
  final TokenUseCases tokenUseCases;
  final AuthUserUseCases authUserUseCases;

  Future<void> _getCurrentClient(
    _GetCurrentClient event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      final client = await clientUseCases.getCurrentClient();
      emit(
        state.copyWith(
          status: StatusProfile.loaded,
          profilePicture: client.profilePicture,
          name: client.firstName,
          lastName: client.lastName,
          birthday: client.birthday,
          email: client.email,
          phone: client.phone,
          isHealthy: client.isHealthy,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: StatusProfile.failure));
    }
  }

  Future<void> _updateClient(
    _UpdateClient event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusProfile.loading));

      await clientUseCases.updateClient(
        isHealthy: event.isHealthy,
        phone: event.phoneNumber,
        profilePicture: event.profilePicture,
      );

      add(_GetCurrentClient());
      emit(state.copyWith(status: StatusProfile.success));
    } catch (_) {
      emit(state.copyWith(status: StatusProfile.failure));
    }
  }

  Future<void> _signOut(
    _SignOut event,
    Emitter<ClientProfileState> emit,
  ) async {
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
    Emitter<ClientProfileState> emit,
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
      add(_GetCurrentClient());
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

  Future<void> _deleteAccount(
    _DeleteAccount event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: StatusProfile.loading));
      await authUserUseCases.deleteAccount(password: event.password);
      emit(state.copyWith(status: StatusProfile.successDeleteAccount));
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
