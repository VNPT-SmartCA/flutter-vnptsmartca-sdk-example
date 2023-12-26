import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/models/response/service_pack_model.dart';
import '../../controller/service_pack_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/service_packs/widgets/empty_order.dart';
import '../../pages/service_packs/widgets/service_pack_appbar.dart';
import '../../pages/service_packs/widgets/service_pack_order_item.dart';
import '../../utils/color.dart';

// ignore: must_be_immutable
class ServicePackOrderScreen extends StatelessWidget {
  static String routeName = "/ServicePackOrderScreen";
  final controller = Get.find<ServicePackController>();

  ServicePackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          ServicePackAppBar(onCallback: () => Get.back(), title: AppLocalizations.of(context).information_buy_packages),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.cartItems.isEmpty
              ? const EmptyOrder()
              : ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    if (index < controller.cartItems.length) {
                      ServicePackModel item = controller.cartItems[index];
                      return ServicePackOrderItem(
                        product: item,
                        addToCart: () => controller.increaseQuantity(item, index),
                        removeToCart: () => controller.decreaseQuantity(item, index),
                        removeOrder: () => controller.deleteCartItem(item, index),
                      );
                    }
                    return const SizedBox(height: 150.0);
                  },
                  itemCount: controller.cartItems.length + 1),
        ),
      ),
      bottomSheet: Container(
        height: 160,
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
            border: Border.all(color: HexColor("#DE9B39")),
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 20, spreadRadius: 1)]),
        // child: Obx(
        //   () => ServicePackOrderBottomSheetItem(
        //     subtotalPrice: controller.subtotalPrice.value,
        //     subtotalSignturn: controller.subtotalSignturn.value,
        //     onCreatePersonalSignTurnOrder: () => controller.createPersonalSignTurnOrder(),
        //   ),
        // ),
      ),
    );
  }
}
