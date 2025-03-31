part of '../infrastructure_part.dart';

class ClientService implements IClientService {
  final ClientApi clientApi;

  ClientService({required this.clientApi});
  
  @override
  Future<ClientModel> getClientById({required int id}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  // @override
  // Future<ClientModel> getUser({required int id}) async {
  //   final ClientInfraDto dto = await clientApi.getClient(id: id);
  //   final ClientModel client = ClientModel(
  //     id: dto.id,
  //     firstName: dto.firstName,
  //     lastName: dto.lastName,
  //     email: dto.user.username,
  //     birthday: dto.dateOfBirth,
  //     phone: dto.phone,
  //   );
  // }
}
