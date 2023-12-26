import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  numberFormatVN(value) => NumberFormat("#,###", "vi_VN").format(value);

  dateFormatVN({value, format = 'dd/MM/yyyy'}) {
    if (value != null && value is String) value = DateTime.parse(value);
    return DateFormat(format).format(value);
  }

  dateFormatEN(value) => DateFormat('yyyy-MM-dd').format(value);

  datetimeFormatVN({value, format = 'dd/MM/yyyy HH:mm:ss'}) {
    if (value != null && value is String) value = DateTime.parse(value);
    return DateFormat(format).format(value);
  }

  formatDatetime(value) {
    String outputDate;
    try {
      DateTime parseDate = DateTime.tryParse(value)!.toUtc();
      var inputDate = DateTime.parse(parseDate.toLocal().toString());
      var outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      outputDate = outputFormat.format(inputDate);
    } catch (e) {
      outputDate = '';
    }
    return outputDate;
  }

  formatDate(value) {
    DateTime parseDate;
    String outputDate;
    try {
      parseDate = DateTime.tryParse(value)!.toUtc();
      var inputDate = DateTime.parse(parseDate.toLocal().toString());
      var outputFormat = DateFormat('dd/MM/yyyy');
      outputDate = outputFormat.format(inputDate);
    } catch (e) {
      outputDate = '';
    }
    return outputDate;
  }

  String fromDate({String format = "dd/MM/yyyy"}) {
    try {
      String dateString = DateFormat(format).format(this);
      return dateString;
    } catch (e) {
      return "";
    }
  }
}
