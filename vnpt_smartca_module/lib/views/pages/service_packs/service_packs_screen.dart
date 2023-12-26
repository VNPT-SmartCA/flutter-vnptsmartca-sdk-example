import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/models/response/service_pack_model.dart';
import '../../controller/service_pack_controller.dart';
import '../../controller/user_profile_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/service_packs/widgets/empty_data.dart';
import '../../pages/service_packs/widgets/service_pack_bottomSheet.dart';
import '../../pages/service_packs/widgets/service_pack_item.dart';
import '../../utils/color.dart';

// ignore: must_be_immutable
class ServicePackScreen extends StatelessWidget {
  static String routeName = "/ServicePackScreen";
  final controller = Get.put(ServicePackController());
  final userProfileController = Get.put(UserProfileController());
  ServicePackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          footer: ClassicFooter(
            loadingText: AppLocalizations.current.loading,
            idleText: AppLocalizations.current.idleLoading,
            canLoadingText: AppLocalizations.current.canLoading,
          ),
          header: const WaterDropMaterialHeader(),
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          child: Obx(
            // ignore: unrelated_type_equality_checks
            () => userProfileController.account_signType != '1'
                ? EmptyData(
                    message: AppLocalizations.of(context)
                        .service_pack_reject_message)
                : controller.servicePackItems.isEmpty
                    ? const EmptyData(message: '')
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
                          if (index < controller.servicePackItems.length) {
                            ServicePackModel item =
                                controller.servicePackItems[index];
                            return ServicePackItem(
                              servicePackModel: item,
                              addToCart: () =>
                                  controller.addToCart(item, index),
                              removeToCart: () =>
                                  controller.removeToCart(item, index),
                            );
                          }
                          return const SizedBox(height: 150.0);
                        },
                        itemCount: controller.servicePackItems.length + 1),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 150,
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
            border: Border.all(color: HexColor("#DE9B39")),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, blurRadius: 20, spreadRadius: 1)
            ]),
        child: Obx(() => ServicePackBottomSheetItem(
            subtotalPrice: controller.subtotalPrice.value,
            subtotalSignturn: controller.subtotalSignturn.value,
            accountSignType: userProfileController.account_signType.toString(),
            onRedirectToServicePackPorder: () =>
                controller.onRedirectToServicePackPorder())),
      ),
    );
  }
}
