// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/app_config.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/utils/constants.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/auth_controller.dart';
import '../../controller/change_info_certiificate_controller.dart';
import '../../controller/extend_certificate_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../pages/certificate/change_info/select_cert_to_change_info_screen.dart';
import '../../pages/certificate/common_action.dart';
import '../../pages/certificate/detail.dart';
import '../../utils/datetime_format.dart';
import '../../widgets/app_refresh.dart';
import '../../widgets/base_text.dart';
import '../../widgets/dialog_notification.dart';

import '../../../configs/injector/injector.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/services/user_info_on_device.dart';
import '../../controller/buy_certificate_controller.dart';
import '../active_account/setup_pin_code/index.dart';
import '../buy_signature/list_package_signature/index.dart';
import '../buy_signature/select_cert/index.dart';
import 'extend/select_cert_to_extend_screen.dart';

class CertificatePage extends StatelessWidget {
  final AppRefreshController appRefreshController = AppRefreshController();

  final BuyCertificateController buyCertificateController =
      Get.put(BuyCertificateController());
  final ExtendCertificateController extendCertificateController =
      Get.put(ExtendCertificateController());
  final ChangeInfoCertificateController changeInfoCertificateController =
      Get.put(ChangeInfoCertificateController());
  final secureStorage = getIt<SecureLocalStorageService>();

  @override
  Widget build(BuildContext context) {
    List<CertificateModel> listCert = [];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BaseText(
          AppLocalizations.current.certificate,
          color: Color(0xff08285C),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CertificateMenuWidget(
                        asset: Assets.images.icBuyCts.path,
                        label: AppLocalizations.current.buyCTS,
                        onTap: () async {
                          // kiem tra tai khoan ca nhan hay doanh nghiep
                          bool isIndividualAccount =
                              await extendCertificateController
                                  .checkIndividualOrBusinessesAccount(
                                      AppLocalizations.current.buyCTS);
                          if (!isIndividualAccount) {
                            return;
                          }
                          // dang ky lan dau, pass ekyc
                          buyCertificateController.getListOrder(listCert);
                        }),
                    _CertificateMenuWidget(
                        asset: Assets.images.icBuySignatures.path,
                        label: AppLocalizations.current.buySignatures,
                        onTap: () {
                          // FILTER LISTCERT
                          List<CertificateModel> listCertOK = listCert
                              .where((i) =>
                                  i.status == 0 && i.orderInfo?.signType == 1)
                              .toList();
                          if (listCertOK.length == 1) {
                            Get.to(() => ListPackageSignaturePage(
                                certModel: listCertOK[0]));
                          } else {
                            Get.to(() => SelectCertPage(listCert: listCertOK));
                          }
                        }),
                    _CertificateMenuWidget(
                        asset: Assets.images.icExtend.path,
                        label: AppLocalizations.current.extend,
                        onTap: () async {
                          // kiem tra tai khoan ca nhan hay doanh nghiep
                          bool isIndividualAccount =
                              await extendCertificateController
                                  .checkIndividualOrBusinessesAccount(
                                      AppLocalizations.current.extend);
                          if (!isIndividualAccount) {
                            return;
                          }

                          // trang thai hoat dong hoac het han
                          List<CertificateModel> listCertOK = [];
                          try {
                            listCertOK = listCert
                                .where((i) => i.isValidOrExpired())
                                .toList();
                          } catch (e) {
                            listCertOK = [];
                          }
                          if (listCertOK.isEmpty) {
                            // khong the gia han vi khong co CTS hop le
                            Get.dialog(
                              DialogNotification(
                                title: AppLocalizations
                                    .current.can_not_extend_cert,
                                content: AppLocalizations
                                    .current.can_not_extend_cert_description,
                                // image: image,
                                onlyActionAccept: true,
                                titleBtnAccept: AppLocalizations.current.agree,
                              ),
                            );
                          } else {
                            if (listCertOK.length == 1) {
                              // chuyen sang man chon goi cuoc luon
                              extendCertificateController
                                  .handleCert(listCertOK.first);
                            } else {
                              Get.to(() => SelectCertToExtendScreen());
                            }
                          }
                        }),
                    _CertificateMenuWidget(
                        asset: Assets.images.icChangeInfo.path,
                        label: AppLocalizations.current.changeInfo,
                        onTap: () async {
                          // kiem tra tai khoan ca nhan hay doanh nghiep
                          bool isIndividualAccount =
                              await extendCertificateController
                                  .checkIndividualOrBusinessesAccount(
                                      AppLocalizations.current.changeInfo);
                          if (!isIndividualAccount) {
                            return;
                          }
                          // trang thai hoat dong
                          List<CertificateModel> listCertOK = [];
                          try {
                            listCertOK =
                                listCert.where((i) => i.isValid()).toList();
                          } catch (e) {
                            listCertOK = [];
                          }
                          if (listCertOK.isEmpty) {
                            // khong the gia han vi khong co CTS hop le
                            Get.dialog(
                              DialogNotification(
                                content: AppLocalizations
                                    .current.no_exist_cert_valid,
                                // image: image,
                                onlyActionAccept: true,
                                titleBtnAccept: AppLocalizations.current.agree,
                              ),
                            );
                          } else {
                            if (listCertOK.length == 1) {
                              // chuyen sang man chon goi cuoc luon
                              changeInfoCertificateController
                                  .handleCert(listCertOK.first);
                            } else {
                              Get.to(() => SelectCertToChangeInfoScreen());
                            }
                          }
                          // showNotifyModal(
                          //     AppLocalizations.current.featureDevelopment);
                        }),
                    // _CertificateMenuWidget(
                    //     asset: Assets.images.icRecall.path, label: AppLocalizations.current.recall, onTap: () {}),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: AppRefresh<CertificateModel>(
                    // path: "/ssa/sic/list",
                    path: "/certcms/cert/list",
                    keyController: "/ssa/sic/list_certificate_index",
                    fromMap: CertificateModel.fromMap,
                    itemWidgetBuilder: (value, index) {
                      // if (value.statusDesc == AppLocalizations.current.waitingApprove) {
                      //   return SizedBox();
                      // }
                      if (value.canShowMaDonHang()) {
                        return _CertificateItemWidgetV2(
                            certificateModel: value,
                            appRefreshController: appRefreshController);
                      }
                      return _CertificateItemWidget(
                        certificateModel: value,
                        appRefreshController: appRefreshController,
                      );
                    },
                    getListData: (listData) {
                      listCert = listData;
                    },
                    appRefreshController: appRefreshController,
                    isShowViewMore: false,
                    isLoadMore: false,
                    itemSpace: 20,
                    params: {
                      // "FieldName": "device.deviceName",
                      "FieldName": "createdDate",
                      "IsDesc": true
                    },
                    listPadding: const EdgeInsets.only(bottom: 16),
                    wrapMargin: const EdgeInsets.only(top: 16),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => buyCertificateController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox())
        ],
      ),
    );
  }
}

class _CertificateMenuWidget extends StatelessWidget {
  final String asset;
  final String label;
  final Function onTap;

  const _CertificateMenuWidget(
      {required this.asset, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 42,
            height: 42,
            fit: BoxFit.fill,
            package: AppConfig.package,
          ),
          SizedBox(height: 4),
          BaseText(
            label,
            textAlign: TextAlign.center,
            color: Color(0xff08285C),
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}

enum _CertificateStatus { active, waiting, expired }

class _CertificateItemWidget extends StatelessWidget {
  // final _CertificateStatus status;
  // final String name;
  // final String dueDate;
  // final String serialNumber;

  final CertificateModel certificateModel;
  final AppRefreshController appRefreshController;
  final controller = Get.find<AuthController>();

  _CertificateItemWidget(
      {required this.certificateModel, required this.appRefreshController});

  final secureLocalDataSource = getIt<SecureLocalStorageService>();
  final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

  _getBackgroundImage() {
    if (certificateModel.status == 0) {
      return Assets.images.icCertificateBackgroundBlue.path;
    } else if (certificateModel.status == 1 ||
        certificateModel.status == 2 ||
        certificateModel.status == 3 ||
        certificateModel.status == 7) {
      return Assets.images.icCertificateBackgroundYellow.path;
    } else if (certificateModel.status == 4) {
      return Assets.images.icCertificateBackgroundRed.path;
    } else {
      return Assets.images.icCertificateBackgroundYellow.path;
    }
  }

  _getTextStatus() {
    // if (status == _CertificateStatus.active) {
    //   return AppLocalizations.current.active;
    // } else if (status == _CertificateStatus.waiting) {
    //   return AppLocalizations.current.waitingForActivation;
    // } else {
    //   return AppLocalizations.current.expired;
    // }
    return certificateModel.statusDesc;
  }

  _getTextStatusColor() {
    if (certificateModel.status == 0) {
      return const Color(0xff4870BA);
    } else if (certificateModel.status == 1 ||
        certificateModel.status == 2 ||
        certificateModel.status == 3 ||
        certificateModel.status == 7) {
      return const Color(0xffFF9900);
    } else if (certificateModel.status == 4) {
      return const Color(0xffE51F1F);
    } else {
      return const Color(0xffFF9900);
    }

    // if (status == _CertificateStatus.active) {
    //   return const Color(0xff4870BA);
    // } else if (status == _CertificateStatus.waiting) {
    //   return const Color(0xffFF9900);
    // } else {
    //   return const Color(0xffE51F1F);
    // }
  }

  _refreshListCert() async {
    try {
      appRefreshController.listHide =
          await secureLocalDataSource.getLastData(HIDE_CERT_LIST);
      appRefreshController.refresh();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (certificateModel.isWaitingActive) {
          if (certificateModel.isNeedAssignKey) {
            Get.to(() => SetupPinCodePage(
                  certificateModel: certificateModel,
                ))?.then((value) async {
              _refreshListCert();
            });
          } else {
            CommonActionCertificate.goActiveCer(certificateModel,
                callBackGetTo: () {
              _refreshListCert();
            });
          }
        } else {
          Get.to(
            () => CertificateDetail(
              title: AppLocalizations.current.certDetail,
              certificateModel: certificateModel,
            ),
          )?.then((value) async {
            _refreshListCert();
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
              image: AssetImage(_getBackgroundImage(), package: AppConfig.package), fit: BoxFit.cover),
          // borderRadius: BorderRadius.circular(radius)
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.icSignatureBackground.path, package: AppConfig.package),
                fit: BoxFit.cover),
            // borderRadius: BorderRadius.circular(radius)
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: BaseText(
                    certificateModel.refName ??
                        controller.currentUser.value?.displayName,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  )),
                  Container(
                    // width: 100,
                    margin: EdgeInsets.only(left: 4),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: BaseText(
                      _getTextStatus(),
                      color: _getTextStatusColor(),
                      fontSize: 11,
                      // height: 20 / 11,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11),
              Row(children: [
                BaseText(
                  AppLocalizations.current.validity,
                  color: Colors.white,
                  fontSize: 12.5,
                ),
                SizedBox(width: 14),
                BaseText(
                  (certificateModel.validFrom == null ||
                          certificateModel.validTo == null)
                      ? ""
                      : "${DatetimeFormat().formatDate(certificateModel.validFrom.toString())} - ${DatetimeFormat().formatDate(certificateModel.validTo.toString())}",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )
              ]),
              SizedBox(height: 11),
              BaseText(
                AppLocalizations.current.serialNumber,
                color: Colors.white,
                fontSize: 12.5,
              ),
              BaseText(
                certificateModel.serial ?? "",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 11),
              Row(children: [
                BaseText(
                  AppLocalizations.current.package,
                  color: Colors.white,
                  fontSize: 12.5,
                ),
                SizedBox(width: 14),
                BaseText(
                  certificateModel.certProfile?.pricingName ??
                      certificateModel.orderInfo?.pricingName ??
                      "",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )
              ]),
              // Row(
              //   children: [
              //     Expanded(child: Container()),
              //     Assets.images.icArrowRight.image(
              //         width: 16,
              //         height: 16,
              //         fit: BoxFit.fill,
              //         color: Colors.white)
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class _CertificateItemWidgetV2 extends StatelessWidget {
  // final _CertificateStatus status;
  // final String name;
  // final String dueDate;
  // final String serialNumber;

  final CertificateModel certificateModel;
  final AppRefreshController appRefreshController;

  _CertificateItemWidgetV2(
      {required this.certificateModel, required this.appRefreshController});

  final secureLocalDataSource = getIt<SecureLocalStorageService>();
  final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

  _getBackgroundImage() {
    if (certificateModel.status == 0) {
      return Assets.images.icCertificateBackgroundBlue.path;
    } else if (certificateModel.status == 1 ||
        certificateModel.status == 2 ||
        certificateModel.status == 3 ||
        certificateModel.status == 7) {
      return Assets.images.icCertificateBackgroundYellow.path;
    } else if (certificateModel.status == 4) {
      return Assets.images.icCertificateBackgroundRed.path;
    } else {
      return Assets.images.icCertificateBackgroundYellow.path;
    }
  }

  _getTextStatus() {
    // if (status == _CertificateStatus.active) {
    //   return AppLocalizations.current.active;
    // } else if (status == _CertificateStatus.waiting) {
    //   return AppLocalizations.current.waitingForActivation;
    // } else {
    //   return AppLocalizations.current.expired;
    // }
    return certificateModel.statusDesc;
  }

  _getTextStatusColor() {
    if (certificateModel.status == 0) {
      return const Color(0xff4870BA);
    } else if (certificateModel.status == 1 ||
        certificateModel.status == 2 ||
        certificateModel.status == 3 ||
        certificateModel.status == 7) {
      return const Color(0xffFF9900);
    } else if (certificateModel.status == 4) {
      return const Color(0xffE51F1F);
    } else {
      return const Color(0xffFF9900);
    }

    // if (status == _CertificateStatus.active) {
    //   return const Color(0xff4870BA);
    // } else if (status == _CertificateStatus.waiting) {
    //   return const Color(0xffFF9900);
    // } else {
    //   return const Color(0xffE51F1F);
    // }
  }

  _refreshListCert() async {
    try {
      appRefreshController.listHide =
          await secureLocalDataSource.getLastData(HIDE_CERT_LIST);
      appRefreshController.refresh();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return InkWell(
      onTap: () async {
        if (certificateModel.isWaitingActive) {
          if (certificateModel.isNeedAssignKey) {
            Get.to(() => SetupPinCodePage(
                  certificateModel: certificateModel,
                ))?.then((value) async {
              _refreshListCert();
            });
          } else {
            CommonActionCertificate.goActiveCer(certificateModel,
                callBackGetTo: () {
              _refreshListCert();
            });
          }
        } else {
          Get.to(
            () => CertificateDetail(
              title: AppLocalizations.current.certDetail,
              certificateModel: certificateModel,
            ),
          )?.then((value) async {
            _refreshListCert();
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_getBackgroundImage(), package: AppConfig.package), fit: BoxFit.fill),
          // borderRadius: BorderRadius.circular(radius)
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.icSignatureBackground.path, package: AppConfig.package),
                fit: BoxFit.fill),
            // borderRadius: BorderRadius.circular(radius)
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: BaseText(
                    certificateModel.refName ??
                        controller.currentUser.value?.displayName,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  )),
                  Container(
                    // width: 100,
                    margin: EdgeInsets.only(left: 4),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: BaseText(
                      _getTextStatus(),
                      color: _getTextStatusColor(),
                      fontSize: 11,
                      // height: 20 / 11,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11),
              BaseText(
                AppLocalizations.current.orderCode,
                color: Colors.white,
                fontSize: 12,
              ),
              BaseText(
                certificateModel.orderInfo?.paymentId ?? "",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 11),
              BaseText(
                AppLocalizations.current.orderDate,
                color: Colors.white,
                fontSize: 12,
              ),
              BaseText(
                certificateModel.orderInfo?.createdDate ?? "",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Assets.images.icArrowRight.image(
                      width: 16,
                      height: 16,
                      fit: BoxFit.fill,
                      color: Colors.white)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
