import 'package:intl/intl.dart';

class DatetimeFormat {

  static stringToDate(String? date, {String format = "dd/MM/yyyy"}) {
    if (date == null) {
      return DateTime.now();
    }
    try {
      var outputFormat = DateFormat(format);
      return outputFormat.parse(date);
    } catch(e) {
      return DateTime.now();
    }
  }

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
    DateTime? parseDate;
    String outputDate;
    try {
      parseDate = DateTime.tryParse(dateTime)?.toUtc();
      var inputDate = DateTime.parse(parseDate!.toLocal().toString());
      var outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      outputDate = outputFormat.format(inputDate);
    } catch (e) {
      outputDate = '';
    }
    return outputDate;
  }

  String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}
