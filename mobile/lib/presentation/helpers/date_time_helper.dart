part of 'helpers_part.dart';

class DateTimeHelper {
  static Future<DateTime?> selectDate(
    BuildContext context, {
    DateTime? selectedDate,
  }) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2017),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      return selected;
    }
    return null;
  }
}
