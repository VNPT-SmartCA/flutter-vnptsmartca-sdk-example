import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../configs/injector/injector.dart';
import '../../../core/models/app/exceptions.dart';
import '../../../core/models/app/file_model.dart';
import '../../../core/models/request/waiting_tran_req_model.dart';
import '../../../core/models/request/waiting_trans_req_model.dart';
import '../../../core/models/response/transaction_model.dart';
import '../../../core/services/biometrics.dart';
import '../../../core/utils/share_file.dart';
import '../../../data/repository/transaction_repository.dart';
import '../../../views/controller/base_controler.dart';
import '../../../views/i18n/generated_locales/l10n.dart';
import '../../../views/pages/transaction_request/detail.dart';
import '../../../views/pages/transaction_request/widgets/transaction_clock_count_down.dart';
import '../../../views/utils/exception_handler.dart';
import '../../../views/widgets/circular_count_down_timer.dart';
import 'package:base32/base32.dart';

import '../../core/models/app/smartca_message_result.dart';
import '../../core/models/app/user_info_on_device.dart';
import '../../core/models/response/service_response.dart';
import '../../core/services/user_info_on_device.dart';
import '../../data/repository/eseal/3rd_repository.dart';
import '../../data/repository/eseal/transaction_repository.dart';
import '../../method_channel_handler.dart';
import '../pages/active_account/sign_bbnt/widget/preview_pdf_acceptance.dart';
import '../pages/certificate/select_cert_screen.dart';
import '../pages/transaction_request/widgets/pin_dialog.dart';
import '../utils/enums.dart';
import '../widgets/dialog/common_dialog.dart';
import '../widgets/navigator_helper.dart';
import 'app_controller.dart';
import 'auth_controller.dart';
import 'home_controller.dart';

class TransactionController extends BaseController {
  final transactionRepository = getIt<TransactionRepository>();
  final refreshController = RefreshController(initialRefresh: true);
  final biometricService = getIt<BiometricsService>();
  final _userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();
  final _generateSADUtils = getIt<GenerateSADUtils>();

  //Nhóm giao dịch theo chứng thư số
  // ignore: prefer_collection_literals
  final transactionRequestGroupList = Map<dynamic, dynamic>().obs;
  //Giao dich
  final transactionRequestList = List<TransactionModel>.empty().obs;
  //Thông tin giao dịch ở màn hình chi tiết
  final transactionInfo = Rx<TransactionModel?>(null);

  final listFile = Rx<List<FileModel>>([]);
  final displayDocName = ''.obs;
  final isShowResult = false.obs;
  bool isOpenFromExternalApp = false;

  /*
    Sử dụng cho việc hiển thị view countdown

    - isTransactionState = true ==> con thời hạn ký;
    - isTransactionState = false ==> các trường hợp khác;
  */
  final isTransactionState = true.obs;

  final CountDownController countDownController = CountDownController();

  //Lấy danh sách các yêu cầu ký
  getTransactionRequests() async {
    try {
      final failureOrTransactions =
          await transactionRepository.getWaitingTransactions(
              WaitingTransactionListRequest(pageIndex: 1, pageSize: 100));

      failureOrTransactions.fold(
        (failure) {
          isTransactionState.value = false;
          isShowResult.value = false;
          refreshController.refreshFailed();
          showErrorModal(exceptionHandler(
              GenericException(error: failure.error, stack: failure.stack)));
        },
        (res) {
          transactionRequestList.value =
              res.where((element) => element.expiredIn > 0).toList();

          final groupedItems = groupTransactionByCredential(res);

          transactionRequestGroupList.value = groupedItems;
          isShowResult.value = true;
          isTransactionState.value = true;
          refreshController.refreshCompleted();
          update();
        },
      );
    } catch (e) {
      isTransactionState.value = false;
      refreshController.refreshFailed();
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    }
  }

  Map<dynamic, dynamic> groupTransactionByCredential(
      List<TransactionModel> items) {
    return groupBy(items, (item) => item.credentialId);
  }

  /// Xem chi tiết giao dịch chờ.
  getWaitingTransactionInfoById(String tranId) async {
    String msg = '';
    try {
      final failureOrTransactionInfo = await transactionRepository
          .getWaitingTransactionById(WaitingTransactionRequest(tranId: tranId));
      await failureOrTransactionInfo.fold(
        (l) async {
          isTransactionState.value = false;
          isShowResult.value = false;
          refreshController.refreshFailed();
          msg = exceptionHandler(
              GenericException(error: l.error, stack: l.stack));
          showErrorModal(msg);
        },
        (r) async {
          transactionInfo.value = r;
          getListTransactionFile(r);
          isShowResult.value = true;
          isTransactionState.value = true;
        },
      );
    } catch (e) {
      isTransactionState.value = false;
      msg = AppLocalizations.current.serviceSomethingWentWrong;
      showErrorModal(msg);
    }
    return msg;
  }

  //isBlank = false: đang ở màn hình giao dịch cần ký
  //isBlank = true: đang ở màn hình xem chi tiết giao dịch cần ký
  void onUpdateTransactionItems(TransactionModel tran) {
    transactionRequestList.value = transactionRequestList
        .where((element) => element.tranId != tran.tranId)
        .toList();
    // ignore: invalid_use_of_protected_member
    final groupedItems =
        groupTransactionByCredential(transactionRequestList.value);
    transactionRequestGroupList.value = groupedItems;
    transactionRequestGroupList.refresh();
    transactionRequestList.refresh();
    update();

    Get.until((route) => Get.currentRoute == "/");
  }

  //Lây danh sách tài liệu yêu cầu ký
  String getListTransactionFile(TransactionModel tran) {
    displayDocName.value = '';
    listFile.value = [];
    for (var element in tran.docs) {
      FileModel file = FileModel(
          name: element['name'],
          size: element['size'],
          data: element['data'],
          file: null,
          path: '',
          sizeMb: 0);
      listFile.value.add(file);
    }

    List<String?> lstFileName =
        listFile.value.map((file) => file.name).toList();
    displayDocName.value = lstFileName.join(", ");
    return lstFileName.join(", ");
  }

  /// Lấy chi tiết giao dịch và Xác nhận ký giao dịch
  getDetailAndConfirmWaitingTransaction(
      String userPIN, TransactionModel transactionModel) async {
    try {
      showProgress();
      final failureOrTransactionInfo =
          await transactionRepository.getWaitingTransactionById(
              WaitingTransactionRequest(tranId: transactionModel.tranId));
      hideProgress(closeOverlays: true);

      failureOrTransactionInfo.fold(
        (l) => {
          refreshController.refreshFailed(),
          showErrorModal(exceptionHandler(
              GenericException(error: l.error, stack: l.stack)))
        },
        (r) async {
          transactionInfo.value = r;
          await confirmWaitingTransaction(userPIN, r);
        },
      );
    } catch (e) {
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    }
  }

  /// Xác nhận ký giao dịch
  confirmWaitingTransaction(
      String userPIN, TransactionModel transactionModel) async {
    try {
      showProgress();

      final cert = await getCertInfoOnDevice(transactionModel.credentialId);
      if (cert == null) return;
      final authController = Get.find<AuthController>();
      final currentUser = authController.currentUser.value;

      final isEseal = cert.otpSecret != null && cert.otpSecret != "";

      if (userPIN != cert.pin) {
        hideProgress();
        showErrorModal(AppLocalizations.current.invalidPIN);
        return;
      }

      String sad;
      if (isEseal == true) {
        await getOTPSecret(transactionModel.credentialId);

        sad = await _generateSADUtils.checkedAndGenerateSADAcceptanceESeal(
            transactionModel, currentUser!.uid, userPIN, cert);
      } else {
        sad = await _generateSADUtils.checkedAndGenerateSAD(
            transactionModel, userPIN, cert);
      }

      late Either<GenericException, SmartCAApiResponse> failureOrConfirmed;
      late TransactionRepositoryEseal transactionRepositoryEseal;

      if (isEseal == true) {
        transactionRepositoryEseal = getIt<TransactionRepositoryEseal>();
        final thirdPartyRepositoryEseal = getIt<ThirdPartyRepositoryEseal>();

        final reqConfirmTran = {
          "tranId": transactionModel.tranId,
          "credentialId": transactionModel.credentialId,
          "uid": currentUser!.uid,
          "sad": sad,
        };

        if (transactionModel.tranType == 5) {
          failureOrConfirmed = await transactionRepositoryEseal
              .confirmAcceptance(reqConfirmTran);
        } else {
          if (transactionModel.refTransactionId.contains("iscaLink")) {
            failureOrConfirmed =
                await thirdPartyRepositoryEseal.confirmLink3rd(reqConfirmTran);
          } else if (transactionModel.refTransactionId.contains("iscaUnlink")) {
            failureOrConfirmed = await thirdPartyRepositoryEseal
                .confirmDelete3rdLink(reqConfirmTran);
          } else {
            failureOrConfirmed =
                await transactionRepositoryEseal.signhashEseal(reqConfirmTran);
          }
        }
      } else {
        failureOrConfirmed = await transactionRepository
            .confirmWaitingTransaction(transactionModel, userPIN, sad);
      }

      hideProgress(closeOverlays: true);

      failureOrConfirmed.fold(
        (l) async {
          refreshController.refreshFailed();
          // if (l.error is ServerException) {
          //   if ((l.error as ServerException).code == 63000) {
          //     showChangeDevice();

          //     return;
          //   }
          // }
          final message = exceptionHandler(
              GenericException(error: l.error, stack: l.stack));
          sendWaitingTransactionResult(message, 1);

          showErrorModal(message);
        },
        (r) async {
          refreshController.refreshCompleted();
          if (transactionModel.tranType == 5 && isEseal) {
            var param = {
              'uid': currentUser!.uid,
              'pin': userPIN,
              'showQr': true,
              'credentialId': transactionModel.credentialId,
            };
            var resp;
            failureOrConfirmed =
                await transactionRepositoryEseal.eSealGetCode(param);
            failureOrConfirmed.fold((l) => l, (_resp) => resp = _resp);

            final totpBasicSpec = resp.content['totpBasicSpec'];
            final cert = await _userInfoOnDeviceService
                .getCerCurrentUserByIdCer(transactionModel.credentialId);
            cert?.otpSecret =
                base32.encode(base64Decode(totpBasicSpec['totp']));
            await _userInfoOnDeviceService.addOrUpdateCert(
                currentUser.uid, cert!);
          }

          showSuccessModal(
              message: AppLocalizations.current.signTransactionDone,
              titleBtnAccept: AppLocalizations.current.close,
              title: AppLocalizations.current.successNotirce,
              actionAccept: () {
                Timer(const Duration(milliseconds: 500), () {
                  final appController = Get.find<AppController>();
                  if (appController.selectedIndex.value == 0) {
                    onRefresh();
                  }

                  appController.backToMainPage();

                  // close sdk
                  sendWaitingTransactionResult(r.message, r.code);
                  NavigatorHandler.closeSDK();
                });
              });
        },
      );
    } catch (e) {
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    } finally {
      isOpenFromExternalApp = false;
    }
  }

  /// Hủy giao dịch chờ
  rejectWaitingTransaction(
      String userPIN, TransactionModel transactionModel) async {
    try {
      showProgress();

      final cert = await getCertInfoOnDevice(transactionModel.credentialId);
      if (cert == null) return;

      if (userPIN != cert.pin) {
        hideProgress();
        showErrorModal(AppLocalizations.current.invalidPIN);
        return;
      }

      final sad = await _generateSADUtils.checkedAndGenerateSAD(
          transactionModel, userPIN, cert);

      final failureOrConfirmed = await transactionRepository
          .rejectWaitingTransaction(transactionModel, userPIN, sad);

      hideProgress(closeOverlays: true);

      await failureOrConfirmed.fold(
        (l) async {
          refreshController.refreshFailed();
          final message = exceptionHandler(
              GenericException(error: l.error, stack: l.stack));
          sendWaitingTransactionResult(message, 1);

          showErrorModal(message);
        },
        (r) async {
          refreshController.refreshCompleted();

          sendWaitingTransactionResult(r.message, r.code);

          showSuccessModal(
            message: AppLocalizations.current.cancelTransactionDone,
            titleBtnAccept: AppLocalizations.current.close,
            title: AppLocalizations.current.successNotirce,
            actionAccept: () {
              onRefresh();
              Get.until((route) => Get.currentRoute == "/");
            },
          );
        },
      );
    } catch (e) {
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    } finally {
      isOpenFromExternalApp = false;
    }
  }

  //Ký/hủy tất cả giao dịch
  void useBiometricWithAllTransaction(
      TransactionType transactionType, String credentialId) async {
    await biometricService
        .authenticateWithBiometrics()
        .then((authenticated) async {
      if (authenticated) {
        //Lấy PIN lưu ở Local
        final cert = await getCertInfoOnDevice(credentialId);
        if (cert == null) return;

        if (transactionType == TransactionType.confirm) {
          confirmAllWaitingTransaction(cert.pin, credentialId);
        } else {
          rejectAllWaitingTransaction(cert.pin, credentialId);
        }
      } else {
        Get.dialog(
          PINDialogWidget(
              transactionType: transactionType,
              callback: (pin) {
                if (transactionType == TransactionType.confirm) {
                  confirmAllWaitingTransaction(pin, credentialId);
                } else {
                  rejectAllWaitingTransaction(pin, credentialId);
                }
              }),
          barrierDismissible: false,
        );
      }
    }).catchError((onError) => null);
  }

  /// Xác nhận ký tất cả giao dịch
  Future confirmAllWaitingTransaction(
      String userPIN, String credentialId) async {
    try {
      showProgress();
      final itemTransactions = transactionRequestGroupList[credentialId];
      int signRrrors = 0;

      final cert = await getCertInfoOnDevice(itemTransactions[0].credentialId);
      if (cert == null) return;

      if (userPIN != cert.pin) {
        hideProgress();
        showErrorModal(AppLocalizations.current.invalidPIN);
        return;
      }

      final authController = Get.find<AuthController>();
      final currentUser = authController.currentUser.value;

      final isEseal = cert.otpSecret != null && cert.otpSecret != "";

      if (isEseal == true) {
        getOTPSecret(credentialId);
      }

      // ignore: prefer_collection_literals
      Map<String, String> lstMessages = Map<String, String>();
      for (var i = 0; i < itemTransactions.length; i++) {
        TransactionModel item = itemTransactions[i];
        final failureOrTransactionInfo =
            await transactionRepository.getWaitingTransactionById(
                WaitingTransactionRequest(tranId: item.tranId));
        failureOrTransactionInfo.fold(
          (l) async {
            signRrrors++;
            final msg = exceptionHandler(
                GenericException(error: l.error, stack: l.stack));
            lstMessages['ERR-${signRrrors.toString().padLeft(2, "0")}'] = msg;
            return;
          },
          (r) async {
            transactionInfo.value = r;

            String sad;

            if (isEseal == true) {
              sad =
                  await _generateSADUtils.checkedAndGenerateSADAcceptanceESeal(
                      r, currentUser!.uid, userPIN, cert);
            } else {
              sad = await _generateSADUtils.checkedAndGenerateSAD(
                  r, userPIN, cert);
            }

            late Either<GenericException, SmartCAApiResponse>
                failureOrConfirmed;
            late TransactionRepositoryEseal transactionRepositoryEseal;

            if (isEseal == true) {
              transactionRepositoryEseal = getIt<TransactionRepositoryEseal>();
              final thirdPartyRepositoryEseal =
                  getIt<ThirdPartyRepositoryEseal>();

              final reqConfirmTran = {
                "tranId": r.tranId,
                "credentialId": r.credentialId,
                "uid": currentUser!.uid,
                "sad": sad,
              };

              if (r.tranType == 5) {
                failureOrConfirmed = await transactionRepositoryEseal
                    .confirmAcceptance(reqConfirmTran);
              } else {
                if (r.refTransactionId.contains("iscaLink")) {
                  failureOrConfirmed = await thirdPartyRepositoryEseal
                      .confirmLink3rd(reqConfirmTran);
                } else if (r.refTransactionId.contains("iscaUnlink")) {
                  failureOrConfirmed = await thirdPartyRepositoryEseal
                      .confirmDelete3rdLink(reqConfirmTran);
                } else {
                  failureOrConfirmed = await transactionRepositoryEseal
                      .signhashEseal(reqConfirmTran);
                }
              }
            } else {
              failureOrConfirmed = await transactionRepository
                  .confirmWaitingTransaction(r, userPIN, sad);
            }

            // Ký BBNT
            failureOrConfirmed.fold(
              (l) {
                signRrrors++;
                final msg = exceptionHandler(
                    GenericException(error: l.error, stack: l.stack));
                lstMessages['ERR-${signRrrors.toString().padLeft(2, "0")}'] =
                    msg;
                return;
              },
              (r) {
                return;
              },
            );
          },
        );
      }
      hideProgress();
      refreshController.refreshCompleted();

      final signDone = itemTransactions.length - signRrrors;
      if (signRrrors == 0) {
        showSuccessModal(
          message: AppLocalizations.current.signTransactionDone,
          titleBtnAccept: AppLocalizations.current.close,
          title: AppLocalizations.current.successNotirce,
          actionAccept: () {
            onRefresh();
          },
        );
        return;
      }
      String mesg = '';
      lstMessages.forEach((key, value) {
        mesg += '[$key]: $value \n';
      });

      final signSuccess = '$signDone/${itemTransactions.length}';
      showSuccessModal(
        message:
            AppLocalizations.current.sign_tranaction_success(signSuccess, mesg),
        titleBtnAccept: AppLocalizations.current.close,
        title: AppLocalizations.current.successNotirce,
        actionAccept: () {
          onRefresh();
        },
      );
    } catch (e) {
      hideProgress();
      refreshController.refreshFailed();
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    }
  }

  /// Hủy giao dịch chờ
  rejectAllWaitingTransaction(String userPIN, String credentialId) async {
    try {
      showProgress();
      final itemTransactions = transactionRequestGroupList[credentialId];
      var cancelRrrors = 0;
      Map<String, String> lstMessages = {};
      final cert = await getCertInfoOnDevice(credentialId);
      if (cert == null) return;
      if (userPIN != cert.pin) {
        hideProgress();
        showErrorModal(AppLocalizations.current.invalidPIN);
        return;
      }

      for (var item in itemTransactions) {
        final sad =
            await _generateSADUtils.checkedAndGenerateSAD(item, userPIN, cert);

        final failureOrCanceled = await transactionRepository
            .rejectWaitingTransaction(item, userPIN, sad);
        await failureOrCanceled.fold(
          (l) async {
            cancelRrrors++;
            final msg = exceptionHandler(
                GenericException(error: l.error, stack: l.stack));
            lstMessages['ERR-$cancelRrrors'] = msg;
            return;
          },
          (r) async {
            return;
          },
        );
      }

      hideProgress();

      final cancelDone = itemTransactions.length - cancelRrrors;

      if (cancelRrrors == 0) {
        showSuccessModal(
          message: AppLocalizations.current.cancelTransactionDone,
          titleBtnAccept: AppLocalizations.current.close,
          title: AppLocalizations.current.successNotirce,
          actionAccept: () {
            onRefresh();
          },
        );
        return;
      }

      String mesg = '';
      lstMessages.forEach((key, value) {
        mesg += '[$key]: $value \n';
      });

      refreshController.refreshCompleted();

      final cancelSuccess = '$cancelDone/${itemTransactions.length}';
      showSuccessModal(
        message: AppLocalizations.current
            .cancel_tranaction_success(cancelSuccess, mesg),
        titleBtnAccept: AppLocalizations.current.close,
        title: AppLocalizations.current.successNotirce,
        actionAccept: () {
          onRefresh();
        },
      );
    } catch (e) {
      hideProgress();
      refreshController.refreshFailed();
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    }
  }

  useBiometricWithTransaction(
      TransactionType transactionType, TransactionModel transactionModel,
      {bool needGetDetail = false}) async {
    final authenticated = await biometricService.authenticateWithBiometrics();
    if (authenticated) {
      //Lấy PIN lưu ở Local
      final cert = await getCertInfoOnDevice(transactionModel.credentialId);
      if (cert == null) return;

      if (transactionType == TransactionType.confirm) {
        if (needGetDetail == true) {
          await getDetailAndConfirmWaitingTransaction(
              cert.pin, transactionModel);
        } else {
          await confirmWaitingTransaction(cert.pin, transactionModel);
        }
      } else {
        await rejectWaitingTransaction(cert.pin, transactionModel);
      }
    }

    return authenticated;
  }

  getDetailTrans(String tranId) async {
    try {
      showProgress();
      String msg = await getWaitingTransactionInfoById(tranId);
      hideProgress(closeOverlays: true);
      if (msg.isEmpty) {
        Get.to(() => TransactionDetail());
      } else {
        sendWaitingTransactionResult(msg, 1);
        // showErrorModal(msg);
      }
    } catch (e) {
      hideProgress(closeOverlays: true);
    }
  }

  /// Khởi tạo file_name từ danh sách file nhận được qua API.
  void _initFileModel(TransactionModel trans) {
    listFile.value = [];
    for (var element in trans.docs) {
      FileModel? file = FileModel.fromDoc(element);
      if (file != null) {
        listFile.value.add(file);
      }
    }
  }

  /// Xem chi tiết giao dịch .
  Future getTransInfor(String tranId) async {
    try {
      showLoading();
      transactionInfo.value = null;
      final failureOrTransactionModel =
          await transactionRepository.getTransInfor(tranId);
      hideLoading();
      failureOrTransactionModel.fold(
        (l) => {showErrorModal(exceptionHandler(l), callback: () {})},
        (r) => {
          transactionInfo.value = r,
          _initFileModel(r),
        },
      );
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)),
          callback: () {});
    }
  }

  getBbntTrans(String credentialId) async {
    try {
      TransactionModel? transactionBbnt;

      var req = WaitingTransactionListRequest(pageIndex: 1, pageSize: 5);
      bool isStop = false;
      List<TransactionModel>? transactions;

      while (isStop == false) {
        final failureOrTransactionModel =
            await transactionRepository.getWaitingTransactions(req);

        failureOrTransactionModel.fold(
          (l) => {
            isStop = true,
            showErrorModal(exceptionHandler(GenericException(error: l.error))),
          },
          (result) {
            transactions = result;
          },
        );

        if (transactions != null) {
          for (var element in transactions!) {
            if (element.credentialId == credentialId && element.tranType == 5) {
              transactionBbnt = element;
              isStop = true;
            }
          }
        } else {
          await Future.delayed(const Duration(seconds: 3), () {});
        }
      }

      if (transactionBbnt != null) {
        await getWaitingTransactionInfoById(transactionBbnt.tranId);
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(
        GenericException(error: e, stack: s),
      ));
    }
  }

  void _onComplete(TransactionModel tran) => onUpdateTransactionItems(tran);

  // Đồng hồ đếm ngược
  Widget buildCountdown(TransactionModel transactionModel) {
    return SizedBox(
      child: isTransactionState.value
          ? TransactionClockCountDown(
              key: UniqueKey(),
              isShowResult: isShowResult.value,
              model: transactionModel,
              onComplete: (tran) => _onComplete(transactionModel),
              countDownController: countDownController,
            )
          : Container(),
    );
  }

  ///  Hiển thị file trước khi ký
  onPreviewDocument(FileModel file) {
    try {
      final extension = p.extension(file.name).trim();
      if (extension.isNotEmpty) {
        ShareFiles.saveFile(file.data, file.name)
            .then((value) => {
              // ShareFiles.readFile(file.name)
              Get.to(() => PreviewPDfAcceptance(file: file))
            });
      } else {
        showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
      }
    } catch (e) {
      showErrorModal(AppLocalizations.current.serviceSomethingWentWrong);
    }
  }

  ///  Lấy thông tin giao dịch sau đó xem/chia sẻ file
  onViewOrShareDocument(TransactionModel value, {bool? isShare = false}) async {
    try {
      showProgress();
      final failureOrTransactionModel =
          await getIt<TransactionRepository>().getTransInfor(value.tranId);
      hideProgress();
      failureOrTransactionModel.fold(
        (l) => {showErrorModal(exceptionHandler(l), callback: () {})},
        (r) {
          FileModel? file = FileModel.fromDoc(r.docs.first);
          if (file == null || (file.data.isEmpty)) {
            showErrorModal(AppLocalizations.current.listFileEmpty,
                callback: () {});
          } else {
            if (isShare == true) {
              onShareFile(file);
            } else {
              onPreviewDocument(file);
            }
          }
        },
      );
    } catch (e, s) {
      hideProgress();
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)),
          callback: () {});
    }
  }

  onShareFile(FileModel file) async {
    await ShareFiles.saveFile(file.data, file.name);
    ShareFiles.shareFiles(file.name);
  }

  onRefresh() async {
    await getTransactionRequests();

    final controller = Get.find<HomeController>();
    final param = {'order': 'InitialDate', 'isDesc': true};
    controller.appRefreshController.refresh(params: param);
  }

  Future<CertModel?> getCertInfoOnDevice(String credentialId) async {
    final certModel =
        await _userInfoOnDeviceService.getCerCurrentUserByIdCer(credentialId);

    if (certModel == null || certModel?.privateKey == null) {
      hideProgress();

      showNotifyModal(AppLocalizations.current.KAKNotFound,
          titleBtnAccept: AppLocalizations.current.changeDevice,
          titleBtnCancel: AppLocalizations.current.close, actionAccept: () {
        // controller.requestChangeDevice(certModel!.id!);
        Get.to(() => SelectCertScreen());
      }, onlyActionCancel: false);

      return null;
    }
    return certModel;
  }

  sendWaitingTransactionResult(String msg, int code) {
    if (Get.find<AppController>().currentHostAppMethod.value !=
        MethodChannelNames.getWaitingTransaction) {
      showErrorModal(msg);
      return;
    }

    SmartCaResult data = code != 0
        ? SmartCaResult.sendError(msg)
        : SmartCaResult(
            ResultCode.SUCCESS_CODE,
            ResultCodeDesc.SUCCESS,
          );

    getIt<MethodChannelHandler>().send(
      method: MethodChannelNames.getWaitingTransactionResult,
      data: data,
    );

    if (Get.isDialogOpen == true) Get.back();

    NavigatorHandler.closeSDK();
  }

  handleBack() {
    sendWaitingTransactionResult('USER_CANCELED', 1);
    Get.back();
    return true;
  }

  onPressCommand(TransactionModel transactionModel, TransactionType type,
      {bool needGetDetail = false}) async {
    final authController = Get.find<AuthController>();
    bool authenticated = false;
    if (authController.currentUser.value?.useBiometric == true) {
      authenticated = await useBiometricWithTransaction(type, transactionModel,
          needGetDetail: needGetDetail);

      if (authenticated == true) return;
    }

    Get.dialog(
      PINDialogWidget(
          transactionType: type,
          callback: (pin) {
            if (type == TransactionType.confirm) {
              getDetailAndConfirmWaitingTransaction(pin, transactionModel);
            } else {
              rejectWaitingTransaction(pin, transactionModel);
            }
          }),
      barrierDismissible: false,
    );
  }

  getOTPSecret(String credentialId) async {
    try {
      final TransactionRepositoryEseal transactionRepositoryEseal =
          getIt<TransactionRepositoryEseal>();
      final userInfoOnDeviceService = getIt<UserInfoOnDeviceService>();

      final authController = Get.find<AuthController>();

      final currentUser = authController.currentUser.value;
      final certModel =
          await userInfoOnDeviceService.getCerCurrentUserByIdCer(credentialId);

      if (certModel == null || certModel.otpSecret == null) {
        showNotifyModal(AppLocalizations.current.KAKNotFound,
            titleBtnAccept: AppLocalizations.current.changeDevice,
            titleBtnCancel: AppLocalizations.current.close,
            actionAccept: () {},
            onlyActionCancel: false);

        return null;
      }

      var param = {
        'uid': currentUser!.uid,
        'pin': certModel.pin,
        'showQr': true,
        'credentialId': credentialId,
      };

      final failureOrConfirmed =
          await transactionRepositoryEseal.eSealGetCode(param);

      SmartCAApiResponse<dynamic>? resp;

      failureOrConfirmed.fold((l) => throw l, (_resp) => resp = _resp);

      final totpBasicSpec = resp?.content['totpBasicSpec'];
      final cert =
          await userInfoOnDeviceService.getCerCurrentUserByIdCer(credentialId);
      final newTOTP = base32.encode(base64Decode(totpBasicSpec['totp']));

      if (cert?.otpSecret != newTOTP) {
        cert?.otpSecret = newTOTP;
        await userInfoOnDeviceService.addOrUpdateCert(currentUser.uid, cert!);
      }
    } catch (e, s) {
      showErrorModal(exceptionHandler(GenericException(error: e, stack: s)));
    }
  }
}
