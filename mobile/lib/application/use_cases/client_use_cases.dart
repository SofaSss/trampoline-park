part of '../application_part.dart';

class UserUseCases {
  final IClientService clientService;

  UserUseCases({required this.clientService});

  Future<ClientModel> getUser({required int id}) async {
    return await clientService.getClientById(id: id);
  }
}
