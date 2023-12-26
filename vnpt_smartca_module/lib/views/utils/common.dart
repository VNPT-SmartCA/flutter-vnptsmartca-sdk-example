import 'dart:math';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../configs/app_config.dart';
import '../../configs/injector/injector.dart';
import '../../core/services/secure_local_storage.dart';

class Common {
  static final secureLocalDataSource = getIt<SecureLocalStorageService>();

  static callHotline() async {
    final Uri launchUri = Uri(scheme: 'tel', path: AppConfig.hotline);
    await launchUrl(launchUri);
  }

  static String formatPrice(price, {bool showPrefix = true, bool formatDouble = false}) {
    if (price == null) {
      return "";
    }
    try {
      if (formatDouble && price.toString().split(".").length > 1) {
        String format = "#,##0.";
        for (int i = 0; i < price.toString().split(".")[1].length; i++) {
          format = format + "0";
          if (i >= 3) {
            break;
          }
        }
        final numberFormat = NumberFormat(format);
        return numberFormat.format(double.parse(price.toString())) + "${showPrefix ? " VNĐ" : ""}";
      } else {
        final numberFormat = NumberFormat("#,###");
        return numberFormat.format(double.parse(price.toString()).round()) + "${showPrefix ? " VNĐ" : ""}";
      }
    } catch (e) {
      return price?.toString() ?? "";
    }
  }

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static String getRandomString(int length) {
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));
  }
}
