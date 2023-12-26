// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:scale_size/scale_size.dart';
// import '../../../../core/models/app/qr_code_data.dart';
// import '../../../../gen/assets.gen.dart';
// import '../../../controller/enter_info_controller.dart';
// import '../../../controller/qr_code_controller.dart';
// import '../../../i18n/generated_locales/l10n.dart';
// import '../../../widgets/base_screen.dart';
// import '../../../widgets/base_text.dart';
// import '../../../widgets/dialog_notification.dart';
//
// class ScanQRCodeScreen extends StatelessWidget {
//   final MobileScannerController cameraController = MobileScannerController(
//       detectionSpeed: DetectionSpeed.noDuplicates, formats: [BarcodeFormat.unknown], detectionTimeoutMs: 250);
//
//   final controller = Get.put(QRCodeController());
//
//   _checkQrCode(BuildContext context, String? value) async {
//     QRCodeData? qrCodeData = QRCodeData.fromQRRawValue(value);
//     if (qrCodeData == null) {
//       _showInvalidQrCodeDialog(context);
//     } else {
//       if (qrCodeData.citizenId == null) {
//         _showInvalidQrCodeDialog(context);
//       }
//       Get.back(result: qrCodeData.citizenId);
//     }
//   }
//
//   _showInvalidQrCodeDialog(BuildContext context) {
//     Get.dialog(DialogNotification(
//       title: AppLocalizations.current.qrCodeInvalid,
//       content: AppLocalizations.current.qrCodeInvalidDescription,
//       onlyActionAccept: true,
//       titleBtnAccept: AppLocalizations.current.iUnderstand,
//       actionAccept: () {
//         cameraController.start();
//       },
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//       hideAppBar: true,
//       systemUiOverlayStyle: SystemUiOverlayStyle.light,
//       body: Stack(
//         children: [
//           MobileScanner(
//               controller: cameraController,
//               onDetect: (capture) {
//                 final List<Barcode> barcodes = capture.barcodes;
//                 cameraController.stop();
//                 _checkQrCode(context, barcodes.last.rawValue);
//               },
//               scanWindow: Rect.fromLTWH(24, 1.top + kToolbarHeight + 24 * 3 + 18, 1.width - 48, 1.width - 48),
//               errorBuilder: (context, error, child) {
//                 cameraController.stop();
//                 cameraController.start();
//                 return const SizedBox();
//               }),
//           _OverlayScanner(mobileScannerController: cameraController),
//           Obx(
//             () => Visibility(
//               visible: controller.isLoading.value,
//               child: const Center(child: CircularProgressIndicator()),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _OverlayScanner extends StatelessWidget {
//   final MobileScannerController mobileScannerController;
//
//   const _OverlayScanner({required this.mobileScannerController});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         title: BaseText(
//           AppLocalizations.current.scanQRCode,
//           fontWeight: FontWeight.w700,
//           fontSize: 18,
//           color: Colors.white,
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.black.withOpacity(0.55),
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Container(
//             width: kToolbarHeight,
//             height: kToolbarHeight,
//             alignment: Alignment.center,
//             child: Assets.images.icQrClose.image(width: 20, height: 20, fit: BoxFit.fill),
//           ),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {
//               mobileScannerController.toggleTorch();
//             },
//             child: Container(
//                 width: kToolbarHeight,
//                 height: kToolbarHeight,
//                 alignment: Alignment.center,
//                 child: ValueListenableBuilder(
//                   valueListenable: mobileScannerController.torchState,
//                   builder: (context, state, child) {
//                     switch (state) {
//                       case TorchState.off:
//                         return Assets.images.icQrFlash.image(width: 24, height: 24, fit: BoxFit.fill);
//                       case TorchState.on:
//                         return Assets.images.icQrFlashNo.image(width: 24, height: 24, fit: BoxFit.fill);
//                     }
//                   },
//                 )),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 24, bottom: 24),
//             alignment: Alignment.center,
//             color: Colors.black.withOpacity(0.55),
//             child: BaseText(
//               AppLocalizations.current.scanQRDescription,
//               textAlign: TextAlign.center,
//               fontSize: 18,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Container(
//             width: 1.width,
//             height: 1.width,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black.withOpacity(0.55), width: 24),
//             ),
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black.withOpacity(0.55), width: 4),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(Assets.images.icQrCamera.path), fit: BoxFit.fill),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 24, bottom: 24),
//             alignment: Alignment.center,
//             color: Colors.black.withOpacity(0.55),
//             child: BaseText(
//               AppLocalizations.current.scanQRGuide,
//               textAlign: TextAlign.center,
//               fontSize: 16,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Expanded(
//             child: Container(
//               alignment: Alignment.topCenter,
//               color: Colors.black.withOpacity(0.55),
//               child: InkWell(
//                 onTap: () {
//                   // todo
//                   mobileScannerController.stop();
//                   Get.delete<EnterInfoController>();
//                   Get.back();
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.white),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                   child: BaseText(
//                     AppLocalizations.current.skip,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
