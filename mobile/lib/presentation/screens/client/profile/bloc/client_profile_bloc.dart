part of '../client_profile_part.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  ClientProfileBloc({required this.clientUseCases})
    : super(const ClientProfileState(status: Status.loaded)) {
    on<_GetCurrentClient>(_getCurrentClient);
  }

  final ClientUseCases clientUseCases;

  Future<void> _getCurrentClient(
    _GetCurrentClient event,
    Emitter<ClientProfileState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
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
      ),
    );
  }
}
