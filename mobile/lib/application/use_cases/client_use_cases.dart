part of '../application_part.dart';

class ClientUseCases {
  final IClientService clientService;

  ClientUseCases({required this.clientService});

  Future<ClientModel> getCurrentClient() async {
    return await clientService.getCurrentClient();
  }

  Future<ClientModel> updateClient({
    bool? isHealthy,
    String? phone,
    File? profilePicture,
  }) async {
    final UpdateClientDto updateClientDto = UpdateClientDto(
      isHealthy: isHealthy,
      phoneNumber: phone,
      profilePicture: profilePicture,
    );
    return await clientService.updateClient(updateClientDto: updateClientDto);
  }

  Future<ClientModel> getClientById({required int id}) async {
    return await clientService.getClientById(id: id);
  }
}
