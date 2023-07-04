import 'package:intl/intl.dart';

String formatDateTimeAsString(dynamic dateTime,
    {String dateFormat = 'yyyy-MM-dd'}) {
  try {
    if (dateTime is DateTime) {
      return DateFormat(dateFormat).format(dateTime);
    } else {
      return DateFormat(dateFormat).format(DateTime.parse(dateTime));
    }
  } catch (e) {
    return '-';
  }
}

DateTime formatDateTimeToLocal(dynamic dateTime,
    {String dateFormat = 'dd/MM/yyyy HH:mm', bool isUtc = true}) {
  return DateFormat(dateFormat)
      .parse(DateFormat(dateFormat).format(DateTime.parse(dateTime)), isUtc)
      .toLocal();
}

DateTime formatDateOnly(dynamic dateTime) {
  DateTime date = DateTime.parse(formatDateTimeAsString(dateTime));
  return DateTime(date.year, date.month, date.day);
}

String convertDateToUtc(dynamic dateTime, {String dateFormat = 'dd/MM/yyyy'}) {
  DateTime date = DateFormat(dateFormat).parse(DateFormat(dateFormat)
      .format(DateTime.parse(dateTime).subtract(const Duration(hours: 4))));
  return formatDateTimeAsString(date, dateFormat: dateFormat);
}
