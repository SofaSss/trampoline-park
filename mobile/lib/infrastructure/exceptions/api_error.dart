part of '../infrastructure_part.dart';

class ApiError extends DioException implements Exception {
  final String? errorMessage;
  ApiError({required super.requestOptions, this.errorMessage})
    : super(error: errorMessage, type: DioExceptionType.cancel);
}
