import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../views/controller/base_controler.dart';

class BaseLoading<T extends BaseController> extends StatelessWidget {
  const BaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<T>();
    return Obx(() {
      if (controller.isLoading.value == true) {
        return const BaseLoadingWidget();
      }
      return const SizedBox();
    });
  }
}

class BaseLoadingWidget extends StatelessWidget {
  final Color bgColor;

  const BaseLoadingWidget({Key? key, this.bgColor = Colors.black12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
