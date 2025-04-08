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

  Future<VideoWarmUpModel> getVideoWarmUp() async {
    return await clientService.getVideoWarmUp(id: 1);
  }

  Future<VideoWarmUpModel> getVideoExcursion() async {
    return await clientService.getVideoWarmUp(id: 2);
  }

  Future<List<CommunicationModel>> getCommunicationList({
    int? limit,
    int? offset,
  }) async {
    return await clientService.getCommunicationList(
      limit: limit,
      offset: offset,
    );
  }
}
