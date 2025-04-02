part of '../client_profile_part.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  ClientProfileBloc({required this.tokenUseCases, required this.clientUseCases})
    : super(const ClientProfileState(status: Status.loading)) {
    on<_GetCurrentClient>(_getCurrentClient);
    on<_UpdateClient>(_updateClient);
    on<_SignOut>(_signOut);
  }

  final ClientUseCases clientUseCases;
  final TokenUseCases tokenUseCases;

  Future<void> _getCurrentClient(
    _GetCurrentClient event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      final client = await clientUseCases.getCurrentClient();
      emit(
        state.copyWith(
          status: Status.loaded,
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
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _updateClient(
    _UpdateClient event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));

      await clientUseCases.updateClient(
        isHealthy: event.isHealthy,
        phone: event.phoneNumber,
        profilePicture: event.profilePicture,
      );

      add(_GetCurrentClient());
      emit(state.copyWith(status: Status.success));
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _signOut(
    _SignOut event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await tokenUseCases.deleteAccessToken();
      await tokenUseCases.deleteRefreshToken();
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
