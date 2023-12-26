import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/models/app/file_model.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/home_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/active_account/generate_cer_key/index.dart';
import '../../pages/active_account/sign_bbnt/index.dart';
import '../../widgets/base_screen.dart';

class DetailDocSignaturePage extends StatelessWidget {
  final transController = Get.find<HomeController>();
  final TransactionModel transactionModel;

  DetailDocSignaturePage({super.key, required this.transactionModel}) {
    transController.transactionRequestController
        .getTransInfor(transactionModel.tranId);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.detailDocSignature,
      body: Expanded(
        child: Obx(() {
          return renderBody();
        }),
      ),
    );
  }

  renderBody() {
    if (transController.transactionRequestController.transactionInfo.value !=
        null) {
      return showTranInfor(
          transController.transactionRequestController.transactionInfo.value!);
    } else if (transController.isLoading.value) {
      return Center(
        child: InfoNotifyWidget(
            margin: const EdgeInsets.only(top: 50, bottom: 40),
            content: AppLocalizations.current.progressProcessing,
            image: Assets.images.loading.path),
      );
    }
    return Container();
  }

  // ignore: long-method
  Widget showTranInfor(TransactionModel item) {
    var lstDocs = item.docs;
    if (lstDocs.isEmpty) {
      return Container();
    }
    var element = lstDocs.first;
    FileModel? fileModel = FileModel.fromDoc(element);
    if (fileModel == null) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PdfPreviewerWidget(
              fileName: fileModel.name,
              fileData: fileModel.data,
              fileUrl: '',
              showPagination: false,
            ),
          ),
        ],
      ),
    );
  }
}
