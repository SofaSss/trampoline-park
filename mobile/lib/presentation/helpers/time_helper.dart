part of 'helpers_part.dart';

DateTime parseTimeToDateTime(String input) {
  final parts = input.split(':');
  final hour = int.tryParse(parts[0]) ?? 0;
  final minute = int.tryParse(parts[1]) ?? 0;
  final seconds = 0;
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, hour, minute, seconds);
}