import 'package:intl/intl.dart';

class DatetimeFormat {
  String formatDateTime(String dateTime) {
    String outputDate;
    try {
      DateTime parseDate = DateTime.tryParse(dateTime)!.toUtc();
      var inputDate = DateTime.parse(parseDate.toLocal().toString());
      var outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      outputDate = outputFormat.format(inputDate);
    } catch (e) {
      outputDate = '';
    }
    return outputDate;
  }

  String formatDate(String dateTime) {
    DateTime parseDate;
    String outputDate;
    try {
      parseDate = DateTime.tryParse(dateTime)!.toUtc();
      var inputDate = DateTime.parse(parseDate.toLocal().toString());
      var outputFormat = new DateFormat('dd/MM/yyyy');
      outputDate = outputFormat.format(inputDate);
    } catch (e) {
      outputDate = '';
    }
    return outputDate;
  }

  DateTime? parseStringToDate(String dateTime, {bool utc = false}) {
    try {
      var outputFormat = DateFormat('dd/MM/yyyy');
      DateTime value = outputFormat.parse(dateTime, utc);
      return value;
    } catch (e) {
      return null;
    }
  }
}
