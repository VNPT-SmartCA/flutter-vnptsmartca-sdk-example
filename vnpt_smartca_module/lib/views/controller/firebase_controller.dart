// // ignore_for_file: prefer_const_constructors
// import 'dart:math' as Math;
//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import '../../../views/controller/home_controller.dart';
//
// import '../../configs/app_config.dart';
// import '../../configs/injector/injector.dart';
// import '../../core/models/response/certificate_model.dart';
// import '../../core/services/device_info.dart';
// import '../../core/services/secure_local_storage.dart';
// import '../../core/utils/constants.dart';
// import '../../data/repository/certificate_repository.dart';
// import 'app_controller.dart';
//
// class FirebaseController extends GetxController {
//   final secureLocalDataSource = getIt<SecureLocalStorageService>();
//
//   late FirebaseMessaging _firebaseMessaging;
//
//   late AndroidNotificationChannel channel;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   @override
//   void onInit() {
//     super.onInit();
//     initFirebase();
//   }
//
//   static Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
//     showWaitingTrans();
//   }
//
//   static onSelectNotification(NotificationResponse details) {
//     final appController = Get.find<AppController>();
//
//     if (appController.selectedIndex.value != 0) {
//       appController.selectTab(0);
//     }
//   }
//
//   Future initFirebase() async {
//     // await Firebase.initializeApp();
//     _firebaseMessaging = FirebaseMessaging.instance;
//
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings("@drawable/ic_status_notification");
//     var initializationSettingsIOS =
//         DarwinInitializationSettings(onDidReceiveLocalNotification: null);
//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//
//     _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestNotificationsPermission();
//
//     await _flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onSelectNotification,
//       onDidReceiveBackgroundNotificationResponse: onSelectNotification,
//     );
//
//     if (!kIsWeb) {
//       channel = AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         description: 'This channel is used for important notifications.',
//         importance: Importance.high,
//       );
//     }
//
//     await configToken();
//   }
//
//   static showWaitingTrans() {
//     final appController = Get.find<AppController>();
//     final homeController = Get.find<HomeController>();
//
//     if (appController.selectedIndex.value != 0 && Get.currentRoute == "/") {
//       appController.selectTab(0);
//     }
//     homeController.transactionRequestController.getTransactionRequests();
//   }
//
//   Future configToken() async {
//     await _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     await _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//
//     FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//
//       if (notification != null &&
//           !kIsWeb &&
//           _prevNotificationId != notification.hashCode) {
//         _prevNotificationId = notification.hashCode;
//         _showNotification(message);
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       showWaitingTrans();
//     });
//   }
//
//   updateFirebaseToken(List<CertificateModel> certs) async {
//     try {
//       final deviceInfoService = getIt<DeviceInfoService>();
//       final deviceInfo = await deviceInfoService.getDeviceInfo();
//
//       String fcmToken =
//           await secureLocalDataSource.getLastData(FCM_TOKEN) ?? "";
//
//       String? token = await _firebaseMessaging.getToken();
//       // kiem tra token moi hay cu
//       if (fcmToken != token) {
//         final certificateRepository = getIt<CertificateRepository>();
//
//         for (var cert in certs) {
//           if (cert.device?.deviceID == deviceInfo.deviceId &&
//               cert.status == 0) {
//             await certificateRepository
//                 .updateFCMToken({"fcmToken": token, "credentialId": cert.id});
//           }
//         }
//
//         fcmToken = token ?? '';
//         await secureLocalDataSource.saveData(FCM_TOKEN, fcmToken);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   getNotificationId() {
//     var random = Math.Random();
//     return random.nextInt(Math.pow(2, 31).toInt() - 1);
//   }
//
//   int _prevNotificationId = 0;
//
//   Future<void> _showNotification(RemoteMessage message) async {
//     if (AppConfig.isSignInApp) return;
//
//     RemoteNotification? notification = message.notification;
//
//     if (notification != null && !kIsWeb) {
//       _flutterLocalNotificationsPlugin.show(
//           Platform.isIOS ? getNotificationId() : notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//               android: AndroidNotificationDetails(
//             "vnpt_smartca",
//             "vnpt_smartca",
//             channelDescription: "channelDescription",
//             ticker: "ticker",
//             playSound: true,
//             priority: Priority.max,
//             visibility: NotificationVisibility.public,
//             ongoing: true,
//             styleInformation: BigTextStyleInformation(''),
//             importance: Importance.high,
//           )),
//           payload: jsonEncode(message.data));
//
//       showWaitingTrans();
//     }
//   }
// }
