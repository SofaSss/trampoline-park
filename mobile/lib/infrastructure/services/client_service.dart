part of '../infrastructure_part.dart';

class ClientService implements IClientService {
  final ClientApi clientApi;

  ClientService({required this.clientApi});

  @override
  Future<ClientModel> getCurrentClient() async {
    final ClientInfraDto dto = await clientApi.getCurrentClient();
    final ClientModel client = ClientModel(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.user.username,
      birthday: DateTime.parse(dto.dateOfBirth),
      phone: dto.phone,
      profilePicture: dto.profilePicture,
      isHealthy: dto.isHealthy,
    );
    return client;
  }

  @override
  Future<ClientModel> getClientById({required int id}) async {
    final ClientInfraDto dto = await clientApi.getClient(id: id);
    final ClientModel client = ClientModel(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.user.username,
      birthday: DateTime.parse(dto.dateOfBirth),
      phone: dto.phone,
    );
    return client;
  }

  @override
  Future<ClientModel> updateClient({
    required UpdateClientDto updateClientDto,
  }) async {
    final currentClient = await clientApi.getCurrentClient();
    final UpdateClientInfraDto updateClientData = UpdateClientInfraDto(
      profilePicture: updateClientDto.profilePicture,
      phone: updateClientDto.phoneNumber,
      isHealthy: updateClientDto.isHealthy,
    );
    final ClientInfraDto updateClientInfra = await clientApi.updateClient(
      id: currentClient.id,
      phone: updateClientData.phone,
      isHealthy: updateClientData.isHealthy,
      profilePicture: updateClientData.profilePicture,
    );
    final ClientModel updateClient = ClientModel(
      id: updateClientInfra.id,
      firstName: updateClientInfra.firstName,
      lastName: updateClientInfra.lastName,
      email: updateClientInfra.user.username,
      birthday: DateTime.parse(updateClientInfra.dateOfBirth),
      phone: updateClientInfra.phone,
      profilePicture: updateClientInfra.profilePicture,
    );

    return updateClient;
  }
}
