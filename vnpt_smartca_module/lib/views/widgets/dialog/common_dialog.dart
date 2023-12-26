import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../theme/styles.dart';
import '../../theme/theme.dart';
import '../../widgets/dialog/custom_dialog.dart';
import '../../widgets/dialog/success_change_dialog.dart';
import '../dialog_notification.dart';
import 'alert_dialog.dart';

showProgress() {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(
        backgroundColor: Color(0xff0D75D6),
      ),
    ),
    barrierDismissible: false,
  );
}

showChangeSuccess(String message, {VoidCallback? callback}) {
  Get.dialog(
    Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppRadius.rc8)),
      child: SuccessChangeDialog(
        title: AppLocalizations.current.successNotirce,
        buttonText: AppLocalizations.current.close,
        description: message,
        showIcon: true,
        callback: () {},
        buttonColor: const Color(0xffDE9B39),
      ),
    ),
    barrierDismissible: false,
  );
}

Future<T?> showErrorModal<T>(String message,
    {String? title, AssetGenImage? image, VoidCallback? callback}) {
  return Get.dialog(
    DialogNotification(
      title: title,
      content: message,
      image: image,
      onlyActionCancel: true,
      actionCancel: callback,
    ),
  );
}

Future<T?> showNotifyModal<T>(String message,
    {bool onlyActionCancel = true,
    String? titleBtnAccept,
    String? titleBtnCancel,
    String? title,
    AssetGenImage? image,
    VoidCallback? actionAccept,
    VoidCallback? actionCancel}) {
  return Get.dialog(
    DialogNotification(
      content: message,
      image: image,
      title: title,
      onlyActionCancel: onlyActionCancel,
      titleBtnAccept: titleBtnAccept,
      titleBtnCancel: titleBtnCancel,
      actionAccept: actionAccept,
      actionCancel: actionCancel,
    ),
  );
}

// ignore: long-parameter-list
Future<T?> showSuccessModal<T>({
  required String message,
  String? title,
  required VoidCallback actionAccept,
  String? titleBtnAccept,
}) {
  return Get.dialog(
    DialogNotification(
      title: title,
      image: Assets.images.icDialogSuccess,
      content: message,
      onlyActionAccept: true,
      actionAccept: actionAccept,
      titleBtnAccept: titleBtnAccept,
    ),
  );
}

showProgressWithMesg(BuildContext context, String mesg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: AppGap.g10),
          Text(
            mesg,
            style: mainTheme.textTheme.bodyText2!.copyWith(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

hideProgress({bool closeOverlays = false}) {
  Get.back(closeOverlays: closeOverlays);
}

warningAndExitApp(BuildContext context, String msg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppRadius.rc8)),
        child: CustomAlertDialog(
          showCloseIcon: false,
          buttonText: AppLocalizations.current.pinDialogButton,
          description: msg,
          callback: () => exit(0),
        ),
      );
    },
  );
}

showReactiveSuccess(
    BuildContext context, String message, VoidCallback callback) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: AlertSuccessDialog(
          popupTitle: '',
          buttonText: AppLocalizations.current.close,
          description: message,
          showIcon: true,
          showCloseIcon: false,
          callback: callback,
        ),
      );
    },
  );
}

dialogResultNotApproved(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: CustomAlertDialog(
            popupTitle: '',
            buttonText: AppLocalizations.current.close,
            description: message,
            showIcon: true,
            callback: () {
              Get.toNamed("/");
            }),
      );
    },
  );
}
