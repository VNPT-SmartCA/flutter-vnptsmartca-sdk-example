import 'package:get/get.dart';

import '../controller/app_controller.dart';
import '../controller/auth_controller.dart';
import '../controller/host_app_controller.dart';
// import '../controller/deep_link_controller.dart';
// import '../controller/firebase_controller.dart';
// import '../controller/receive_file_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Chỉ đặt những controller global

    Get.put(AppController());
    // Get.put(DeeplinkController());
    // Get.put(ReceiveFileController());
    Get.put(AuthController());
    Get.put(HostAppController());
    // Get.put(FirebaseController());
  }
}
