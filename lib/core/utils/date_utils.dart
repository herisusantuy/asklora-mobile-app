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
