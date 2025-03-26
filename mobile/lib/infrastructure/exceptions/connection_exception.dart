part of '../infrastructure_part.dart';

class ConnectionException extends DioException implements Exception {
  ConnectionException({required super.requestOptions, String? errorMessage})
    : super(error: errorMessage, type: DioExceptionType.connectionError);
}
