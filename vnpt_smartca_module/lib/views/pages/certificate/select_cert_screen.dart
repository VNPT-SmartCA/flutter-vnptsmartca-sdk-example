// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnpt_smartca_module/core/models/app/smartca_message_result.dart';
import 'package:vnpt_smartca_module/core/models/response/token_model.dart';
import 'package:vnpt_smartca_module/method_channel_handler.dart';
import 'package:vnpt_smartca_module/views/controller/app_controller.dart';
import 'package:vnpt_smartca_module/views/widgets/navigator_helper.dart';
import '../../../configs/app_config.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../gen/assets.gen.dart';
import '../../controller/auth_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../../utils/datetime_format.dart';
import '../../utils/enums.dart';
import '../../widgets/app_refresh.dart';
import '../../widgets/base_screen.dart';
import '../../widgets/base_text.dart';

import '../../../configs/injector/injector.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/services/user_info_on_device.dart';
import '../../../core/utils/constants.dart';
import 'detail.dart';

class SelectCertScreen extends StatelessWidget {
  final bool isSystemLink;

  SelectCertScreen({super.key, this.isSystemLink = false});

  final AppRefreshController appRefreshController = AppRefreshController();

  onSendDataNative(String certId) async {
    // await getIt<SecureLocalStorageService>().saveData(CREDENTIAL_ID_KEY, certId);
    final methodChannelHandler = getIt<MethodChannelHandler>();
    final tokenString =
    await getIt<SecureLocalStorageService>().getLastData(LOCAL_ACCESS_TOKEN_AUTH);
    if (tokenString != null && tokenString.isNotEmpty) {
      TokenModel token = TokenModel.fromJson(tokenString);
      SmartCaResult data = SmartCaResult(
          ResultCode.SUCCESS_CODE,
          ResultCodeDesc.SUCCESS,
          jsonEncode({
            'accessToken': token.accessToken,
            'credentialId': certId,
          }));

      methodChannelHandler.send(
        method: MethodChannelNames.getAuthenticationResult,
        data: data,
      );
      NavigatorHandler.closeSDK();
    }
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.selectCertificate,
      hiddenIconBack: Get.find<AppController>().currentHostAppMethod.value ==
          MethodChannelNames.getAuthentication,
      body: Column(
        children: [
          isSystemLink || Get.find<AppController>().currentHostAppMethod.value ==
              MethodChannelNames.getAuthentication
              ? SizedBox(height: 15)
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16),
                  child: BaseText(
                    AppLocalizations.current.changeDeviceDescription,
                    height: 24 / 14,
                    color: const Color(0xff08285C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
          Expanded(
            child: AppRefresh<CertificateModel>(
              path: "/certcms/cert/list",
              getListData: (data) async {},
              fromMap: CertificateModel.fromMap,
              itemWidgetBuilder: (value, index) {
                if ((isSystemLink && value.certProfile?.isEseal() == true) ||
                    (!isSystemLink &&
                        value.typeStatus == StatusCertEnum.VALID)) {
                  return _CertificateItemWidget(
                    certificateModel: value,
                    appRefreshController: appRefreshController,
                  );
                } else {
                  return const SizedBox();
                }
              },
              filter: (value) {
                return value.typeStatus == StatusCertEnum.VALID;
              },
              params: {"FieldName": "createdDate", "IsDesc": true},
              // appRefreshController: appRefreshController,
              // isShowViewMore: true,
              isLoadMore: false,
              itemSpace: 20,
              listPadding:
                  const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              // wrapMargin: const EdgeInsets.only(top: 16),
            ),
          )
        ],
      ),
    );
  }
}

class _CertificateItemWidget extends StatelessWidget {
  // final _CertificateStatus status;
  // final String name;
  // final String dueDate;
  // final String serialNumber;

  final CertificateModel certificateModel;
  final AppRefreshController appRefreshController;

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
    appRefreshController.listHide =
        await secureLocalDataSource.getLastData(HIDE_CERT_LIST);
    appRefreshController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return InkWell(
      onTap: () async {

        var appController = Get.find<AppController>();
        if(appController.currentHostAppMethod.value == MethodChannelNames.getAuthentication) {
          final methodChannelHandler = getIt<MethodChannelHandler>();
          final tokenString =
          await getIt<SecureLocalStorageService>().getLastData(LOCAL_ACCESS_TOKEN_AUTH);
          if (tokenString != null && tokenString.isNotEmpty) {
            TokenModel token = TokenModel.fromJson(tokenString);
            SmartCaResult data = SmartCaResult(
                ResultCode.SUCCESS_CODE,
                ResultCodeDesc.SUCCESS,
                jsonEncode({
                  'accessToken': token.accessToken,
                  'credentialId': certificateModel.id,
                }));

            methodChannelHandler.send(
              method: MethodChannelNames.getAuthenticationResult,
              data: data,
            );
            NavigatorHandler.closeSDK();
          }
          return;
        }
        ///
        Get.to(
          () => CertificateDetail(
            title: AppLocalizations.current.certDetail,
            certificateModel: certificateModel,
          ),
        )?.then((value) async {
          _refreshListCert();
        });
        // if (certificateModel.isWaitingActive) {
        //   CommonActionCertificate.goActiveCer(certificateModel);
        // } else {
        //   Get.to(
        //         () => CertificateDetail(
        //       title: controller.fullName.value,
        //       certificateModel: certificateModel,
        //     ),
        //   )?.then((value) async {
        //     appRefreshController.listHide = await secureLocalDataSource.getLastData(HIDE_CERT_LIST);
        //     appRefreshController.refresh();
        //   });
        // }
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
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    certificateModel.refName ??
                        controller.currentUser.value!.displayName,
                    color: Colors.white,
                    height: 24 / 14,
                    fontWeight: FontWeight.w700,
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
              SizedBox(height: 12),
              Row(children: [
                BaseText(
                  AppLocalizations.current.validity,
                  color: Colors.white,
                  fontSize: 12.5,
                  height: 24 / 12,
                ),
                SizedBox(width: 14),
                BaseText(
                  (certificateModel.validFrom == null ||
                          certificateModel.validTo == null)
                      ? ""
                      : "${DatetimeFormat().formatDate(certificateModel.validFrom.toString())} - ${DatetimeFormat().formatDate(certificateModel.validTo.toString())}",
                  color: Colors.white,
                  height: 24 / 14,
                  fontWeight: FontWeight.w700,
                )
              ]),
              SizedBox(height: 12),
              BaseText(
                AppLocalizations.current.serialNumber,
                color: Colors.white,
                fontSize: 12.5,
                height: 24 / 12,
              ),
              BaseText(
                "${certificateModel.serial}",
                color: Colors.white,
                height: 24 / 14,
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
