import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/services/biometrics.dart';
import '../core/services/crypto/aes_encryption_util.dart';
import '../core/services/crypto/jwt_util.dart';
import '../core/services/crypto/kak_utils.dart';
import '../core/services/crypto/message_digest.dart';
import '../core/services/device_info.dart';
import '../core/services/network_info_service.dart';
import '../core/services/secure_local_storage.dart';
import '../core/services/user_info_on_device.dart';
import '../data/network/auth_api.dart';
import '../data/network/eseal/api_gateway_eseal.dart';
import '../data/network/send_log_api.dart';
import '../data/network/smartca_api_gateway.dart';
import '../data/repository/active_account_repository.dart';
import '../data/repository/authen_repository.dart';
import '../data/repository/certificate_repository.dart';
import '../data/repository/check_uid_repository.dart';
import '../data/repository/confirm_information_repository.dart';
import '../data/repository/eseal/3rd_repository.dart';
import '../data/repository/eseal/certificate_repository.dart';
import '../data/repository/eseal/transaction_repository.dart';
import '../data/repository/order_cert_repository.dart';
import '../data/repository/otp_verify_repository.dart';
import '../data/repository/purchase_certificate_repository.dart';
import '../data/repository/send_log_repository.dart';
import '../data/repository/service_pack_history_respository.dart';
import '../data/repository/service_pack_page_respository.dart';
import '../data/repository/sign_bill_repository.dart';
import '../data/repository/transaction_history_repository.dart';
import '../data/repository/transaction_repository.dart';
import '../data/repository/transaction_request_repository.dart';
import '../data/repository/user_repository.dart';
import '../data/repository/verify_identifier_repository.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  NetworkInfoService get thirdPartyType;

  @injectable
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();

  @injectable
  AuthenRepository get authenRepository;

  @injectable
  DeviceInfoService get deviceInfoService;

  @injectable
  AuthRemoteApi get authenApi;

  @lazySingleton
  SecureLocalStorageService get secureLocalStorageService;

  @injectable
  SmartCAApiGateway get smartCAApiGateway;

  @injectable
  ApiGatewayEseal get apiGatewayEseal;

  @lazySingleton
  SendLogAPI get sendLogAPI;

  @injectable
  UserRepository get userRepository;

  @injectable
  CertificateRepository get certificateRepository;

  @injectable
  TransactionHistoryRepository get transactionHistoryRepository;

  @injectable
  VerifyIdentifierRepository get verifyIdentifierRepository;

  @injectable
  ServicePackHistoryRepository get servicePackHistoryRepository;

  @lazySingleton
  BiometricsService get biometricsService;

  @injectable
  MessageDigestService get messageDigestService;

  @injectable
  ActiveAccountRepository get activeAccountRepository;

  @injectable
  RsaKeyService get rsaKeyService;

  @injectable
  AESEncryptionService get aESEncryptionService;

  @lazySingleton
  SendLogRepository get sendLogRepository;

  @injectable
  JWTService get jWTService;

  @lazySingleton
  UserInfoOnDeviceService get userInfoOnDeviceService;

  @injectable
  TransactionRepository get transactionRepository;

  @injectable
  TransactionRequestRepository get transactionRequestRepository;

  @injectable
  PurchaseCertificateRepository get purchaseCertificateRepository;

  @injectable
  ServicePackRepository get servicePackRepository;

  @injectable
  OrderCertRepository get orderCertRepository;

  @injectable
  CheckUidRepository get checkUidRepository;

  @injectable
  ConfirmInformationRepository get confirmInformationRepository;

  @injectable
  OTPVerifyRepository get otpVerifyRepository;

  @injectable
  CertificateRepositoryEseal get certificateRepositoryEseal;

  @injectable
  SignBillRepository get signBillRepository;

  @injectable
  TransactionRepositoryEseal get transactionRepositoryEseal;

  @injectable
  ThirdPartyRepositoryEseal get thirdPartyRepositoryEseal;
}
