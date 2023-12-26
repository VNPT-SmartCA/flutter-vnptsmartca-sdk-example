import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/district_model.dart';
import '../../../core/models/app/identity_card_model.dart';
import '../../../core/models/app/nationality_model.dart';
import '../../../core/models/app/province_model.dart';
import '../../../core/models/app/purchase_cert_order_item_model.dart';
import '../../../core/models/app/purchase_certificate_model.dart';
import '../../../core/models/app/wards_model.dart';
import '../../../data/repository/authen_repository.dart';
import '../../../data/repository/purchase_certificate_repository.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/input_otp/index.dart';
import '../pages/register_account/certificate_pack_screen.dart';
import '../pages/register_account/sandboxpayment_screen.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/response/order_cert_model.dart';
import 'base_controler.dart';

class EnterInfoController extends BaseController {
  final purchaseCertificateRepository = getIt<PurchaseCertificateRepository>();
  final authRepository = getIt<AuthenRepository>();

  var lstProvinces = List<ProvinceModel>.empty().obs;
  var lstDistricts = List<DistrictModel>.empty().obs;
  var lstWards = List<WardsModel>.empty().obs;

  var lstIdentityCards = List<IdentityCardModel>.empty().obs;
  var lstNationalitys = List<NationalityModel>.empty().obs;

  TextEditingController txtHotenController = TextEditingController();
  TextEditingController txtSoCCCDController = TextEditingController();
  TextEditingController txtLoaiGiayToController = TextEditingController();
  TextEditingController txtQuocTichController = TextEditingController();
  TextEditingController txtNgayCapController = TextEditingController();
  TextEditingController txtNoiCapController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPhoneController = TextEditingController();
  TextEditingController txtProvinceController = TextEditingController();
  TextEditingController txtDistrictController = TextEditingController();
  TextEditingController txtWardController = TextEditingController();
  TextEditingController txtAddressController = TextEditingController();
  TextEditingController txtReferrerCodeController = TextEditingController();

  GlobalKey<FormBuilderState> formKey1 = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formKey2 = GlobalKey<FormBuilderState>();

  // use for cert package list
  GlobalKey<FormBuilderState> formKey3 = GlobalKey<FormBuilderState>();

  // user for ma gioi thieu
  GlobalKey<FormBuilderState> formKey4 = GlobalKey<FormBuilderState>();

  // lưu lại lần đầu tiên
  final Rx<List<PurchaseCertificateModel>> listCertPacksFirst = Rx<List<PurchaseCertificateModel>>([]);

  // for show ui
  final Rx<List<PurchaseCertificateModel>> listCertPacks = Rx<List<PurchaseCertificateModel>>([]);

  final RefreshController refreshController = RefreshController();
  List<CertPackFilterModel> currentFilterModels = [];
  String currentKeyword = "";

  RxBool isPaymentSuccess = false.obs;

  @override
  onInit() {
    super.onInit();
    lstIdentityCards.value = identityCards;
    lstNationalitys.value = nationalities;
  }

  getProvince() async {
    try {
      final result = await purchaseCertificateRepository.getProvince();
      result.fold((l) => null, (r) {
        lstProvinces.value = List.from(r).map((e) => ProvinceModel.fromJson(e)).toList();
      });
      result.toString();
    } catch (e) {}
  }

  getDistrict(String? provinceId) async {
    try {
      final result = await purchaseCertificateRepository.getDistrict(provinceId!);
      result.fold((l) => null, (r) {
        lstDistricts.value = List.from(r).map((e) => DistrictModel.fromJson(e)).toList();
      });
      result.toString();
    } catch (e) {
      e.toString();
    }
  }

  getWards(String? provinceId, String? districtId) async {
    try {
      final result = await purchaseCertificateRepository.getWards(provinceId!, districtId!);
      result.fold((l) => null, (r) {
        lstWards.value = List.from(r).map((e) => WardsModel.fromJson(e)).toList();
      });
      result.toString();
    } catch (e) {
      e.toString();
    }
  }

  Future<List<IdentityCardModel>> getIdentityCardTypeSuggestions(String query) async {
    return lstIdentityCards.where((item) {
      final nameLower = item.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  Future<List<NationalityModel>> getNationalitySuggestions(String query) async {
    return lstNationalitys.where((item) {
      final nameLower = item.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  Future<List<ProvinceModel>> getProvinceSuggestions(String query) async {
    return lstProvinces.where((province) {
      final nameLower = province.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  Future<List<DistrictModel>> getDistrictsSuggestions(String query) async {
    return lstDistricts.where((district) {
      final nameLower = district.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  Future<List<WardsModel>> getWardSuggestions(String query) async {
    return lstWards.where((wards) {
      final nameLower = wards.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  String? validateIdentityCardType(String? value) {
    if (GetUtils.isBlank(value) == true) {
      return AppLocalizations.current.certificate_package_validate_input_error;
    } else {
      String? msg = validCharacters(value);
      if (msg != null && msg.isNotEmpty) return msg;

      msg = checkNameExistence(lstIdentityCards, value);
      if (msg.isNotEmpty) return msg;
    }
    return null;
  }

  String? validateNationality(String? value) {
    if (GetUtils.isBlank(value) == true) {
      return AppLocalizations.current.certificate_package_validate_input_error;
    } else {
      String? msg = validCharacters(value);
      if (msg != null && msg.length > 0) return msg;

      msg = checkNameExistence(lstNationalitys, value);
      if (msg.isNotEmpty) return msg;
    }
    return null;
  }

  String? validateProvinces(String? value) {
    if (GetUtils.isBlank(value) == true) {
      return AppLocalizations.current.certificate_package_validate_input_error;
    } else {
      String? msg = validCharacters(value);
      if (msg != null && msg.isNotEmpty) return msg;

      msg = checkNameExistence(lstProvinces, value);
      if (msg.isNotEmpty) return msg;
    }
    return null;
  }

  String? validateDistricts(String? value) {
    if (GetUtils.isBlank(value) == true) {
      return AppLocalizations.current.certificate_package_validate_input_error;
    } else {
      String? msg = validCharacters(value);
      if (msg != null && msg.isNotEmpty) return msg;

      msg = checkNameExistence(lstDistricts, value);
      if (msg.isNotEmpty) return msg;
    }
    return null;
  }

  String? validateWards(String? value) {
    if (GetUtils.isBlank(value) == true) {
      return AppLocalizations.current.certificate_package_validate_input_error;
    } else {
      String? msg = validCharacters(value);
      if (msg != null && msg.isNotEmpty) return msg;

      msg = checkNameExistence(lstWards, value);
      if (msg.isNotEmpty) return msg;
    }
    return null;
  }

  //Kiểm tra xem có ký tự đặc biệt hợp lệ không
  String? validCharacters(String? value) {
    final nameRegExp = RegExp(r'[!@#$%\^*()+=\\[\]\\;{}|\\":<>\?]'); //new RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (nameRegExp.hasMatch(value!)) {
      return AppLocalizations.current.certificate_package_validate_input_special_error;
    }
    return null;
  }

  //Kiểm tra giá trị nhập trong dropdown
  String checkNameExistence(dynamic list, String? value) {
    return list.any((x) => x.name == value) ? "" : AppLocalizations.current.pleaseSelectDataInList;
  }

  @override
  void dispose() {
    txtQuocTichController.dispose();
    txtHotenController.dispose();
    txtSoCCCDController.dispose();
    txtLoaiGiayToController.dispose();
    txtQuocTichController.dispose();
    txtNgayCapController.dispose();
    txtNoiCapController.dispose();
    txtEmailController.dispose();
    txtPhoneController.dispose();
    txtProvinceController.dispose();
    txtDistrictController.dispose();
    txtWardController.dispose();
    txtAddressController.dispose();
    txtReferrerCodeController.dispose();
    super.dispose();
  }

  Future sendOTP(String citizenId, String phoneNumber, CardInfo cardInfo) async {
    showLoading();
    final result = await authRepository.sendOTP(citizenId, phoneNumber);

    result.fold((failure) {
      showErrorModal(exceptionHandler(failure));
    }, (r) {
      _goToInputOTP(citizenId, phoneNumber, cardInfo);
    });
    hideLoading();
  }

  _goToInputOTP(String citizenId, String phoneNumber, CardInfo cardInfo) {
    Get.to(() => InputOTPPage(
          phoneNumber: phoneNumber,
          citizenId: citizenId,
          inputOTPType: InputOTPType.register,
        ))?.then((value) {
      if (value == true) {
        Get.to(() => CertificatePackScreen(cardInfo: cardInfo, listCerts: []));
      }
    });
  }

  Future<void> fetchItems({bool isRefresh = false}) async {
    if (isRefresh == false) {
      currentFilterModels = [];
      currentKeyword = "";
      showLoading();
    }
    final result = await purchaseCertificateRepository.getCertPackages();
    List<PurchaseCertificateModel> listData = [];
    result.fold((failure) => showErrorModal(exceptionHandler(failure)), (r) {
      listData = List.from(r).map((e) => PurchaseCertificateModel.fromJson(e)).toList();
      listCertPacksFirst.value = listData;
    });
    if (isRefresh == false) {
      listCertPacks.value = listData;
    } else {
      if (currentFilterModels.isEmpty) {
        listCertPacks.value = listData;
      } else {
        listCertPacks.value =
            listCertPacksFirst.value.where((e) => _checkFilterSignTypeAndTimeValid(currentFilterModels, e)).toList();
      }
      if (currentKeyword.isNotEmpty) {
        listCertPacks.value = listCertPacks.value
            .where(
                (element) => element.pricingName != null && element.pricingName!.toLowerCase().contains(currentKeyword))
            .toList();
      }
    }
    if (isRefresh == false) {
      hideLoading();
    } else {
      refreshController.refreshCompleted();
    }
  }

  bool _checkFilterSignTypeAndTimeValid(
      List<CertPackFilterModel> filterModels, PurchaseCertificateModel purchaseCertificateModel) {
    List<CertPackFilterModel> listFilterModelBySignType = [];
    List<CertPackFilterModel> listFilterModelByTimeValid = [];
    for (CertPackFilterModel certPackFilterModel in filterModels) {
      if (certPackFilterModel.month < 0) {
        listFilterModelBySignType.add(certPackFilterModel);
      } else {
        listFilterModelByTimeValid.add(certPackFilterModel);
      }
    }

    bool signTypeValid = listFilterModelBySignType.isEmpty
        ? true
        : listFilterModelBySignType.any((element) => element.code == purchaseCertificateModel.signType);
    bool timeValid = listFilterModelByTimeValid.isEmpty
        ? true
        : listFilterModelByTimeValid.any((element) => element.month == purchaseCertificateModel.timeValidity);

    return signTypeValid && timeValid;
  }

  filter(List<CertPackFilterModel> filterModels) {
    currentFilterModels = filterModels;
    if (listCertPacksFirst.value.isEmpty) {
      return;
    }
    if (filterModels.isEmpty || (filterModels.length == 1 && filterModels[0].code == -1)) {
      listCertPacks.value = listCertPacksFirst.value;
    } else {
      listCertPacks.value =
          listCertPacksFirst.value.where((e) => _checkFilterSignTypeAndTimeValid(filterModels, e)).toList();
    }
    if (listCertPacks.value.isEmpty) {
      return;
    }
    // filter by keyword
    if (currentKeyword.isNotEmpty) {
      listCertPacks.value = listCertPacks.value
          .where(
              (element) => element.pricingName != null && element.pricingName!.toLowerCase().contains(currentKeyword))
          .toList();
    }
  }

  // filter by keyword
  filterByString(String value) {
    currentKeyword = value;
    if (listCertPacksFirst.value.isEmpty) {
      return;
    }
    if (currentKeyword.isEmpty) {
      listCertPacks.value = listCertPacksFirst.value;
    } else {
      listCertPacks.value = listCertPacksFirst.value
          .where(
              (element) => element.pricingName != null && element.pricingName!.toLowerCase().contains(currentKeyword))
          .toList();
    }
    if (listCertPacks.value.isEmpty) {
      return;
    }
    if (currentFilterModels.isNotEmpty) {
      listCertPacks.value =
          listCertPacks.value.where((e) => _checkFilterSignTypeAndTimeValid(currentFilterModels, e)).toList();
    }
  }

  // payment
/*
    nvtruong: Hàm thanh toán đơn hàng (hàm này sẽ connect api qua vnpt dưới dạng webview)
   */

  Future<void> paymentOrderV2(OrderCertModel orderCertModel, bool isFree, String? raCode) async {
    isPaymentSuccess.value = false;
    final items = {"pricingCode": orderCertModel.pricing.pricingCode};
    saveServiceOrder(items, isFree, orderCertModel, raCode);
  }

  Future<void> saveServiceOrder(dynamic dataItems, bool isFree, OrderCertModel cardInfo, String? raCode) async {
    showLoading();

    final obj = await initCertOrderTransaction(cardInfo.id, raCode ?? "");
    hideLoading();
    if (obj['url'].length == 0) {
      hideLoading();
      showErrorModal(obj['msg'], callback: () {
        Get.back();
      });
      return;
    }

    try {
      // try parse to order model
      OrderCertModel orderCertModel = OrderCertModel.fromJson(obj['url']);
      Get.back(result: orderCertModel);
      return;
    } catch (e) {
      // todo
    }

    var result = await Get.to(
      () => SandboxPaymentScreen(cardInfo: cardInfo),
      arguments: {"url": obj['url'].toString()},
    );
    if (result == null) {
      hideLoading();
      showErrorModal(AppLocalizations.current.orderPAYMENT_ERROR, callback: () {
        Get.back();
      });
    }
  }

  //Gọi hàm tích hợp thanh toán
  Future<dynamic> initCertOrderTransaction(String id, String maGt) async {
    var returnData = {};
    try {
      final result = await purchaseCertificateRepository.initPersonalCertificateOrderTransaction(id, maGt);
      await result.fold((failure) {
        showErrorModal(exceptionHandler(failure), callback: () {
          Get.back();
        });
      }, (r) async {
        if (r != null) {
          returnData = {'msg': '', 'url': r};
        } else {
          returnData = {'msg': AppLocalizations.current.service_pack_payment_failed, 'url': ''};
        }
      });
    } catch (e) {
      returnData = {'msg': AppLocalizations.current.serviceSomethingWentWrong, 'url': ''};
    }
    return returnData;
  }

  /*
    nvtruong: Hàm kiểm tra thanh toán đơn hàng (hàm này sẽ connect api qua vnpt dưới dạng webview)
   */
  // ignore: long-method
  Future<void> checkOrderPaymentResult(String id, String responseCode, String secureCode, String? LocalityCode) async {
    showLoading();
    try {
      final result = await purchaseCertificateRepository.checkOrderPaymentResult(
          '', id, responseCode, secureCode, LocalityCode ?? "");

      await result.fold((failure) {
        showErrorModal(exceptionHandler(failure), callback: () {
          Get.back();
        });
      }, (r) async {
        if (r != null) {
          Get.back(result: ""); // back to loading
          isPaymentSuccess.value = true;
          Get.back(result: true); // back to buy cert controller
        } else {
          showErrorModal(AppLocalizations.current.orderPAYMENT_ERROR, callback: () {
            Get.back();
          });
        }
      });
    } catch (e) {
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong, callback: () {
        Get.back();
      });
    }
    hideLoading();
  }
}
