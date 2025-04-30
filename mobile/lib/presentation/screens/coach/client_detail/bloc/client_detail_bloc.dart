part of '../client_detail_part.dart';

class ClientDetailBloc extends Bloc<ClientDetailEvent, ClientDetailState> {
  ClientDetailBloc({required this.clientUseCases})
    : super(ClientDetailState(status: Status.loaded)) {
    on<_LoadData>(_loadData);
  }

  final ClientUseCases clientUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<ClientDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final client = await clientUseCases.getClientById(id: event.clientId);
      emit(
        state.copyWith(
          status: Status.loaded,
          firstName: client.firstName,
          lastName: client.lastName,
          profilePicture: client.profilePicture,
          isHealthy: client.isHealthy,
          age: DateTime.now().year - client.birthday.year,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
