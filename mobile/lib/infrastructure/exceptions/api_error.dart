part of '../infrastructure_part.dart';

class ApiError extends DioException implements Exception {
  final Map<String, String>? errorMessages;

  ApiError({
    required super.requestOptions,
    super.response,
    super.type = DioExceptionType.cancel,
    super.error,
  }) : errorMessages = _parseErrorMessages(response);

  static Map<String, String>? _parseErrorMessages(Response? response) {
    if (response?.data is Map<String, dynamic>) {
      final data = response!.data as Map<String, dynamic>;

      return _findErrorMessages(data);
    }
    return null;
  }

  static Map<String, String>? _findErrorMessages(Map<String, dynamic> data) {
    final errorMessages = <String, String>{};

    for (var key in data.keys) {
      var value = data[key];

      if (value is String) {
        errorMessages[key] = value;
      } else if (value is List) {
        for (var item in value) {
          if (item is String) {
            errorMessages[key] = item;
          }
        }
      } else if (value is Map<String, dynamic>) {
        var nestedMessages = _findErrorMessages(value);
        if (nestedMessages != null) {
          errorMessages.addAll(nestedMessages);
        }
      }
    }
    return errorMessages.isNotEmpty ? errorMessages : null;
  }

  @override
  String toString() {
    return errorMessages?.toString() ?? 'Произошла ошибка API';
  }
}
