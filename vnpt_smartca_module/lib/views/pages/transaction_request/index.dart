// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../views/controller/transaction_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/transaction_request/widgets/transaction_list_header.dart';
import '../../../views/pages/transaction_request/widgets/transaction_request_item.dart';
import '../../../views/widgets/base_text.dart';
import '../../../views/widgets/empty_data.dart';

import '../../controller/home_controller.dart';

class TransactionRequests extends GetView<TransactionController> {
  static String routeName = "/TransactionRequests";
  final homeController = Get.find<HomeController>();

  TransactionRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
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
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.transactionRequestGroupList.isEmpty
                    ? const EmptyData()
                    : ListView.separated(
                        itemCount:
                            controller.transactionRequestGroupList.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12.0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          String credentialId = controller
                              .transactionRequestGroupList.keys
                              .elementAt(index);
                          List itemTransaction = controller
                              .transactionRequestGroupList[credentialId]!;
                          final numberCertificate =
                              (index + 1).toString().padLeft(2, "0");
                          // Return a widget representing the category and its items
                          String? certName;
                          if (homeController.listCertificate.value != null) {
                            certName = homeController.listCertificate.value
                                ?.firstWhere(
                                    (element) => element.id == credentialId)
                                .refName;
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              controller.transactionRequestGroupList.length > 1
                                  ? Divider(thickness: 1.0)
                                  : SizedBox.shrink(),
                              SizedBox(height: 8.0),
                              BaseText(
                                certName ??
                                    AppLocalizations.of(context)
                                        .transaction_request_group_title(
                                            numberCertificate),
                                color: Color(0xff08285C),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                              SizedBox(height: 8.0),
                              TransactionListHeader(
                                  transactionCount: itemTransaction.length,
                                  credentialId: credentialId),
                              ListView.separated(
                                  padding: EdgeInsets.only(top: 12),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 12.0);
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    TransactionModel item =
                                        itemTransaction[index];
                                    return TransactionRequestItem(
                                      transactionModel: item,
                                      clockTimer:
                                          controller.buildCountdown(item),
                                      tranDesc: item.tranDesc,
                                    );
                                  },
                                  itemCount: itemTransaction.length)
                            ],
                          );
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
