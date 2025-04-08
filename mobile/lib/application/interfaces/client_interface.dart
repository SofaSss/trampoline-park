part of '../application_part.dart';

abstract class IClientService {
  Future<ClientModel> getCurrentClient();
  Future<ClientModel> getClientById({required int id});
  Future<ClientModel> updateClient({required UpdateClientDto updateClientDto});
  Future<VideoWarmUpModel> getVideoWarmUp({required int id});
  Future<List<CommunicationModel>> getCommunicationList({int? limit, int? offset});
}
