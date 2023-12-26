import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../controller/service_pack_order_history_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/service_packs/widgets/empty_order.dart';
import '../../pages/service_packs/widgets/order_history_item.dart';
import '../../widgets/base_screen.dart';

// ignore: must_be_immutable
class ServicePackOrderHistoryScreen extends StatelessWidget {

  final controller = Get.put(ServicePackOrderHistoryController());

  ServicePackOrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.order_history_page_title,
      body: Obx(
        () => SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          footer: ClassicFooter(
            loadingText: AppLocalizations.current.loading,
            idleText: AppLocalizations.current.idleLoading,
            canLoadingText: AppLocalizations.current.canLoading,
          ),
          header: const WaterDropMaterialHeader(),
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoadMore,
          child: controller.servicePackHistoryItems.value.isEmpty
              ? const EmptyOrder()
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      centerTitle: false,
                      title: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).totalRecord(controller.totalItemCount),
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
                          ),
                          const Spacer(),
                          Text(
                            '${controller.currentPage}/${controller.pageCount}',
                            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => OrderHistoryItem(
                          index: index,
                          orderHistoryItem: controller.servicePackHistoryItems[index],
                          pricings: controller.servicePackHistoryItems[index].pricings!,
                          reReInitializeOrder: (id) => controller.reReInitializeOrders(id),
                        ),
                        childCount: controller.servicePackHistoryItems.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
