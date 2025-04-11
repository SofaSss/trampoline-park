part of 'constants_part.dart';

class RegExpConstants {
  static final RegExp phoneRegExp = RegExp(r'^\+\d\s\(\d{3}\)\s\d{3}-\d{2}-\d{2}$');
  static final RegExp emailRegExp = RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}');
  static final RegExp passwordRegExp = RegExp(r'(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+{}[\]:;<>,.?/~\\-]{8,}');
  static const String mask = '+7 (###) ###-##-##';
  static const String startTimeMask = 'Начало: ##:##';
  static const String endTimeMask = 'Конец: ##:##';
}