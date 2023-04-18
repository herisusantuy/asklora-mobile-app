import 'package:intl/intl.dart';

String formatDateAsString(dynamic dateTime) {
  try {
    if (dateTime is DateTime) {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    } else {
      return DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime));
    }
  } catch (e) {
    return 'Error formatting date';
  }
}

DateTime formatDateOnly(dynamic dateTime) {
  DateTime date = DateTime.parse(formatDateAsString(dateTime));
  return DateTime(date.year, date.month, date.day);
}
