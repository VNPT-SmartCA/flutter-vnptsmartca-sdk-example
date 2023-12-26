// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/app_config.dart';
import '../../../../configs/injector/injector.dart';
import '../../../../core/extensions/datetime_format.dart';
import '../../../../core/models/response/certificate_model.dart';
import '../../../../core/services/secure_local_storage.dart';
import '../../../../core/services/user_info_on_device.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/auth_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';
import '../list_package_signature/index.dart';

class SelectCertPage extends StatelessWidget {
  final List<CertificateModel> listCert;

  const SelectCertPage({super.key, required this.listCert});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.selectCertificate,
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        color: Colors.white,
        child: listCert.isEmpty
            ? BaseText(
                AppLocalizations.current.youCanNotBuySignature,
                textAlign: TextAlign.justify,
                color: Color(0xffF51313),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    AppLocalizations.current.selectCertToSign,
                    color: Color(0xff5768A5),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 16),
                      itemBuilder: (_, index) {
                        return _CertificateItemWidget(
                          certificateModel: listCert[index],
                        );
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(height: 20);
                      },
                      itemCount: listCert.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CertificateItemWidget extends StatelessWidget {
  final CertificateModel certificateModel;

  _CertificateItemWidget({required this.certificateModel});

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
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return InkWell(
      onTap: () async {
        Get.to(() => ListPackageSignaturePage(certModel: certificateModel));
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_getBackgroundImage(), package: AppConfig.package), fit: BoxFit.contain),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.icSignatureBackground.path, package: AppConfig.package),
                fit: BoxFit.fill),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
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
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              BaseText(
                AppLocalizations.current.validity,
                color: Colors.white,
                fontSize: 12,
                height: 24 / 12,
              ),
              BaseText(
                (certificateModel.validFrom == null ||
                        certificateModel.validTo == null)
                    ? ""
                    : "${DatetimeFormat().formatDate(certificateModel.validFrom.toString())} - ${DatetimeFormat().formatDate(certificateModel.validFrom.toString())}",
                color: Colors.white,
                height: 24 / 14,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 14),
              BaseText(
                AppLocalizations.current.serialNumber,
                color: Colors.white,
                fontSize: 12,
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
                  Expanded(
                      child: Container(
                    height: 16,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
