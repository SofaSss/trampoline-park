part of '../application_part.dart';

abstract class IClientService {
  Future<ClientModel> getClientById({required int id});
}
