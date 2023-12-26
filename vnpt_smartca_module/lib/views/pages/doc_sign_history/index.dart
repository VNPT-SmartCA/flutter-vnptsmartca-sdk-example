// ignore_for_file: prefer_const_constructors, prefer_function_declarations_over_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../core/models/request/history_request_model.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../gen/assets.gen.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../widgets/app_refresh.dart';
import '../../widgets/dialog/modal_bottom_sheet.dart';
import '../../widgets/widget.dart';
import '../../../core/extensions/datetime.dart';

import '../home/widgets/doc_sign_history.dart';

class ListDocSignHistoryPage extends StatefulWidget {
  final CertificateModel? certificateModel;

  const ListDocSignHistoryPage({Key? key, this.certificateModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListDocSignatureHistoryState();
}

class _ListDocSignatureHistoryState extends State<ListDocSignHistoryPage> {
  final AppRefreshController appRefreshController = AppRefreshController();
  HistoryRequestModel historyRequestModel =
      HistoryRequestModel(order: 'InitialDate', isDesc: true);
  var keySearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: AppLocalizations.current.docSignatureHistory,
        body: Container(
          color: const Color(0xFFF4F6FB),
          child: Column(
            children: [
              // renderFilter(),
              // Container(
              //   height: 4,
              //   color: AppColors.white,
              // ),
              Expanded(
                child: AppRefresh<TransactionModel>(
                  path: "/csc/signature/his",
                  fromMap: TransactionModel.fromMap,
                  headerBuilder: (int? length) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                      child: RichText(
                        text: TextSpan(
                          text: AppLocalizations.of(context).result,
                          style: TextStyle(
                            color: Color(0xff08285C),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  " ${AppLocalizations.of(context).totalResult(length ?? 0)}",
                              style: TextStyle(
                                color: Color(0xff44507B),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  params: historyRequestModel.toMap(),
                  appRefreshController: appRefreshController,
                  itemWidgetBuilder: (value, index) {
                    return DocSignatureHistoryWidget(value: value);
                  },
                  isLoadMore: true,
                  itemSpace: 8,
                ),
              )
            ],
          ),
        ));
  }

  final inputDecoration = (String hintText,
          {Widget? suffixIcon, Color? fillColor, bool enabled = true}) =>
      InputDecoration(
          isDense: true,
          labelText: hintText,
          enabled: enabled,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(12),
          labelStyle: const TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
          hintStyle: const TextStyle(color: Color(0xffA5B0C2), fontSize: 14),
          fillColor: fillColor ?? Color(0xffF2F6FA),
          suffixIconConstraints: BoxConstraints(maxWidth: 40),
          suffixIcon: suffixIcon);

  renderFilter() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          FormBuilderTextField(
            name: "",
            onSubmitted: (value) {
              setState(() {
                historyRequestModel.keySearch = value;
              });
            },
            controller: keySearchController,
            textInputAction: TextInputAction.done,
            decoration: inputDecoration(
              AppLocalizations.current.inputNameDoc,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Assets.images.icSearch.image(width: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () {
                  showDialogFilter().then((value) {
                    if (value is HistoryRequestModel) {
                      setState(() {
                        historyRequestModel = value;
                        keySearchController.text =
                            this.historyRequestModel.keySearch ?? "";
                      });
                    }
                  });
                },
                child: Row(
                  children: [
                    Assets.images.icFilter.image(width: 20),
                    const SizedBox(width: 10),
                    BaseText(
                      AppLocalizations.of(context).searchAdvance,
                      color: const Color(0xff0D75D6),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Container(
                  child: AppButtonWidget(
                    label: AppLocalizations.of(context).search,
                    onTap: () {
                      setState(() {});
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget renderBaseTextInput({required String title, required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: BaseText(
              title,
              color: Color(0xff08285C),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          child
        ],
      ),
    );
  }

  Future showDialogFilter() {
    HistoryRequestModel historyRequestModel = HistoryRequestModel(
        order: this.historyRequestModel.order,
        fromDate: this.historyRequestModel.fromDate,
        toDate: this.historyRequestModel.toDate,
        isDesc: this.historyRequestModel.isDesc,
        keySearch: keySearchController.text,
        certificateModel: this.historyRequestModel.certificateModel);

    var startDateController =
        TextEditingController(text: historyRequestModel.fromDate?.fromDate());
    var endDateController =
        TextEditingController(text: historyRequestModel.toDate?.fromDate());
    var textSeachController =
        TextEditingController(text: historyRequestModel.keySearch ?? "");
    var cerController = TextEditingController(
        text: historyRequestModel.certificateModel?.serial ?? "");
    return CustomBottomSheetDialog.show(
        isScrollControlled: true,
        title: AppLocalizations.of(context).searchAdvance,
        childBuilder: (context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                renderBaseTextInput(
                    title: AppLocalizations.of(context).nameDoc,
                    child: TextField(
                      controller: textSeachController,
                      onChanged: (text) {
                        historyRequestModel.keySearch = text;
                      },
                      onSubmitted: (value) {},
                      textInputAction: TextInputAction.done,
                      decoration: inputDecoration(
                        AppLocalizations.current.inputNameDoc,
                      ),
                    )),
                // TODO @nambuidanh hanlde select cer
                renderBaseTextInput(
                  title: AppLocalizations.of(context).certificate,
                  child: InkWell(
                    onTap: () {},
                    child: TextField(
                      enabled: false,
                      controller: cerController,
                      textInputAction: TextInputAction.done,
                      decoration: inputDecoration(
                          AppLocalizations.of(context).selectCertificate,
                          suffixIcon: Container(
                              color: Color(0xffF2F6FA),
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff5768A5),
                                size: 20,
                              ))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: renderBaseTextInput(
                        title: AppLocalizations.of(context).fromDate,
                        child: InkWell(
                          onTap: () {
                            CustomBottomSheetDialog.showDatePicker(context,
                                    lastDate: historyRequestModel.toDate,
                                    initialDate: historyRequestModel.fromDate)
                                .then((value) {
                              if (value != null) {
                                historyRequestModel.fromDate = value;
                                startDateController.text =
                                    historyRequestModel.fromDate?.fromDate() ??
                                        "";
                              }
                            });
                          },
                          child: TextField(
                            enabled: false,
                            controller: startDateController,
                            textInputAction: TextInputAction.done,
                            decoration: inputDecoration(
                                AppLocalizations.of(context).selectDate,
                                suffixIcon: Container(
                                    margin: EdgeInsets.only(right: 4),
                                    child: Assets.images.icCalendar
                                        .image(width: 20))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: renderBaseTextInput(
                        title: AppLocalizations.of(context).toDate,
                        child: InkWell(
                          onTap: () {
                            CustomBottomSheetDialog.showDatePicker(context,
                                    firstDate: historyRequestModel.fromDate,
                                    initialDate: historyRequestModel.toDate)
                                .then((value) {
                              if (value != null) {
                                historyRequestModel.toDate = value;
                                endDateController.text =
                                    historyRequestModel.toDate?.fromDate() ??
                                        "";
                              }
                            });
                          },
                          child: TextField(
                            enabled: false,
                            controller: endDateController,
                            textInputAction: TextInputAction.done,
                            decoration: inputDecoration(
                                AppLocalizations.of(context).selectDate,
                                suffixIcon: Container(
                                    margin: EdgeInsets.only(right: 4),
                                    child: Assets.images.icCalendar
                                        .image(width: 20))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AppButtonWidget(
                  label: AppLocalizations.of(context).search,
                  onTap: () {
                    Navigator.pop(context, historyRequestModel);
                  },
                ),
              ],
            ),
          );
        });
  }
}
