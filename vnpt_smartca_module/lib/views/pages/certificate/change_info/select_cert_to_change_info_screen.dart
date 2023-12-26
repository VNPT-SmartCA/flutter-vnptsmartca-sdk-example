import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../configs/app_config.dart';
import '../../../controller/extend_certificate_controller.dart';
import '../../../widgets/app_refresh.dart';
import '../../../widgets/base_loading.dart';

import '../../../../configs/injector/injector.dart';
import '../../../utils/datetime_format.dart';
import '../../../../core/models/response/certificate_model.dart';
import '../../../../core/services/secure_local_storage.dart';
import '../../../../core/services/user_info_on_device.dart';
import '../../../../gen/assets.gen.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/change_info_certiificate_controller.dart';
import '../../../i18n/generated_locales/l10n.dart';
import '../../../utils/enums.dart';
import '../../../widgets/base_screen.dart';
import '../../../widgets/base_text.dart';

class SelectCertToChangeInfoScreen extends StatelessWidget {
  final AppRefreshController appRefreshController = AppRefreshController();

  SelectCertToChangeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: AppLocalizations.current.selectCertificate,
      loadingWidget: const BaseLoading<ExtendCertificateController>(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: BaseText(
              AppLocalizations.current.select_cert_to_change_info,
              height: 24 / 14,
              color: const Color(0xff08285C),
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: AppRefresh<CertificateModel>(
              path: "/certcms/cert/list",
              keyController: "/ssa/sic/list_certificate_select_to_change_info",
              fromMap: CertificateModel.fromMap,
              itemWidgetBuilder: (value, index) {
                if (value.typeStatus == StatusCertEnum.VALID) {
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
              params: const {"FieldName": "createdDate", "IsDesc": true},
              // appRefreshController: appRefreshController,
              // isShowViewMore: true,
              isLoadMore: false,
              itemSpace: 20,
              listPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
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

  _CertificateItemWidget({required this.certificateModel, required this.appRefreshController});

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
      onTap: () {
        ChangeInfoCertificateController changeInfoCertificateController = Get.find<ChangeInfoCertificateController>();
        changeInfoCertificateController.handleCert(certificateModel);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(_getBackgroundImage(), package: AppConfig.package), fit: BoxFit.fill),
          // borderRadius: BorderRadius.circular(radius)
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.images.icSignatureBackground.path, package: AppConfig.package), fit: BoxFit.fill),
            // borderRadius: BorderRadius.circular(radius)
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: BaseText(
                       certificateModel.refName ?? controller.currentUser.value?.displayName,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
                  Container(
                    // width: 100,
                    margin: const EdgeInsets.only(left: 4),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
              const SizedBox(height: 14),
              BaseText(
                AppLocalizations.current.validity,
                color: Colors.white,
                fontSize: 12,
              ),
              BaseText(
                (certificateModel.validFrom == null || certificateModel.validTo == null)
                    ? ""
                    : "${DatetimeFormat().formatDate(certificateModel.validFrom.toString())} - ${DatetimeFormat().formatDate(certificateModel.validTo.toString())}",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 14),
              BaseText(
                AppLocalizations.current.serialNumber,
                color: Colors.white,
                fontSize: 12,
              ),
              BaseText(
                certificateModel.serial ?? "",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Assets.images.icArrowRight.image(width: 16, height: 16, fit: BoxFit.fill, color: Colors.white)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
