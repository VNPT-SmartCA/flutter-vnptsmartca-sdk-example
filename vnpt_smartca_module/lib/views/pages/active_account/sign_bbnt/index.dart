// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../configs/injector/injector.dart';
import '../../../../core/models/app/exceptions.dart';
import '../../../../core/models/app/file_model.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../../core/services/biometrics.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../theme/styles.dart';
import '../../../utils/enums.dart';
import '../../../utils/exception_handler.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/button_general.dart';
import '../../../widgets/dialog/common_dialog.dart';
import '../../../widgets/dialog/enter_pin_for_dialog.dart';
import '../bottom_contact.dart';
import '../generate_cer_key/index.dart';
import '../header_step.dart';

class SignAcceptanceView extends StatefulWidget {
  final String credentialId;

  const SignAcceptanceView({Key? key, required this.credentialId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignAcceptance();
}

class SignAcceptance extends State<SignAcceptanceView> {
  final transController = Get.find<HomeController>();
  final authenController = Get.find<AuthController>();
  final biometricService = getIt<BiometricsService>();

  @override
  void initState() {
    super.initState();
    transController.transactionRequestController.getBbntTrans(widget.credentialId);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.activateButton,
      body: Column(
        children: [
          HeaderStep(
            step: 3,
            customImageStep: Assets.images.stepThreeNew,
          ),
          Expanded(child: Obx(() {
            return renderBody();
          })),
          const BottomContact()
        ],
      ),
    );
  }

  renderBody() {
    if (transController.transactionRequestController.transactionInfo.value != null) {
      return showTranInfor(transController.transactionRequestController.transactionInfo.value!);
    } else if (transController.isLoading.value) {
      return Center(
        child: InfoNotifyWidget(
            margin: const EdgeInsets.only(top: 50, bottom: 40),
            content: AppLocalizations.current.progressProcessing,
            image: Assets.images.icDialogNotice.path),
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
    FileModel fileModel =
        FileModel(name: element['name'], size: element['size'], data: element['data'], file: File(""), path: "");
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
          ButtonGeneral(
              backgroundColor: const Color(0xff0D75D6),
              borderColor: Colors.transparent,
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
              title: AppLocalizations.current.signConfirm,
              // ignore: prefer-extracting-callbacks
              onCallBack: () {
                if (authenController.currentUser.value?.useBiometric == true) {
                  transController.transactionRequestController
                      .useBiometricWithTransaction(TransactionType.confirm, item);
                } else {
                  _showPINDialog();
                }
              }),
        ],
      ),
    );
  }

  void _showPINDialog() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            child: EnterPINDialog(
              description: AppLocalizations.current.pinDialogConfirmSignDigitalTitle,
              buttonText: AppLocalizations.current.pinDialogButton,
              buttonColor: Color(0xff0D75D6),
              callback: (pin) => transController.transactionRequestController
                  .confirmWaitingTransaction(pin, transController.transactionRequestController.transactionInfo.value!),
            ),
          );
        });
  }

  @override
  void dispose() {
    transController.dispose();
    super.dispose();
  }
}

class PdfPreviewerWidget extends StatefulWidget {
  final String fileName;
  final String fileData;
  final String fileUrl;
  final bool showPagination;

  const PdfPreviewerWidget({
    Key? key,
    required this.fileName,
    required this.fileData,
    required this.fileUrl,
    this.showPagination = true,
  }) : super(key: key);

  @override
  _PdfPreviewerWidgetState createState() => _PdfPreviewerWidgetState();
}

class _PdfPreviewerWidgetState extends State<PdfPreviewerWidget> {
  bool _isLoading = true;
  late String filePath;
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    // ignore: avoid-unnecessary-setstate
    _loadDocument();
  }

  @override
  void didUpdateWidget(covariant PdfPreviewerWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _loadDocument();
  }

  void _loadDocument() async {
    await _writeData2Pdf(widget.fileData);
    setState(() => _isLoading = false);
  }

  _writeData2Pdf(String text) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      filePath = '${directory.path}/file.pdf';

      final File file = File(filePath);
      Uint8List bytes = base64.decode(text);

      await file.writeAsBytes(bytes);
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          // border: Border.all(width: 1, color: Color(0xffC9CED7)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: SfPdfViewerTheme(
                    data: SfPdfViewerThemeData(backgroundColor: Colors.white),
                    child: SfPdfViewer.file(
                      File(filePath),
                      controller: _pdfViewerController,
                      onDocumentLoaded: (event) => {setState(() => _isLoading = false)},
                    ),
                  ),
                ),
                widget.showPagination
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            constraints: BoxConstraints(maxHeight: 36),
                            icon: Icon(Icons.keyboard_arrow_left),
                            onPressed: _pdfViewerController.previousPage,
                          ),
                          AppStyles.pdl10,
                          Text(
                            '${_pdfViewerController.pageNumber}/${_pdfViewerController.pageCount}',
                          ),
                          AppStyles.pdl10,
                          IconButton(
                            constraints: BoxConstraints(maxHeight: 36),
                            icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: _pdfViewerController.nextPage,
                          )
                        ],
                      )
                    : Container(),
              ],
            ),
    );
  }
}
