part of '../infrastructure_part.dart';

class TokenException extends DioException implements Exception {
  TokenException({required super.requestOptions, String? errorMessage})
    : super(error: errorMessage, type: DioExceptionType.cancel);
}
