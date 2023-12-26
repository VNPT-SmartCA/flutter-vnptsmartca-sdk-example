// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/home_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/icon_extension_file.dart';
import '../../../widgets/dialog/common_dialog.dart';

import '../../active_account/generate_cer_key/index.dart';

class ViewDocumentList extends StatelessWidget {
  final TransactionModel transactionModel;
  late bool isSuccess;
  final HomeController homeController;

  ViewDocumentList(
      {super.key,
      required this.transactionModel,
      required this.homeController}) {
    isSuccess = transactionModel.tranStatus == 1;
    if (isSuccess) {
      homeController.transactionRequestController
          .getTransInfor(transactionModel.tranId);
    }
  }

  renderList(List<dynamic> docs) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Row(
            children: [
              Text("${AppLocalizations.current.affiliateApplication}:"),
              SizedBox(width: 6),
              Expanded(
                  child: Text(
                transactionModel.appName,
                overflow: TextOverflow.visible,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Row(
            children: [
              Text("${AppLocalizations.current.status}:"),
              SizedBox(width: 6),
              Expanded(
                  child: Text(
                transactionModel.textStatus,
                overflow: TextOverflow.visible,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
            ],
          ),
        ),
        Expanded(
            child: ListView.separated(
                primary: true,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        bool isSignHash = transactionModel.isSignHash();
                        if (isSignHash) {
                          showNotifyModal(
                              AppLocalizations.current.viewFileHash);
                          return;
                        }
                        bool isSuccess = transactionModel.tranStatus == 1;

                        if (isSuccess) {
                          final file = homeController
                              .transactionRequestController
                              .listFile
                              .value[index];
                          homeController.transactionRequestController
                              .onPreviewDocument(file);
                        } else {
                          showNotifyModal(
                              AppLocalizations.current.notSupportViewFile);
                        }
                      },
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: ExtensionTypeIcon.extensionTypeIcon(
                                      docs[index]["type"])),
                              SizedBox(height: 1),
                              Text(
                                docs[index]["size"],
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  transactionModel.docs[index]["name"],
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    // color: Color(0xff0D75D6),
                                  ),
                                )),
                          ),
                          SizedBox(width: 8),
                          if (isSuccess)
                            InkWell(
                              onTap: () {
                                homeController.transactionRequestController
                                    .onShareFile(homeController
                                        .transactionRequestController
                                        .listFile
                                        .value[index]);
                              },
                              child: Assets.images.icShare.image(
                                  width: 22, height: 22, fit: BoxFit.fill),
                            )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(height: 1),
                    ),
                itemCount: docs.length))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.6,
        child: isSuccess
            ? Obx(() => homeController
                        .transactionRequestController.transactionInfo.value !=
                    null
                ? renderList(homeController
                    .transactionRequestController.transactionInfo.value!.docs)
                : Center(
                    child: InfoNotifyWidget(
                        margin: const EdgeInsets.only(top: 50, bottom: 40),
                        content: AppLocalizations.current.progressProcessing,
                        image: Assets.images.loading.path),
                  ))
            : renderList(transactionModel.docs));
  }
}
