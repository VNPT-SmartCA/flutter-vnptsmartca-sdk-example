// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vnpt_smartca_module/core/models/response/service_response.dart';
import 'package:vnpt_smartca_module/views/controller/app_controller.dart';
import 'package:vnpt_smartca_module/views/pages/account_information/verify_otp_update.dart';
import 'package:vnpt_smartca_module/views/widgets/dialog_notification.dart';
import '../../../configs/injector/injector.dart';
import '../../../core/models/app/device_info.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/app/purchase_cert_order_item_model.dart';
import '../../../core/models/request/ekyc_customer.dart';
import '../../../core/models/request/ekyc_result_model.dart';
import '../../../core/models/response/certificate_model.dart';
import '../../../core/models/response/order_cert_model.dart';
import '../../../core/models/response/profile_model.dart';
import '../../../core/services/device_info.dart';
import '../../../core/services/ekyc_service.dart';
import '../../../core/services/secure_local_storage.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/enums.dart';
import '../../../data/repository/order_cert_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../gen/assets.gen.dart';
import '../../../views/controller/auth_controller.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/controller/econtract_controller.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/certificate/buy/order_list_screen.dart';
import '../../../views/pages/certificate/buy/sign_doc_error_screen.dart';
import '../../../views/pages/certificate/buy/sign_doc_waiting_screen.dart';
import '../../../views/pages/certificate/buy/verify_info_error_screen.dart';
import '../../../views/pages/certificate/buy/verify_info_screen.dart';
import '../../../views/pages/certificate/extend/confirm_cert_pack_extend_screen.dart';
import '../../../views/pages/certificate/extend/sign_ticket_extend_error.dart';
import '../../../views/pages/change_device/sign_bill.dart';
import '../pages/register_account/certificate_pack_screen.dart';
import '../../../views/utils/enums.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/dialog/common_dialog.dart';

import '../../core/models/response/user_address.dart';
import '../../core/services/user_info_on_device.dart';
import '../pages/active_account/generate_cer_key/index.dart';
import '../pages/active_account/setup_pin_code/index.dart';
import '../pages/certificate/buy/order_processing_screen.dart';
import '../pages/certificate/buy/verify_address_screen.dart';
import '../pages/certificate/buy/verify_otp_screen.dart';
import '../pages/certificate/buy/wait_for_accept_screen.dart';
import '../pages/certificate/buy/waiting_for_accept_cert_screen.dart';
import '../pages/register_account/confirm_cert_pack_screen.dart';

class BuyCertificateController extends BaseController {
  final orderCertRepository = getIt<OrderCertRepository>();
  final userRepository = getIt<UserRepository>();

  final secureStorage = getIt<SecureLocalStorageService>();
  final _deviceInfoService = getIt<DeviceInfoService>();

  // eContractController
  final eContractController = Get.put(ContractController());
  final authController = Get.find<AuthController>();

  final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

  var orderCertItems = List<OrderCertModel>.empty().obs;

  int ekycErrorCount = 0;
  String uid = "";
  bool isFlowRegister = false;

  bool cancelLoop = false;

  Rx<UserAddress?> userAddress = Rx(null);
  EKYCService ekycService = EKYCService();
  final checkSuccessUpdate = Rx<SmartCAApiResponse?>(null);

  // Rx<OrderCertModel?> currentOrderCertModel = Rx(null);

  void getListOrder(List<CertificateModel> listCerts) async {
    showLoading();
    try {
      final failureOrVerified = await orderCertRepository.getOrderList();
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) async {
          try {
            OrderCertListModel orderCertListModel =
            OrderCertListModel.fromMap(result.content);
            orderCertItems.value = orderCertListModel.items;

            String? profileString =
            await secureStorage.getLastData(LOCAL_USER_PROFILE);
            ProfileModel profileModel =
            ProfileModel.fromJson(jsonDecode(profileString!));

            CardInfo cardInfo = CardInfo();
            cardInfo.IDCardInfo = ItemInfo()..FullName = profileModel.fullName;
            cardInfo.Email = profileModel.email;
            cardInfo.Phone = profileModel.phone;
            cardInfo.Address = ItemAddress()..DiaChi;

            if (orderCertListModel.items.isEmpty) {
              Get.to(() => CertificatePackScreen(
                  cardInfo: cardInfo, listCerts: listCerts));
            } else {
              // thong bao
              showNotifyModal(AppLocalizations.current.certOrderIsExistingNotice,
                  onlyActionCancel: false,
                  titleBtnAccept: AppLocalizations.current.newRegistration,
                  titleBtnCancel: AppLocalizations.current.continueProcessing,
                  actionCancel: () {
                    // todo chuyen sang man hinh danh sach don hang
                    Get.to(() => const OrderListScreen());
                  }, actionAccept: () {
                    // dang ky moi
                    Get.to(() => CertificatePackScreen(
                        cardInfo: cardInfo, listCerts: listCerts));
                  });
            }
          } catch (e) {
            e.printError();
          }
          // userStatusModel.value = result;
        },
      );
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
  void updateInfoUserAddress(
      UserAddress userAddress) async {
    showLoading();
    try {
      final failureOrVerified =
      await orderCertRepository.updateUserAddress(userAddress);
      hideLoading();
      failureOrVerified.fold(
            (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
            (result) async {
          debugPrint(result.toString());
          showLoading();
          try {
            // uncomment after server update
            // final updateOrderAddressResponse = await orderCertRepository.updateOrderAddress(orderCertModel.id);
            // hideLoading();
            // updateOrderAddressResponse.fold((l) => showErrorModal(exceptionHandler(l)),
            //         (r) async {
            //           showLoading();
            //           try {
            //             final failureOrVerified2 = await userRepository.getProfile();
            //             hideLoading();
            //             failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
            //                     (r) {
            //                   Get.back(
            //                       result: <String, String>{"email": email, "phone": phone});
            //                 });
            //           } catch (e, s) {
            //             hideLoading();
            //             showErrorModal(
            //                 exceptionHandler(GenericException(error: e, stack: s)));
            //           }
            //     });

            // remove after server update
            final failureOrVerified2 = await userRepository.getProfile();
            hideLoading();
            failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
                    (r) {
                  Get.dialog(DialogNotification(
                    content: AppLocalizations.current.update_info_success,
                    titleBtnAccept: AppLocalizations.current.goHomeTC,
                    onlyActionAccept: true,
                    actionAccept: () {
                      final appController = Get.find<AppController>();
                      appController.backToMainPage();
                    },
                  ));
                  // Get.back();
                });
          } catch (e, s) {
            hideLoading();
            showErrorModal(
                exceptionHandler(GenericException(error: e, stack: s)));
          }

          // verifyEkyc

          // UserAddress userAddress = UserAddress.fromJson(result.content);
          // this.userAddress.value = userAddress;
        },
      );
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
  void getUserAddress(TextEditingController addressController,
      TextEditingController detailAddressController) async {
    showLoading();
    try {
      final failureOrVerified = await orderCertRepository.getUserAddress();
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure), callback: () {
            Get.back();
          }),
        },
        (result) async {
          debugPrint(result.toString());
          UserAddress userAddress = UserAddress.fromJson(result.content);
          localUpdateUserAddress(
              userAddress, addressController, detailAddressController);
        },
      );
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)),
          callback: () {
        Get.back();
      });
    }
  }

  void localUpdateUserAddress(
      UserAddress userAddress,
      TextEditingController addressController,
      TextEditingController detailAddressController) {
    this.userAddress.value = userAddress;
    String provinceStr = userAddress.provinceName ?? "";
    String districtStr = userAddress.districtName ?? "";
    String wardsStr = userAddress.wardName ?? "";
    addressController.text = "$provinceStr, $districtStr, $wardsStr";

    String addressDetailStr = userAddress.streetName ?? "";
    detailAddressController.text = addressDetailStr;
  }

  void updateUserAddress(OrderCertModel orderCertModel,
      UserAddress userAddress, String email, String phone) async {
    showLoading();
    try {
      final failureOrVerified =
          await orderCertRepository.updateUserAddress(userAddress);
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) async {
          debugPrint(result.toString());
          showLoading();
          try {
            // uncomment after server update
            // final updateOrderAddressResponse = await orderCertRepository.updateOrderAddress(orderCertModel.id);
            // hideLoading();
            // updateOrderAddressResponse.fold((l) => showErrorModal(exceptionHandler(l)),
            //         (r) async {
            //           showLoading();
            //           try {
            //             final failureOrVerified2 = await userRepository.getProfile();
            //             hideLoading();
            //             failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
            //                     (r) {
            //                   Get.back(
            //                       result: <String, String>{"email": email, "phone": phone});
            //                 });
            //           } catch (e, s) {
            //             hideLoading();
            //             showErrorModal(
            //                 exceptionHandler(GenericException(error: e, stack: s)));
            //           }
            //     });

            // remove after server update
            final failureOrVerified2 = await userRepository.getProfile();
            hideLoading();
            failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
                    (r) {
                  Get.back(
                      result: <String, String>{"email": email, "phone": phone});
                });
          } catch (e, s) {
            hideLoading();
            showErrorModal(
                exceptionHandler(GenericException(error: e, stack: s)));
          }

          // verifyEkyc

          // UserAddress userAddress = UserAddress.fromJson(result.content);
          // this.userAddress.value = userAddress;
        },
      );
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  createOrder(String? pricingCode) async {
    showLoading();
    try {
      final failureOrVerified = await orderCertRepository
          .createPersonalCertificateOrder({"pricingCode": pricingCode}, "");
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) async {
          OrderCertModel orderCertModel = OrderCertModel.fromJson(result);
          // todo by order status
          // orderCertModel.status;
          handleOrderModelByStatus(orderCertModel, isFromListOrder: false);
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  Future genKey(
      String pin, bool useBiometrics, CertificateModel certificateModel) async {
    showLoading();
    try {
      // showProgress();
      hideLoading();

      // call API to send OTP
      sendOTP(
          sendAgain: false,
          useBiometrics: useBiometrics,
          certificateModel: certificateModel,
          pin: pin);

      // activeAccount(genkeySuccess);
      //emit(GenkeySuccess(  userPIN: pinDef,keyChallengeSig: base64.encode(challengeSig),kakPub: pubKey));
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  sendOTP(
      {bool sendAgain = false,
      bool? useBiometrics,
      required CertificateModel certificateModel,
      required String pin}) async {
    showLoading();
    try {
      final authController = Get.find<AuthController>();
      final currentUser = authController.currentUser.value;

      DeviceInfoModel deviceInfo = await _deviceInfoService.getDeviceInfo();
      showLoading();
      final failureOrVerified2 = await orderCertRepository.getOrderOTP({
        "Uid": currentUser?.uid ?? "",
        "Phone": currentUser?.phone ?? "",
        "DeviceId": deviceInfo.deviceId
      });
      hideLoading();
      failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)), (r) {
        if (sendAgain) {
          // nothing todo
        } else {
          // goto verify OTP screen
          Get.to(() =>
              VerifyOTPScreen(certificateModel: certificateModel, pin: pin));
        }
      });
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
  sendOTPUpdateInfo(
      {bool sendAgain = false,
        String? phone,//phone input on text
        String? email}) async {
    showLoading();
    try {
      final authController = Get.find<AuthController>();
      final currentUser = authController.currentUser.value;

      DeviceInfoModel deviceInfo = await _deviceInfoService.getDeviceInfo();
      showLoading();
      final failureOrVerified2 = await orderCertRepository.getOrderOTP({
        "Uid": currentUser?.uid ?? "",
        "Phone": currentUser?.phone,
        "DeviceId": deviceInfo.deviceId
      });
      hideLoading();
      Map<String, dynamic> map = {};
      map['DeviceId'] = deviceInfo.deviceId;
      map['Phone'] = phone;
      map['Email'] = email;
      failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)), (r) {
        if (sendAgain) {
          // nothing todo
        } else {
          // goto verify OTP screen
          authController.currentUser.value?.phone = currentUser?.phone;

          Get.to(() =>
              VerifyOTPUpdateScreen(map: map));
        }
      });
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
  void updateInfoEmailAndPhone(Map<String, dynamic> dataUpdate) async {
    showLoading();
    try {

      final failureOrVerified =
      await orderCertRepository.updateMailPhone(dataUpdate);
      hideLoading();
      failureOrVerified.fold(
            (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
            (result) async {
          checkSuccessUpdate.value = result;
          debugPrint(result.toString());
          showLoading();
          try {
            // uncomment after server update
            // final updateOrderAddressResponse = await orderCertRepository.updateOrderAddress(orderCertModel.id);
            // hideLoading();
            // updateOrderAddressResponse.fold((l) => showErrorModal(exceptionHandler(l)),
            //         (r) async {
            //           showLoading();
            //           try {
            //             final failureOrVerified2 = await userRepository.getProfile();
            //             hideLoading();
            //             failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
            //                     (r) {
            //                   Get.back(
            //                       result: <String, String>{"email": email, "phone": phone});
            //                 });
            //           } catch (e, s) {
            //             hideLoading();
            //             showErrorModal(
            //                 exceptionHandler(GenericException(error: e, stack: s)));
            //           }
            //     });

            // remove after server update
            final failureOrVerified2 = await userRepository.getProfile();
            hideLoading();
            failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
                    (r) {
                  authController.currentUser.value?.phone = dataUpdate['Phone'];
                  Get.dialog(DialogNotification(
                    content: AppLocalizations.current.update_info_success,
                    titleBtnAccept: AppLocalizations.current.goHomeTC,
                    onlyActionAccept: true,
                    actionAccept: () {
                      final appController = Get.find<AppController>();
                      appController.backToMainPage();
                    },
                  ));
                });
          } catch (e, s) {
            hideLoading();
            showErrorModal(
                exceptionHandler(GenericException(error: e, stack: s)));
          }

          // verifyEkyc

          // UserAddress userAddress = UserAddress.fromJson(result.content);
          // this.userAddress.value = userAddress;
        },
      );
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  loopCheckOrderStatus(String orderId, int status) async {
    // vong lap check trang thai cua order
    await Future.delayed(const Duration(seconds: 3));
    if (cancelLoop) {
      return;
    }
    try {
      final failureOrVerified =
          await orderCertRepository.getOrderInfo({"OrderId": orderId});
      if (cancelLoop) {
        return;
      }
      failureOrVerified.fold(
        (failure) {
          if (cancelLoop) {
            return;
          }
          loopCheckOrderStatus(orderId, status);
        },
        (result) async {
          if (cancelLoop) {
            return;
          }
          OrderCertModel orderCertModel = OrderCertModel.fromJson(result);
          if (orderCertModel.status == status) {
            // van o trang thai cho sinh hop dong, tiep tuc loop
            loopCheckOrderStatus(orderId, status);
          } else {
            orderCertModel.orderItemController?.currentOrderCertModel.value = orderCertModel;
            handleOrderModelByStatus(orderCertModel, isFromListOrder: false);
          }
          // else if (orderCertModel.status == OrderCertModel.CONTRACT_SIGN_WAITING) {
          //   // Get.back();
          //   handleOrderModelByStatus(orderCertModel, isFromListOrder: false);
          // } else {
          //   Get.back();
          //   Get.to(() => const SignDocErrorScreen());
          // }
          // handleOrderModelByStatus(orderCertModel, isFromListOrder: false);
        },
      );
    } catch (e, s) {
      if (cancelLoop) {
        return;
      }
      loopCheckOrderStatus(orderId, status);
      // showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  verifyOrderEkycCert(
      String orderId, String ekycCode, String email, String phone) async {
    showLoading();
    try {
      final failureOrVerified = await orderCertRepository
          .verifyEkycWithOrderId({
        "OrderId": orderId,
        "ekycCode": ekycCode,
        "email": email,
        "phone": phone
      });
      hideLoading();
      failureOrVerified.fold(
        (failure) => {
          showErrorModal(exceptionHandler(failure)),
        },
        (result) async {
          showLoading();
          try {
            final failureOrVerified2 = await userRepository.getProfile();
            hideLoading();
            failureOrVerified2.fold((l) => showErrorModal(exceptionHandler(l)),
                (r) {
              OrderCertModel orderCertModel = OrderCertModel.fromJson(result);
              orderCertModel.orderItemController?.currentOrderCertModel.value = orderCertModel;
              // todo by order status
              // orderCertModel.status;
              handleOrderModelByStatus(orderCertModel, isFromListOrder: false);
            });
          } catch (e, s) {
            hideLoading();
            showErrorModal(
                exceptionHandler(GenericException(error: e, stack: s)));
          }
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }

  handleOrderModelByStatus(OrderCertModel orderCertModel,
      {bool isFromListOrder = true}) async {
    if (orderCertModel.status == OrderCertModel.EKYC_WAITING) {
      // open ekyc
      try {
        eKycUserEnroll().then((value) async {
          debugPrint("result ekyc >>>>: $value");

          if (value == VerifyInfoType.error3times) {
            // back to danh sach chung thu so
            Get.back();
          } else if (value is EkycResponseModel) {
            // todo xac nhan thong tin
            String? profileString =
                await secureStorage.getLastData(LOCAL_USER_PROFILE);
            ProfileModel profileModel =
                ProfileModel.fromJson(jsonDecode(profileString!));
            Get.to(() => VerifyAddressScreen(
                  profileModel: profileModel,
              orderCertModel: orderCertModel,
                ))?.then((result) {
              if (result == true) {
                // ekyc again
                handleOrderModelByStatus(orderCertModel,
                    isFromListOrder: isFromListOrder);
              } else if (result is Map<String, String>) {
                debugPrint("abc");

                String email = result["email"] ?? "";
                String phone = result["phone"] ?? "";

                debugPrint("email: $email");
                debugPrint("phone: $phone");

                // xac thuc ekyc voi don hang
                verifyOrderEkycCert(
                    orderCertModel.id,
                    value.ekycCode,
                    profileModel.email == email ? "" : email,
                    profileModel.phone == phone ? "" : phone);
              } else {
                debugPrint("abc");
              }
            });
          } else {
            // todo nothing
          }
        });
      } catch (e) {}
    } else if (orderCertModel.status == OrderCertModel.OTP_WAITING) {
    } else if (orderCertModel.status == OrderCertModel.PAYMENT_WATING) {
      // thanh toán
      String? profileString =
          await secureStorage.getLastData(LOCAL_USER_PROFILE);
      ProfileModel profileModel =
          ProfileModel.fromJson(jsonDecode(profileString!));
      if (orderCertModel.getTypeEnum() == OrderType.newCert) {
        Get.to(() => ConfirmCertPackScreen(
          orderCertModel: orderCertModel,
          profileModel: profileModel,
        ))?.then((value) {
          if (value == true) {
            Get.to(() => const SignDocWaitingScreen());
            cancelLoop = false;
            loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
          } else if (value is OrderCertModel) {
            handleOrderModelByStatus(value, isFromListOrder: isFromListOrder);
          }
        });
      } else if (orderCertModel.getTypeEnum() == OrderType.renewCert) {
        Get.to(() => ConfirmCertPackExtendScreen(
          orderCertModel: orderCertModel,
          profileModel: profileModel,
        ))?.then((value) {
          if (value == true) {
            Get.to(() => OrderProcessingScreen(label: AppLocalizations.current.creating_extend_ticket_label, content: AppLocalizations.current.creating_extend_ticket_description));
            cancelLoop = false;
            loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
          } else if (value is OrderCertModel) {
            handleOrderModelByStatus(value, isFromListOrder: isFromListOrder);
          }
        });
      }
    } else if (orderCertModel.status ==
        OrderCertModel.CONTRACT_CREATE_WAITING) {
      // sdk eContract
      // eContractController.signedContract(orderId: orderCertModel.id);
      // if (isFromListOrder) {
      //   //
      // } else {
      if (orderCertModel.getTypeEnum() == OrderType.newCert) {
        Get.to(() => const SignDocWaitingScreen());

        // vong lap check trang thai cua order
        cancelLoop = false;
        loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
      } else if (orderCertModel.getTypeEnum() == OrderType.renewCert) {
        Get.to(() => OrderProcessingScreen(label: AppLocalizations.current.creating_extend_ticket_label, content: AppLocalizations.current.creating_extend_ticket_description));

        // vong lap check trang thai cua order
        cancelLoop = false;
        loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
      }
      // }
      // Get.to(() => const SignDocErrorScreen());
    } else if (orderCertModel.status == OrderCertModel.CONTRACT_SIGN_WAITING) {
      if (orderCertModel.getTypeEnum() == OrderType.changeDevice) {
        Get.to(() => SignBillPage(serial: orderCertModel.previousSerial, orderId: orderCertModel.id));
      } else {
        // showLoading();
        eContractController
            .signedContract(orderId: orderCertModel.dhsxkdCustomerInfo.maGd)
            .then((value) async {
          // hideLoading();
          if (eContractController.isContractSuccess.value) {
            // success
            debugPrint("success");
            if (isFromListOrder) {
              // ko can back
            } else {
              //
              Get.back();
            }
            Get.to(() =>
                WaitingForAcceptCertScreen(
                  orderCertModel: orderCertModel,
                ));
            // // delay để đợi quá trình back xong
            // await Future.delayed(const Duration(seconds: 1));
            // // todo
            // Get.to(() => OrderProcessingScreen(
            //       label: AppLocalizations.current.processingRequest,
            //       content: AppLocalizations.current.processingRequestDescription,
            //     ));
            // cancelLoop = false;
            // loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
          } else {
            if (isFromListOrder) {
              // ko can back
            } else {
              //
              Get.back();
            }
            // error
            // debugPrint("error");
            // Get.to(() => const SignDocErrorScreen());
          }
        });
      }
    } else if (orderCertModel.status == OrderCertModel.REQUESTCERT_WATING) {
      // todo
      // delay để đợi quá trình back xong
      await Future.delayed(const Duration(seconds: 1));
      Get.to(() => OrderProcessingScreen(
            label: AppLocalizations.current.processingRequest,
            content: AppLocalizations.current.processingRequestDescription,
          ));
      cancelLoop = false;
      loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
    } else if (orderCertModel.status == OrderCertModel.KEY_ASSIGN_WATING) {
      // todo pin code
      Get.to(() => SetupPinCodePage(
          // certificateModel: orderCertModel,
          ));
    } else if (orderCertModel.status == OrderCertModel.ONEBSS_SUBMIT_WAITING) {
      cancelLoop = false;
      loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
    } else if (orderCertModel.status ==
        OrderCertModel.APPROVE_REQUEST_CERT_WAITING) {
      if (!isFromListOrder) {
        Get.back();
        // delay để đợi quá trình back xong
        await Future.delayed(const Duration(seconds: 1));
        Get.to(() => OrderProcessingScreen(
              label: AppLocalizations.current.processingRequest,
              content: AppLocalizations.current.processingRequestDescription,
            ));
        cancelLoop = false;
        loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
      }
    } else if (orderCertModel.status == OrderCertModel.EKYC_ERROR) {
    } else if (orderCertModel.status == OrderCertModel.OTP_ERROR) {
    } else if (orderCertModel.status == OrderCertModel.PAYMENT_ERROR) {
      if (isFromListOrder) {
        // thanh toán ko thành công cho thanh toán lại
        String? profileString =
            await secureStorage.getLastData(LOCAL_USER_PROFILE);
        ProfileModel profileModel =
            ProfileModel.fromJson(jsonDecode(profileString!));
        if (orderCertModel.getTypeEnum() == OrderType.newCert) {
          Get.to(() => ConfirmCertPackScreen(
            orderCertModel: orderCertModel,
            profileModel: profileModel,
          ))?.then((value) {
            if (value == true) {
              Get.to(() => const SignDocWaitingScreen());
              cancelLoop = false;
              loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
            } else if (value is OrderCertModel) {
              handleOrderModelByStatus(value, isFromListOrder: isFromListOrder);
            }
          });
        } else if (orderCertModel.getTypeEnum() == OrderType.renewCert) {
          Get.to(() => ConfirmCertPackExtendScreen(
            orderCertModel: orderCertModel,
            profileModel: profileModel,
          ))?.then((value) {
            if (value == true) {
              Get.to(() => OrderProcessingScreen(label: AppLocalizations.current.creating_extend_ticket_label, content: AppLocalizations.current.creating_extend_ticket_description));
              cancelLoop = false;
              loopCheckOrderStatus(orderCertModel.id, orderCertModel.status);
            } else if (value is OrderCertModel) {
              handleOrderModelByStatus(value, isFromListOrder: isFromListOrder);
            }
          });
        }
      }
    } else if (orderCertModel.status == OrderCertModel.CONTRACT_CREATE_ERROR) {
      if (isFromListOrder) {
        // ko can back
      } else {
        //
        Get.back();
      }
      if (orderCertModel.getTypeEnum() == OrderType.renewCert) {
        Get.to(() => const SignTicketExtendError());
      } else {
        Get.to(() => const SignDocErrorScreen());
      }
    } else if (orderCertModel.status == OrderCertModel.CONTRACT_SIGN_ERROR) {
      // Get.back();
      // Get.to(() => const SignDocErrorScreen());
      if (!isFromListOrder) {
        Get.back();
        showErrorModal(AppLocalizations.current.orderCONTRACT_SIGN_ERROR);
      }
    } else if (orderCertModel.status == OrderCertModel.REQUESTCERT_ERROR) {
      if (orderCertModel.getTypeEnum() == OrderType.newCert) {
        if (!isFromListOrder) {
          Get.back();
          // showErrorModal(AppLocalizations.current.orderREQUESTCERT_ERROR);
        }
      } else if (orderCertModel.getTypeEnum() == OrderType.changeDevice) {
        Get.back();
        showErrorModal(AppLocalizations.current.orderCONTRACT_SIGN_ERROR);
      }
    } else if (orderCertModel.status == OrderCertModel.ONEBSS_SUBMIT_ERROR) {
      if (!isFromListOrder) {
        Get.back();
        // showErrorModal(AppLocalizations.current.orderONEBSS_SUBMIT_ERROR);
      }
    } else if (orderCertModel.status ==
        OrderCertModel.APPROVE_REQUEST_CERT_ERROR) {
      if (!isFromListOrder) {
        Get.back();
        // showErrorModal(AppLocalizations.current.orderAPPROVE_REQUEST_CERT_ERROR);
      }
    } else if (orderCertModel.status == OrderCertModel.REJECT_REQUEST_CERT) {
      if (!isFromListOrder) {
        Get.back();
        showErrorModal(AppLocalizations.current.orderREJECT_REQUEST_CERT);
      }
    } else if (orderCertModel.status == OrderCertModel.KEY_ASSIGN_ERROR) {
      if (!isFromListOrder) {
        Get.back();
        showErrorModal(AppLocalizations.current.orderKEY_ASSIGN_ERROR);
      }
    } else if (orderCertModel.status == OrderCertModel.CANCELED) {
      if (!isFromListOrder) {
        Get.back();
        showErrorModal(AppLocalizations.current.orderCANCELED);
      }
    } else if (orderCertModel.status == OrderCertModel.DONE) {
      if (orderCertModel.getTypeEnum() == OrderType.newCert) {
        if (isFromListOrder) {
          // ko can back
        } else {
          Get.back();
        }
        Get.to(() => const WaitForAcceptScreen());
      } else if (orderCertModel.getTypeEnum() == OrderType.changeDevice) {
        Get.back();
        // todo pin code
        // 2 la trang thai cho kich hoat
        Get.to(() => SetupPinCodePage(
              certificateModel:
                  CertificateModel(id: orderCertModel.credentialId!, status: 2),
            ));
      }
    } else {
      // todo nothing
    }
  }

  activeKey(CertificateModel certificateModel, String otp, String pin) async {
    Get.to(() => GenerateCerKeyPage(
        certificateModel: certificateModel, otp: otp, pin: pin));
    return;
  }

  verifyEkyc(dynamic data) async {
    String errMess = '';
    showLoading();
    try {
      debugPrint(jsonEncode(data));
      // log('======>' + username!);
      var idFront = data["IdFront"];
      var idBack = data["IdBack"];
      var idFrontFull = data["IdFrontFull"];
      var idBackFull = data["IdBackFull"];
      var faceVideo = data["FaceVideo"];
      var ocrIdVideo = data["OcrIdVideo"];
      var nearPortrait = data["NearPortrait"];
      var farPortrait = data["FarPortrait"];

      // if (idFront == null ||
      //     idFront.isEmpty ||
      //     idBack == null ||
      //     idBack.isEmpty ||
      //     faceVideo == null ||
      //     faceVideo.isEmpty ||
      //     idFrontFull == null ||
      //     idFrontFull.isEmpty ||
      //     idBackFull == null ||
      //     idBackFull.isEmpty ||
      //     nearPortrait == null ||
      //     nearPortrait.isEmpty ||
      //     ocrIdVideo == null ||
      //     ocrIdVideo.isEmpty ||
      //     farPortrait == null ||
      //     farPortrait.isEmpty) {
      //   errMess = AppLocalizations.current.verifyFailDetail;
      //   showErrorModal(errMess, title: AppLocalizations.current.verifyFail, image: Assets.images.icDialogFail,
      //       callback: () {
      //     // back to root, result null
      //     Get.back();
      //   });
      //   return;
      // }

      // String? profileString =
      //     await secureStorage.getLastData(LOCAL_USER_PROFILE);
      ProfileModel profileModel = ProfileModel();
      // if (profileString != null && !isFlowRegister) {
      //   profileModel = ProfileModel.fromJson(jsonDecode(profileString!));
      // } else {
      final authController = Get.find<AuthController>();
      if (authController.authStatus == AuthenticationStatus.authenticated) {
        uid = authController.currentUser.value!.uid;
        profileModel.fullName = authController.currentUser.value?.displayName;
      }

      isFlowRegister = false;
      profileModel.uid = uid;
      // }
      DeviceInfoModel deviceInfo = await _deviceInfoService.getDeviceInfo();

      EkycCustomerRequest param = EkycCustomerRequest(
        nearPortrait: nearPortrait,
        farPortrait: farPortrait,
        idFront: idFront,
        idBack: idBack,
        idFrontFull: idFrontFull,
        idBackFull: idBackFull,
        faceVideo: faceVideo,
        ocrIdVideo: ocrIdVideo,
        uid: profileModel.uid,
        fullName: profileModel.fullName,
        deviceId: deviceInfo.deviceId,
        dkkdImages: [],
        dkkdVideo: null,
      );

      final failureOrVerified = await orderCertRepository.verifyEkyc(param);
      hideLoading();
      failureOrVerified.fold(
        (failure) {
          // showErrorModal(exceptionHandler(failure),
          //     title: AppLocalizations.current.verifyFail, image: Assets.images.icDialogFail, callback: () {
          //   Get.back();
          // }),
          ekycErrorCount = ekycErrorCount + 1;
          if (ekycErrorCount >= 3) {
            Get.to(() => VerifyInfoErrorScreen(
                  type: VerifyInfoType.error3times,
                  errorText: exceptionHandler(failure),
                ))?.then((value) {
              ekycErrorCount = 0;
              // back to danh sach goi cuoc
              Get.back(result: VerifyInfoType.error3times);
            });
          } else {
            Get.to(() => VerifyInfoErrorScreen(
                  type: VerifyInfoType.error,
                  errorText: exceptionHandler(failure),
                ))?.then((value) async {
              if (value == true) {
                // back to danh sach goi cuoc
                // Get.back(result: VerifyInfoType.error);
                await _ekycAgain();
              } else {
                // ekycErrorCount = 0;
                // // back to danh sach goi cuoc
                Get.back();
                // // back to danh sach cts
                // Get.back();
              }
            });
          }
        },
        (result) async {
          // ket qua ocr
          EkycResponseModel ekycResult =
              EkycResponseModel.fromJson(result.content);
          // back to danh sach goi cuoc
          Get.back(result: ekycResult);
          // todo
        },
      );
    } catch (e, s) {
      showErrorModal(errMess,
          title: AppLocalizations.current.verifyFail,
          image: Assets.images.icDialogFail, callback: () {
        Get.back();
      });
    }
  }

  _ekycAgain() async {

    String errMess = '';
    // userStatus
    var data = await ekycService.eKYCFull();
    if (data == null) {
      // showErrorModal(
      //   errMess,
      //   title: AppLocalizations.current.verifyFail,
      //   image: Assets.images.icDialogFail,
      // );
      Get.back();
      return;
    }

    var idFront = data["IdFront"];
    var idBack = data["IdBack"];
    var idFrontFull = data["IdFrontFull"];
    var idBackFull = data["IdBackFull"];
    var faceVideo = data["FaceVideo"];
    var ocrIdVideo = data["OcrIdVideo"];
    var nearPortrait = data["NearPortrait"];
    var farPortrait = data["FarPortrait"];

    if (idFront == null ||
        idFront.isEmpty ||
        idBack == null ||
        idBack.isEmpty ||
        faceVideo == null ||
        faceVideo.isEmpty ||
        idFrontFull == null ||
        idFrontFull.isEmpty ||
        idBackFull == null ||
        idBackFull.isEmpty ||
        nearPortrait == null ||
        nearPortrait.isEmpty ||
        ocrIdVideo == null ||
        ocrIdVideo.isEmpty ||
        farPortrait == null ||
        farPortrait.isEmpty) {
      // errMess = AppLocalizations.current.verifyFailDetail;
      // showErrorModal(errMess, title: AppLocalizations.current.verifyFail, image: Assets.images.icDialogFail,
      //     callback: () {
      //     });
      Get.back();
      return;
    }
    verifyEkyc(data);
  }

  Future eKycUserEnroll() async {
    String errMess = '';
    // userStatus
    var data = await ekycService.eKYCFull();
    if (data == null) {
      // showErrorModal(
      //   errMess,
      //   title: AppLocalizations.current.verifyFail,
      //   image: Assets.images.icDialogFail,
      // );
      return null;
    }

    var idFront = data["IdFront"];
    var idBack = data["IdBack"];
    var idFrontFull = data["IdFrontFull"];
    var idBackFull = data["IdBackFull"];
    var faceVideo = data["FaceVideo"];
    var ocrIdVideo = data["OcrIdVideo"];
    var nearPortrait = data["NearPortrait"];
    var farPortrait = data["FarPortrait"];

    if (idFront == null ||
        idFront.isEmpty ||
        idBack == null ||
        idBack.isEmpty ||
        faceVideo == null ||
        faceVideo.isEmpty ||
        idFrontFull == null ||
        idFrontFull.isEmpty ||
        idBackFull == null ||
        idBackFull.isEmpty ||
        nearPortrait == null ||
        nearPortrait.isEmpty ||
        ocrIdVideo == null ||
        ocrIdVideo.isEmpty ||
        farPortrait == null ||
        farPortrait.isEmpty) {
      // errMess = AppLocalizations.current.verifyFailDetail;
      // showErrorModal(errMess, title: AppLocalizations.current.verifyFail, image: Assets.images.icDialogFail,
      //     callback: () {
      //     });
      return null;
    }

    var result = await Get.to(() => VerifyInfoScreen(data: data));
    return result;
  }

  // huy don hang
  cancelOrder(OrderCertModel orderCertModel) async {
    showLoading();
    try {
      final failureOrVerified = await orderCertRepository.cancelOrder(orderCertModel.id);
      hideLoading();
      failureOrVerified.fold(
            (failure) => {
          showErrorModal(exceptionHandler(failure), callback: () {
            // Get.back();
          }),
        },
            (result) async {
          debugPrint(result.toString());
          OrderCertModel orderCertModel1 = OrderCertModel.fromJson(result.content);
          orderCertModel.orderItemController?.currentOrderCertModel.value = orderCertModel1;
          // currentOrderCertModel.value = orderCertModel;
          // localUpdateUserAddress(
          //     userAddress, addressController, detailAddressController);
        },
      );
    } catch (e, s) {
      hideLoading();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)),
          callback: () {
            // Get.back();
          });
    }
  }
}
