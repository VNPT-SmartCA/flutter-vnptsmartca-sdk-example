// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../core/models/app/exceptions.dart';
import '../../../../../core/models/app/file_model.dart';
import '../../../../theme/styles.dart';
import '../../../../utils/exception_handler.dart';
import '../../../../widgets/base_screen.dart';
import '../../../../widgets/dialog/common_dialog.dart';

class PreviewPDfAcceptance extends StatelessWidget {
  const PreviewPDfAcceptance({
    Key? key,
    required this.file,
  }) : super(key: key);
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: file.name.replaceAll(".pdf", ""),
      body: PdfPreviewerDialog(
        fileName: file.name,
        fileData: file.data,
        fileUrl: '',
      ),
    );
  }
}

class PdfPreviewerDialog extends StatefulWidget {
  final String fileName;
  final String fileData;
  final String fileUrl;
  final bool showPagination;

  const PdfPreviewerDialog({
    Key? key,
    required this.fileName,
    required this.fileData,
    required this.fileUrl,
    this.showPagination = true,
  }) : super(key: key);

  @override
  _PdfPreviewerDialogState createState() => _PdfPreviewerDialogState();
}

class _PdfPreviewerDialogState extends State<PdfPreviewerDialog> {
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
    return SafeArea(
      top: false,
      child: Container(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: SfPdfViewer.file(
                      File(filePath),
                      controller: _pdfViewerController,
                      onDocumentLoaded: (event) => {setState(() => _isLoading = false)},
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
      ),
    );
  }
}
