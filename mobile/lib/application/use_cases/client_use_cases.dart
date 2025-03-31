part of '../application_part.dart';

class ClientUseCases {
  final IClientService clientService;

  ClientUseCases({required this.clientService});

  Future<ClientModel> getClientById({required int id}) async {
    return await clientService.getClientById(id: id);
  }
}
