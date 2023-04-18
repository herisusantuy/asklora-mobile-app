import 'package:intl/intl.dart';

String formatDateTimeAsString(dynamic dateTime, {String dateFormat = 'yyyy-MM-dd'}) {
  try {
    if (dateTime is DateTime) {
      return DateFormat(dateFormat).format(dateTime);
    } else {
      return DateFormat(dateFormat).format(DateTime.parse(dateTime));
    }
  } catch (e) {
    return 'Error formatting date';
  }
}


DateTime formatDateOnly(dynamic dateTime) {
  DateTime date = DateTime.parse(formatDateTimeAsString(dateTime));
  return DateTime(date.year, date.month, date.day);
}
