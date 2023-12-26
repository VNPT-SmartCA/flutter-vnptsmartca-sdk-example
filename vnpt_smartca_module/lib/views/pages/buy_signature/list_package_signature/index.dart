// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/models/response/certificate_model.dart';
import '../../../../core/models/response/service_pack_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/service_pack_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/common.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';
import '../order_confirmation/index.dart';

class ListPackageSignaturePage extends StatefulWidget {
  final CertificateModel certModel;

  const ListPackageSignaturePage({Key? key, required this.certModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListPackageSignatureState();
}

class ListPackageSignatureState extends State<ListPackageSignaturePage> {
  final controller = Get.put(ServicePackController());
  List<ServicePackModel> listPackage = [];
  int indexPackageSelected = -1;
  int totalMoney = 0;
  int totalTurnSignature = 0;

  @override
  void initState() {
    super.initState();
    controller.getListPackageSignatures(widget.certModel);
  }

  @override
  Widget build(BuildContext context) {
    controller.servicePackItems.listen((model) {
      if (model.isNotEmpty) {
        setState(() {
          listPackage = model;
          for (var package in listPackage) {
            if (package.priceType == 1 && package.signTurnNumber < 50) {
              package.signTurnNumber = 50;
            }
          }
        });
      }
    });
    return BaseScreen(
      title: AppLocalizations.current.infoBuySignature,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        color: Color(0xffF5F7FB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 16),
                itemBuilder: (_, index) {
                  return CertPackageViewWidget(
                    packageModel: listPackage[index],
                    isSelected: index == indexPackageSelected,
                    onTap: () {
                      if (index != indexPackageSelected) {
                        indexPackageSelected = index;
                        calculationMoney();
                      }
                    },
                    onTapAdd: () {
                      if (listPackage[index].signTurnNumber < 1000) {
                        listPackage[index].signTurnNumber += 1;
                        calculationMoney();
                      }
                    },
                    onTapSubtraction: () {
                      if (listPackage[index].signTurnNumber > 50) {
                        listPackage[index].signTurnNumber -= 1;
                        calculationMoney();
                      }
                    },
                  );
                },
                separatorBuilder: (_, index) {
                  return SizedBox(height: 16);
                },
                itemCount: listPackage.length,
              ),
            ),
            indexPackageSelected >= 0
                ? Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffE7F1FB),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xff0D75D6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          AppLocalizations.current.service_pack_total_amount,
                          color: Color(0xff5768A5),
                          fontSize: 16,
                        ),
                        SizedBox(height: 10),
                        BaseText(
                          Common.formatPrice(totalMoney),
                          color: Color(0xff0D75D6),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: BaseText(
                                AppLocalizations.current.totalNumberSignatures(totalTurnSignature),
                                color: Color(0xff5768A5),
                              ),
                            ),
                            BaseText(
                              AppLocalizations.current.included10VAT,
                              color: Color(0xff5768A5),
                              fontStyle: FontStyle.italic,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        AppButtonWidget(
                          label: AppLocalizations.current.Continue,
                          doublePadding: 15,
                          onTap: () {
                            Get.to(() => OrderConfirmationPage(packageModel: listPackage[indexPackageSelected]));
                          },
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  void calculationMoney() {
    totalMoney = listPackage[indexPackageSelected].priceType == 0
        ? listPackage[indexPackageSelected].price
        : listPackage[indexPackageSelected].price * listPackage[indexPackageSelected].signTurnNumber;
    totalTurnSignature = listPackage[indexPackageSelected].signTurnNumber ?? 0;
    setState(() {});
  }
}

class CertPackageViewWidget extends StatelessWidget {
  final ServicePackModel packageModel;
  final Function? onTap;
  final bool isSelected;
  final Function? onTapAdd;
  final Function? onTapSubtraction;
  final bool showBill;

  const CertPackageViewWidget({
    super.key,
    required this.packageModel,
    this.onTap,
    this.isSelected = false,
    this.onTapAdd,
    this.onTapSubtraction,
    this.showBill = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffE7F1FB) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: BaseText(
              packageModel.priceType == 1
                  ? "${AppLocalizations.current.package} ${packageModel.name} -  ${AppLocalizations.current.signatureOption}"
                  : "${AppLocalizations.current.package} ${packageModel.name} - ${packageModel.signTurnNumber} ${AppLocalizations.current.service_pack_signatures.toLowerCase()}",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xff0D75D6),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 14,
                height: 14,
                child: Stack(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      color: isSelected ? Color(0xffE7F1FB) : Colors.white,
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F7FB),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  color: isSelected ? Color(0xffE7F1FB) : Colors.white,
                  height: 14,
                  alignment: Alignment.center,
                  child: Assets.images.icLine.image(fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(
                width: 14,
                height: 14,
                child: Stack(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      color: isSelected ? Color(0xffE7F1FB) : Colors.white,
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F7FB),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffE7F1FB) : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11),
                bottomRight: Radius.circular(11),
              ),
            ),
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.quantity,
                      color: Color(0xff5768A5),
                    ),
                    (!showBill && packageModel.priceType == 1)
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (isSelected) {
                                    onTapSubtraction?.call();
                                  }
                                },
                                child: Assets.images.icSubtraction.image(width: 32, fit: BoxFit.fitWidth),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 44,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Color(0xffCBCFD7)),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: BaseText(
                                    packageModel.signTurnNumber.toString(),
                                    color: Color(0xff08285C),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  if (isSelected) {
                                    onTapAdd?.call();
                                  }
                                },
                                child: Assets.images.icAdd.image(width: 32, fit: BoxFit.fitWidth),
                              )
                            ],
                          )
                        : BaseText(
                            //packageModel.signTurnNumber,
                            "01",
                            fontWeight: FontWeight.w600,
                            color: Color(0xff08285C),
                          )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.price,
                      color: Color(0xff5768A5),
                    ),
                    BaseText(
                      "${Common.formatPrice(packageModel.price)}/${packageModel.priceType == 1 ? AppLocalizations.current.luot.toLowerCase() : AppLocalizations.current.package.toLowerCase()}",
                      fontWeight: FontWeight.w600,
                      color: Color(0xff08285C),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      AppLocalizations.current.money,
                      color: Color(0xff5768A5),
                    ),
                    BaseText(
                      Common.formatPrice(
                        packageModel.priceType == 0
                            ? packageModel.price
                            : packageModel.price * packageModel.signTurnNumber,
                      ),
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0D75D6),
                    )
                  ],
                ),
                SizedBox(height: 13),
              ],
            ),
          )
        ],
      ),
    );
  }
}
