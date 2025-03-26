part of '../infrastructure_part.dart';

class HasNetworkHelper {
  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup(ApiConstants.host);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
