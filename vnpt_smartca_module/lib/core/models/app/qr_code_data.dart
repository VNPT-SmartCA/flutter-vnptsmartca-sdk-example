class QRCodeData {
  // QRCodeData._();

  String? citizenId;
  String? oldNumber;
  String? name;
  String? birthday;
  String? gender;
  String? address;
  String? expiredDate;

  static String? _formatDay(String? data) {
    if (data == null) {
      return null;
    }
    try {
      // only year
      if (data.length == 4) {
        return data;
      }
      if (data.length == 6) {
        return "${data[0]}${data[1]}/${data[2]}${data[3]}${data[4]}${data[5]}";
      }
      return "${data[0]}${data[1]}/${data[2]}${data[3]}/${data[4]}${data[5]}${data[6]}${data[7]}";
    } catch (e) {
      return null;
    }
  }

  static QRCodeData? fromQRRawValue(String? source) {
    if (source == null) {
      return null;
    }
    try {
      // split data with "|"
      List<String> dataSplit = source.split("|");
      // check number data
      if (dataSplit.length == 6 || dataSplit.length == 7) {
        bool hasOldNumber = dataSplit.length == 7;
        QRCodeData qrCodeData = QRCodeData();
        qrCodeData.citizenId = dataSplit[0];
        qrCodeData.oldNumber = hasOldNumber ? dataSplit[1] : "";
        qrCodeData.name = hasOldNumber ? dataSplit[2] : dataSplit[1];
        qrCodeData.birthday = _formatDay(hasOldNumber ? dataSplit[3] : dataSplit[2]);
        qrCodeData.gender = hasOldNumber ? dataSplit[4] : dataSplit[3];
        qrCodeData.address = hasOldNumber ? dataSplit[5] : dataSplit[4];
        qrCodeData.expiredDate = _formatDay(hasOldNumber ? dataSplit[6] : dataSplit[5]);
        return qrCodeData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}