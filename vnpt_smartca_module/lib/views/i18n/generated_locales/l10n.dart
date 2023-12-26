// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Đăng nhập`
  String get signIn {
    return Intl.message(
      'Đăng nhập',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Tên đăng nhập`
  String get username {
    return Intl.message(
      'Tên đăng nhập',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Không có kết nối mạng.`
  String get noInternet {
    return Intl.message(
      'Không có kết nối mạng.',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số`
  String get certificate {
    return Intl.message(
      'Chứng thư số',
      name: 'certificate',
      desc: '',
      args: [],
    );
  }

  /// `Khác`
  String get other {
    return Intl.message(
      'Khác',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số CCCD/HC/Mã số thuế`
  String get usernamePlacehoder {
    return Intl.message(
      'Nhập số CCCD/HC/Mã số thuế',
      name: 'usernamePlacehoder',
      desc: '',
      args: [],
    );
  }

  /// `Đã có lỗi xảy ra. Vui lòng thử lại sau.`
  String get serviceSomethingWentWrong {
    return Intl.message(
      'Đã có lỗi xảy ra. Vui lòng thử lại sau.',
      name: 'serviceSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgotPassword {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt tài khoản`
  String get activeAccount {
    return Intl.message(
      'Kích hoạt tài khoản',
      name: 'activeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hướng dẫn sử dụng`
  String get userManual {
    return Intl.message(
      'Hướng dẫn sử dụng',
      name: 'userManual',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký chứng thư số`
  String get registerCert {
    return Intl.message(
      'Đăng ký chứng thư số',
      name: 'registerCert',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có tài khoản`
  String get noAccount {
    return Intl.message(
      'Chưa có tài khoản',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Đóng`
  String get close {
    return Intl.message(
      'Đóng',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Ký số`
  String get digitalSignature {
    return Intl.message(
      'Ký số',
      name: 'digitalSignature',
      desc: '',
      args: [],
    );
  }

  /// `CCCD/HC/MST: {number}`
  String citizenId(Object number) {
    return Intl.message(
      'CCCD/HC/MST: $number',
      name: 'citizenId',
      desc: '',
      args: [number],
    );
  }

  /// `Tài liệu ký số`
  String get digitalSignatureDocument {
    return Intl.message(
      'Tài liệu ký số',
      name: 'digitalSignatureDocument',
      desc: '',
      args: [],
    );
  }

  /// `Xem thêm`
  String get viewMore {
    return Intl.message(
      'Xem thêm',
      name: 'viewMore',
      desc: '',
      args: [],
    );
  }

  /// `Mua\nlượt ký`
  String get buySignatures {
    return Intl.message(
      'Mua\nlượt ký',
      name: 'buySignatures',
      desc: '',
      args: [],
    );
  }

  /// `Gia hạn`
  String get extend {
    return Intl.message(
      'Gia hạn',
      name: 'extend',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi\nthông tin`
  String get changeInfo {
    return Intl.message(
      'Thay đổi\nthông tin',
      name: 'changeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Thu hồi`
  String get recall {
    return Intl.message(
      'Thu hồi',
      name: 'recall',
      desc: '',
      args: [],
    );
  }

  /// `Cấu hình mẫu chữ ký`
  String get configSignatureTemplate {
    return Intl.message(
      'Cấu hình mẫu chữ ký',
      name: 'configSignatureTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Số serial`
  String get serialNumber {
    return Intl.message(
      'Số serial',
      name: 'serialNumber',
      desc: '',
      args: [],
    );
  }

  /// `Đang hoạt động`
  String get active {
    return Intl.message(
      'Đang hoạt động',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Chờ kích hoạt`
  String get waitingForActivation {
    return Intl.message(
      'Chờ kích hoạt',
      name: 'waitingForActivation',
      desc: '',
      args: [],
    );
  }

  /// `Hết thời hạn`
  String get expired {
    return Intl.message(
      'Hết thời hạn',
      name: 'expired',
      desc: '',
      args: [],
    );
  }

  /// `Nhập {anything}`
  String enterAnything(Object anything) {
    return Intl.message(
      'Nhập $anything',
      name: 'enterAnything',
      desc: '',
      args: [anything],
    );
  }

  /// `Nhập {anything} để tiếp tục`
  String signInFieldWarning(Object anything) {
    return Intl.message(
      'Nhập $anything để tiếp tục',
      name: 'signInFieldWarning',
      desc: '',
      args: [anything],
    );
  }

  /// `Kích hoạt tài khoản`
  String get activateAccount {
    return Intl.message(
      'Kích hoạt tài khoản',
      name: 'activateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Cá nhân`
  String get personal {
    return Intl.message(
      'Cá nhân',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử giao dịch`
  String get transactionHistory {
    return Intl.message(
      'Lịch sử giao dịch',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận ký`
  String get transactions {
    return Intl.message(
      'Xác nhận ký',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Loại tài khoản`
  String get accountType {
    return Intl.message(
      'Loại tài khoản',
      name: 'accountType',
      desc: '',
      args: [],
    );
  }

  /// `CCCD/CMND`
  String get identification {
    return Intl.message(
      'CCCD/CMND',
      name: 'identification',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone {
    return Intl.message(
      'Số điện thoại',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ email`
  String get email {
    return Intl.message(
      'Địa chỉ email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính`
  String get gender {
    return Intl.message(
      'Giới tính',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get address {
    return Intl.message(
      'Địa chỉ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh`
  String get dateOfBirth {
    return Intl.message(
      'Ngày sinh',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get signOut {
    return Intl.message(
      'Đăng xuất',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin giao dịch`
  String get transactionDetail {
    return Intl.message(
      'Thông tin giao dịch',
      name: 'transactionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Ứng dụng`
  String get affiliateApplication {
    return Intl.message(
      'Ứng dụng',
      name: 'affiliateApplication',
      desc: '',
      args: [],
    );
  }

  /// `Loại giao dịch`
  String get transactionType {
    return Intl.message(
      'Loại giao dịch',
      name: 'transactionType',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian khởi tạo`
  String get initialTime {
    return Intl.message(
      'Thời gian khởi tạo',
      name: 'initialTime',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian kết thúc`
  String get finishTime {
    return Intl.message(
      'Thời gian kết thúc',
      name: 'finishTime',
      desc: '',
      args: [],
    );
  }

  /// `Quay lại`
  String get back {
    return Intl.message(
      'Quay lại',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Không xác định`
  String get unknown {
    return Intl.message(
      'Không xác định',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Ký số thành công`
  String get signedSuccess {
    return Intl.message(
      'Ký số thành công',
      name: 'signedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Hủy bỏ`
  String get canceled {
    return Intl.message(
      'Hủy bỏ',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Trình ký`
  String get signer {
    return Intl.message(
      'Trình ký',
      name: 'signer',
      desc: '',
      args: [],
    );
  }

  /// `Ký tất cả`
  String get sign {
    return Intl.message(
      'Ký tất cả',
      name: 'sign',
      desc: '',
      args: [],
    );
  }

  /// `Ký thất bại`
  String get signFailed {
    return Intl.message(
      'Ký thất bại',
      name: 'signFailed',
      desc: '',
      args: [],
    );
  }

  /// `Ký hash`
  String get hashSign {
    return Intl.message(
      'Ký hash',
      name: 'hashSign',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực`
  String get authentication {
    return Intl.message(
      'Xác thực',
      name: 'authentication',
      desc: '',
      args: [],
    );
  }

  /// `Nghiệm thu`
  String get acceptance {
    return Intl.message(
      'Nghiệm thu',
      name: 'acceptance',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt thành công`
  String get activateSuccessTitle {
    return Intl.message(
      'Kích hoạt thành công',
      name: 'activateSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số của bạn đã được kích hoạt thành công.`
  String get activateSuccessDesc {
    return Intl.message(
      'Chứng thư số của bạn đã được kích hoạt thành công.',
      name: 'activateSuccessDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ký biên bản nghiệm thu`
  String get activateButton {
    return Intl.message(
      'Ký biên bản nghiệm thu',
      name: 'activateButton',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã PIN để kích hoạt cặp khoá ký số`
  String get pinDialogTitle {
    return Intl.message(
      'Nhập mã PIN để kích hoạt cặp khoá ký số',
      name: 'pinDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get pinDialogButton {
    return Intl.message(
      'Xác nhận',
      name: 'pinDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu xác thực`
  String get biometricDialogTitle {
    return Intl.message(
      'Yêu cầu xác thực',
      name: 'biometricDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực bằng sinh trắc học`
  String get biometricDialogButton {
    return Intl.message(
      'Xác thực bằng sinh trắc học',
      name: 'biometricDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng sử dụng dấu vân tay để xác nhận`
  String get fingerprintDialogDesc {
    return Intl.message(
      'Vui lòng sử dụng dấu vân tay để xác nhận',
      name: 'fingerprintDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng sử dụng FaceID để xác nhận`
  String get faceIDDialogDesc {
    return Intl.message(
      'Vui lòng sử dụng FaceID để xác nhận',
      name: 'faceIDDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt xác thực sinh trắc học`
  String get activeBiometricAuthentication {
    return Intl.message(
      'Kích hoạt xác thực sinh trắc học',
      name: 'activeBiometricAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Trạng thái`
  String get status {
    return Intl.message(
      'Trạng thái',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Đã kích hoạt`
  String get activated {
    return Intl.message(
      'Đã kích hoạt',
      name: 'activated',
      desc: '',
      args: [],
    );
  }

  /// `Chờ sinh cặp khóa`
  String get waitingGenerateKeyPair {
    return Intl.message(
      'Chờ sinh cặp khóa',
      name: 'waitingGenerateKeyPair',
      desc: '',
      args: [],
    );
  }

  /// `Chờ kích hoạt`
  String get waitingActivate {
    return Intl.message(
      'Chờ kích hoạt',
      name: 'waitingActivate',
      desc: '',
      args: [],
    );
  }

  /// `Chờ ký Biên bản nghiệm thu`
  String get waitingSignAcceptanceMinutes {
    return Intl.message(
      'Chờ ký Biên bản nghiệm thu',
      name: 'waitingSignAcceptanceMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Chờ cấp chứng thư số`
  String get waitingGenerateCertificate {
    return Intl.message(
      'Chờ cấp chứng thư số',
      name: 'waitingGenerateCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Đang tạm dừng`
  String get suspended {
    return Intl.message(
      'Đang tạm dừng',
      name: 'suspended',
      desc: '',
      args: [],
    );
  }

  /// `Đã thu hồi`
  String get revoked {
    return Intl.message(
      'Đã thu hồi',
      name: 'revoked',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt cặp khóa`
  String get activateKeyPair {
    return Intl.message(
      'Kích hoạt cặp khóa',
      name: 'activateKeyPair',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có giao dịch`
  String get haveNotYetTransaction {
    return Intl.message(
      'Chưa có giao dịch',
      name: 'haveNotYetTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mã PIN`
  String get pinDialogConfirmSignDigitalTitle {
    return Intl.message(
      'Vui lòng nhập mã PIN',
      name: 'pinDialogConfirmSignDigitalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận hủy`
  String get confirmCancel {
    return Intl.message(
      'Xác nhận hủy',
      name: 'confirmCancel',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mã PIN để hủy giao dịch`
  String get pinDialogConfirmCancel {
    return Intl.message(
      'Vui lòng nhập mã PIN để hủy giao dịch',
      name: 'pinDialogConfirmCancel',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian yêu cầu`
  String get requestTime {
    return Intl.message(
      'Thời gian yêu cầu',
      name: 'requestTime',
      desc: '',
      args: [],
    );
  }

  /// `Ứng dụng`
  String get affiliateAppName {
    return Intl.message(
      'Ứng dụng',
      name: 'affiliateAppName',
      desc: '',
      args: [],
    );
  }

  /// `Tên file`
  String get fileName {
    return Intl.message(
      'Tên file',
      name: 'fileName',
      desc: '',
      args: [],
    );
  }

  /// `Mô tả`
  String get transactionDesc {
    return Intl.message(
      'Mô tả',
      name: 'transactionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận ký số`
  String get confirmTransaction {
    return Intl.message(
      'Xác nhận ký số',
      name: 'confirmTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Xem tài liệu`
  String get documentPreview {
    return Intl.message(
      'Xem tài liệu',
      name: 'documentPreview',
      desc: '',
      args: [],
    );
  }

  /// `Hủy giao dịch`
  String get cancelTransaction {
    return Intl.message(
      'Hủy giao dịch',
      name: 'cancelTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách tài liệu cần ký`
  String get listOfDocumentToBeSigned {
    return Intl.message(
      'Danh sách tài liệu cần ký',
      name: 'listOfDocumentToBeSigned',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mã PIN gồm 6 số.`
  String get pinValidateSixDigit {
    return Intl.message(
      'Vui lòng nhập mã PIN gồm 6 số.',
      name: 'pinValidateSixDigit',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập xác nhận mã PIN gồm 6 số.`
  String get rePinValidateSixDigit {
    return Intl.message(
      'Vui lòng nhập xác nhận mã PIN gồm 6 số.',
      name: 'rePinValidateSixDigit',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN không được là dãy số liên tiếp.`
  String get pinValidateSequence {
    return Intl.message(
      'Mã PIN không được là dãy số liên tiếp.',
      name: 'pinValidateSequence',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN không được chứa dãy số giống nhau.`
  String get pinValidateTheSame {
    return Intl.message(
      'Mã PIN không được chứa dãy số giống nhau.',
      name: 'pinValidateTheSame',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN không khớp`
  String get pinValidateNotMatch {
    return Intl.message(
      'Mã PIN không khớp',
      name: 'pinValidateNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Bước {step}`
  String noStep(Object step) {
    return Intl.message(
      'Bước $step',
      name: 'noStep',
      desc: '',
      args: [step],
    );
  }

  /// `Nhập thông tin tài khoản`
  String get enterAccountInformation {
    return Intl.message(
      'Nhập thông tin tài khoản',
      name: 'enterAccountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Mã kích hoạt`
  String get activateCode {
    return Intl.message(
      'Mã kích hoạt',
      name: 'activateCode',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get confirmPassword {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo`
  String get next {
    return Intl.message(
      'Tiếp theo',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu không khớp`
  String get passwordNotMatch {
    return Intl.message(
      'Mật khẩu không khớp',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Tạo mã PIN`
  String get createPinTitle {
    return Intl.message(
      'Tạo mã PIN',
      name: 'createPinTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo: Tạo mã PIN`
  String get nextStepPin {
    return Intl.message(
      'Tiếp theo: Tạo mã PIN',
      name: 'nextStepPin',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo mã PIN`
  String get initializePIN {
    return Intl.message(
      'Khởi tạo mã PIN',
      name: 'initializePIN',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN cá nhân được sử dụng để bảo vệ chữ ký số của bạn.`
  String get initializePINTitle {
    return Intl.message(
      'Mã PIN cá nhân được sử dụng để bảo vệ chữ ký số của bạn.',
      name: 'initializePINTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mã PIN`
  String get confirmPINTitle {
    return Intl.message(
      'Xác nhận mã PIN',
      name: 'confirmPINTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mã PIN để xác nhận`
  String get confirmPINDesc {
    return Intl.message(
      'Nhập lại mã PIN để xác nhận',
      name: 'confirmPINDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cảnh báo`
  String get warning {
    return Intl.message(
      'Cảnh báo',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get Notice {
    return Intl.message(
      'Thông báo',
      name: 'Notice',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng sinh trắc học để tăng cường tính bảo mật, bạn có đồng ý?`
  String get activateBiometricDesc {
    return Intl.message(
      'Sử dụng sinh trắc học để tăng cường tính bảo mật, bạn có đồng ý?',
      name: 'activateBiometricDesc',
      desc: '',
      args: [],
    );
  }

  /// `Từ chối`
  String get reject {
    return Intl.message(
      'Từ chối',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Đồng ý`
  String get agree {
    return Intl.message(
      'Đồng ý',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản chưa được kích hoạt cặp khóa`
  String get activateTransactionNotSignKeypair {
    return Intl.message(
      'Tài khoản chưa được kích hoạt cặp khóa',
      name: 'activateTransactionNotSignKeypair',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản chưa ký biên bản nghiệm thu`
  String get activateTransactionNotSignAcceptanceMinutes {
    return Intl.message(
      'Tài khoản chưa ký biên bản nghiệm thu',
      name: 'activateTransactionNotSignAcceptanceMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Ký biên bản nghiệm thu`
  String get signBbnt {
    return Intl.message(
      'Ký biên bản nghiệm thu',
      name: 'signBbnt',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo: Ký biên bản nghiệm thu`
  String get nextSignBbnt {
    return Intl.message(
      'Tiếp theo: Ký biên bản nghiệm thu',
      name: 'nextSignBbnt',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian ký còn lại`
  String get remainTimeToSign {
    return Intl.message(
      'Thời gian ký còn lại',
      name: 'remainTimeToSign',
      desc: '',
      args: [],
    );
  }

  /// `Kích thước`
  String get size {
    return Intl.message(
      'Kích thước',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian`
  String get time {
    return Intl.message(
      'Thời gian',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Xem thông tin giao dịch`
  String get viewTransactionInfo {
    return Intl.message(
      'Xem thông tin giao dịch',
      name: 'viewTransactionInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng sử dụng sinh trắc học để {purpose}`
  String requestBiometricDesc(Object purpose) {
    return Intl.message(
      'Vui lòng sử dụng sinh trắc học để $purpose',
      name: 'requestBiometricDesc',
      desc: '',
      args: [purpose],
    );
  }

  /// `Tiếp tục`
  String get Continue {
    return Intl.message(
      'Tiếp tục',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Không thể xác thực ứng dụng.`
  String get serviceCannotVerifyApp {
    return Intl.message(
      'Không thể xác thực ứng dụng.',
      name: 'serviceCannotVerifyApp',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực App lỗi.`
  String get serviceVerifyAppFail {
    return Intl.message(
      'Xác thực App lỗi.',
      name: 'serviceVerifyAppFail',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi kết nối. Vui lòng kiểm tra lại kết nối mạng.`
  String get serviceLostConnection {
    return Intl.message(
      'Lỗi kết nối. Vui lòng kiểm tra lại kết nối mạng.',
      name: 'serviceLostConnection',
      desc: '',
      args: [],
    );
  }

  /// `Phiên đã hết hạn. Vui lòng đăng nhập lại.`
  String get serviceExpireToken {
    return Intl.message(
      'Phiên đã hết hạn. Vui lòng đăng nhập lại.',
      name: 'serviceExpireToken',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy accessToken.`
  String get serviceNoAccessTokenFound {
    return Intl.message(
      'Không tìm thấy accessToken.',
      name: 'serviceNoAccessTokenFound',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy thiết bị.`
  String get serviceNotFoundDevice {
    return Intl.message(
      'Không tìm thấy thiết bị.',
      name: 'serviceNotFoundDevice',
      desc: '',
      args: [],
    );
  }

  /// `Không thể đăng ký nhận thông báo.`
  String get serviceNotFoundFCMToken {
    return Intl.message(
      'Không thể đăng ký nhận thông báo.',
      name: 'serviceNotFoundFCMToken',
      desc: '',
      args: [],
    );
  }

  /// `Thiết bị của bạn không đủ an toàn để khởi chạy ứng dụng.`
  String get notSecureDevice {
    return Intl.message(
      'Thiết bị của bạn không đủ an toàn để khởi chạy ứng dụng.',
      name: 'notSecureDevice',
      desc: '',
      args: [],
    );
  }

  /// `Nam`
  String get male {
    return Intl.message(
      'Nam',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Nữ`
  String get female {
    return Intl.message(
      'Nữ',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Doanh nghiệp`
  String get business {
    return Intl.message(
      'Doanh nghiệp',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Cá nhân trong doanh nghiệp`
  String get personalInBusiness {
    return Intl.message(
      'Cá nhân trong doanh nghiệp',
      name: 'personalInBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Giao dịch của bạn đã được ký thành công`
  String get signTransactionDone {
    return Intl.message(
      'Giao dịch của bạn đã được ký thành công',
      name: 'signTransactionDone',
      desc: '',
      args: [],
    );
  }

  /// `Đã hủy bỏ giao dịch`
  String get cancelTransactionDone {
    return Intl.message(
      'Đã hủy bỏ giao dịch',
      name: 'cancelTransactionDone',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử`
  String get history {
    return Intl.message(
      'Lịch sử',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `{anything}`
  String anything(Object anything) {
    return Intl.message(
      '$anything',
      name: 'anything',
      desc: '',
      args: [anything],
    );
  }

  /// `Token không hợp lệ.`
  String get invalidToken {
    return Intl.message(
      'Token không hợp lệ.',
      name: 'invalidToken',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư chưa được đăng ký trên thiết bị. Bạn có muốn đăng ký chứng thư số trên thiết bị này không?`
  String get KAKNotFound {
    return Intl.message(
      'Chứng thư chưa được đăng ký trên thiết bị. Bạn có muốn đăng ký chứng thư số trên thiết bị này không?',
      name: 'KAKNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN không hợp lệ.`
  String get invalidPIN {
    return Intl.message(
      'Mã PIN không hợp lệ.',
      name: 'invalidPIN',
      desc: '',
      args: [],
    );
  }

  /// `Tính toán xác thực lỗi.`
  String get calAuthDataFail {
    return Intl.message(
      'Tính toán xác thực lỗi.',
      name: 'calAuthDataFail',
      desc: '',
      args: [],
    );
  }

  /// `Không thể lấy thông tin thiết bị.`
  String get cannotGetDeviceInfo {
    return Intl.message(
      'Không thể lấy thông tin thiết bị.',
      name: 'cannotGetDeviceInfo',
      desc: '',
      args: [],
    );
  }

  /// `Token đã hết hạn.`
  String get tokenExpired {
    return Intl.message(
      'Token đã hết hạn.',
      name: 'tokenExpired',
      desc: '',
      args: [],
    );
  }

  /// `Không thể ký khóa.`
  String get cannotSignKeyChallenge {
    return Intl.message(
      'Không thể ký khóa.',
      name: 'cannotSignKeyChallenge',
      desc: '',
      args: [],
    );
  }

  /// `PIN của bạn đã bị khóa do nhập sai nhiều lần.`
  String get serviceLockPINOverEnter {
    return Intl.message(
      'PIN của bạn đã bị khóa do nhập sai nhiều lần.',
      name: 'serviceLockPINOverEnter',
      desc: '',
      args: [],
    );
  }

  /// `Ký lỗi`
  String get signError {
    return Intl.message(
      'Ký lỗi',
      name: 'signError',
      desc: '',
      args: [],
    );
  }

  /// `Hủy bỏ lỗi`
  String get serviceRejectFail {
    return Intl.message(
      'Hủy bỏ lỗi',
      name: 'serviceRejectFail',
      desc: '',
      args: [],
    );
  }

  /// `Không tồn tại lịch sử giao dịch.`
  String get serviceNotExistedTransactionHis {
    return Intl.message(
      'Không tồn tại lịch sử giao dịch.',
      name: 'serviceNotExistedTransactionHis',
      desc: '',
      args: [],
    );
  }

  /// `Không tồn tại thông tin người dùng.`
  String get serviceNotExistedUserInfo {
    return Intl.message(
      'Không tồn tại thông tin người dùng.',
      name: 'serviceNotExistedUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `Sinh khóa bảo vệ(KAK) không thành công.`
  String get serviceGenerateKAKFail {
    return Intl.message(
      'Sinh khóa bảo vệ(KAK) không thành công.',
      name: 'serviceGenerateKAKFail',
      desc: '',
      args: [],
    );
  }

  /// `Generating KAK`
  String get serviceGeneratingKAK {
    return Intl.message(
      'Generating KAK',
      name: 'serviceGeneratingKAK',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng 8-30 ký tự bao gồm chữ hoa, chữ thường, số, ký tự đặc biệt ~!@#$%^&*_-+='|(){}[]:;”<>,.?/`
  String get strongPasswordValid {
    return Intl.message(
      'Sử dụng 8-30 ký tự bao gồm chữ hoa, chữ thường, số, ký tự đặc biệt ~!@#\$%^&*_-+=`|(){}[]:;”<>,.?/',
      name: 'strongPasswordValid',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt chung`
  String get settings {
    return Intl.message(
      'Cài đặt chung',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Ngôn ngữ`
  String get language {
    return Intl.message(
      'Ngôn ngữ',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Việt`
  String get vietnamese {
    return Intl.message(
      'Tiếng Việt',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật`
  String get update {
    return Intl.message(
      'Cập nhật',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Để sau`
  String get maybeLater {
    return Intl.message(
      'Để sau',
      name: 'maybeLater',
      desc: '',
      args: [],
    );
  }

  /// `Đã có phiên bản mới`
  String get updateVersionMsg {
    return Intl.message(
      'Đã có phiên bản mới',
      name: 'updateVersionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đang sử dụng phiên bản mới nhất.`
  String get versionNewest {
    return Intl.message(
      'Bạn đang sử dụng phiên bản mới nhất.',
      name: 'versionNewest',
      desc: '',
      args: [],
    );
  }

  /// `VNPT SmartCA phiên bản {version}`
  String versionNumber(Object version) {
    return Intl.message(
      'VNPT SmartCA phiên bản $version',
      name: 'versionNumber',
      desc: '',
      args: [version],
    );
  }

  /// `Chủ thể`
  String get subject {
    return Intl.message(
      'Chủ thể',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Nhà phát hành`
  String get issuer {
    return Intl.message(
      'Nhà phát hành',
      name: 'issuer',
      desc: '',
      args: [],
    );
  }

  /// `Số sê-ri`
  String get serial {
    return Intl.message(
      'Số sê-ri',
      name: 'serial',
      desc: '',
      args: [],
    );
  }

  /// `Hiệu lực`
  String get validity {
    return Intl.message(
      'Hiệu lực',
      name: 'validity',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có chắc chắn muốn đăng xuất khỏi thiết bị này không?`
  String get signOutConfirm {
    return Intl.message(
      'Bạn có chắc chắn muốn đăng xuất khỏi thiết bị này không?',
      name: 'signOutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `MST`
  String get taxCode {
    return Intl.message(
      'MST',
      name: 'taxCode',
      desc: '',
      args: [],
    );
  }

  /// `Đang lấy thông tin chứng thư...`
  String get gettingCert {
    return Intl.message(
      'Đang lấy thông tin chứng thư...',
      name: 'gettingCert',
      desc: '',
      args: [],
    );
  }

  /// `Đang kích hoạt chứng thư...`
  String get activingCert {
    return Intl.message(
      'Đang kích hoạt chứng thư...',
      name: 'activingCert',
      desc: '',
      args: [],
    );
  }

  /// `Đang xử lý, vui lòng đợi trong giây lát...`
  String get activingKey {
    return Intl.message(
      'Đang xử lý, vui lòng đợi trong giây lát...',
      name: 'activingKey',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo: Kích hoạt cặp khóa`
  String get nextAssignKey {
    return Intl.message(
      'Tiếp theo: Kích hoạt cặp khóa',
      name: 'nextAssignKey',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu`
  String get changePassword {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Loại CTS`
  String get typeOfCertificate {
    return Intl.message(
      'Loại CTS',
      name: 'typeOfCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu cũ`
  String get oldPassword {
    return Intl.message(
      'Mật khẩu cũ',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu mới`
  String get newPassword {
    return Intl.message(
      'Mật khẩu mới',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu mới`
  String get confirmNewPassword {
    return Intl.message(
      'Xác nhận mật khẩu mới',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu đã thay đổi. Vui lòng đăng nhập lại.`
  String get noticeWhenPasswordChange {
    return Intl.message(
      'Mật khẩu đã thay đổi. Vui lòng đăng nhập lại.',
      name: 'noticeWhenPasswordChange',
      desc: '',
      args: [],
    );
  }

  /// `Đã sao chép.`
  String get copied {
    return Intl.message(
      'Đã sao chép.',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu mới trùng với mật khẩu cũ.`
  String get passwordDuplicate {
    return Intl.message(
      'Mật khẩu mới trùng với mật khẩu cũ.',
      name: 'passwordDuplicate',
      desc: '',
      args: [],
    );
  }

  /// `Sai mật khẩu cũ.`
  String get oldPasswordWrong {
    return Intl.message(
      'Sai mật khẩu cũ.',
      name: 'oldPasswordWrong',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy thông tin người dùng`
  String get notFoundUid {
    return Intl.message(
      'Không tìm thấy thông tin người dùng',
      name: 'notFoundUid',
      desc: '',
      args: [],
    );
  }

  /// `Tổng đài CSKH`
  String get contactCustomerCare {
    return Intl.message(
      'Tổng đài CSKH',
      name: 'contactCustomerCare',
      desc: '',
      args: [],
    );
  }

  /// `Đang tải...`
  String get loading {
    return Intl.message(
      'Đang tải...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Kéo lên để tải thêm`
  String get idleLoading {
    return Intl.message(
      'Kéo lên để tải thêm',
      name: 'idleLoading',
      desc: '',
      args: [],
    );
  }

  /// `Thả xuống để tải thêm`
  String get canLoading {
    return Intl.message(
      'Thả xuống để tải thêm',
      name: 'canLoading',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đồng ý với `
  String get iAgreeWith {
    return Intl.message(
      'Tôi đồng ý với ',
      name: 'iAgreeWith',
      desc: '',
      args: [],
    );
  }

  /// `điều khoản sử dụng dịch vụ`
  String get termOfUseService {
    return Intl.message(
      'điều khoản sử dụng dịch vụ',
      name: 'termOfUseService',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có giao dịch cần xác nhận ký số.`
  String get emptyDescTransaction {
    return Intl.message(
      'Chưa có giao dịch cần xác nhận ký số.',
      name: 'emptyDescTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Đang xử lý, vui lòng đợi trong giây lát..`
  String get checkingInfor {
    return Intl.message(
      'Đang xử lý, vui lòng đợi trong giây lát..',
      name: 'checkingInfor',
      desc: '',
      args: [],
    );
  }

  /// `Đang lấy thông tin chứng thư`
  String get loadingCert {
    return Intl.message(
      'Đang lấy thông tin chứng thư',
      name: 'loadingCert',
      desc: '',
      args: [],
    );
  }

  /// `Đang xử lý, vui lòng đợi trong giây lát...`
  String get progressProcessing {
    return Intl.message(
      'Đang xử lý, vui lòng đợi trong giây lát...',
      name: 'progressProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Hotline`
  String get hotline {
    return Intl.message(
      'Hotline',
      name: 'hotline',
      desc: '',
      args: [],
    );
  }

  /// `Chờ xác nhận`
  String get waitingForSignerConfirm {
    return Intl.message(
      'Chờ xác nhận',
      name: 'waitingForSignerConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Ngày giao dịch`
  String get transactionDate {
    return Intl.message(
      'Ngày giao dịch',
      name: 'transactionDate',
      desc: '',
      args: [],
    );
  }

  /// `Trạng thái`
  String get transactionStatus {
    return Intl.message(
      'Trạng thái',
      name: 'transactionStatus',
      desc: '',
      args: [],
    );
  }

  /// `Hiện tại ứng dụng chưa hỗ trợ xem trước định dạng `
  String get notSupportExt {
    return Intl.message(
      'Hiện tại ứng dụng chưa hỗ trợ xem trước định dạng ',
      name: 'notSupportExt',
      desc: '',
      args: [],
    );
  }

  /// `Tổng số: {total} kết quả`
  String totalRecord(Object total) {
    return Intl.message(
      'Tổng số: $total kết quả',
      name: 'totalRecord',
      desc: '',
      args: [total],
    );
  }

  /// `Tài khoản`
  String get account {
    return Intl.message(
      'Tài khoản',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian kết nối quá lâu.`
  String get connectTimeout {
    return Intl.message(
      'Thời gian kết nối quá lâu.',
      name: 'connectTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Không nhận dạng được dữ liệu JSON`
  String get unrecognized_json {
    return Intl.message(
      'Không nhận dạng được dữ liệu JSON',
      name: 'unrecognized_json',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đang chạy ứng dụng trên thiết bị ảo. Vui lòng cài đặt ứng dụng trên thiết bị thật.`
  String get notPhysicalDevice {
    return Intl.message(
      'Bạn đang chạy ứng dụng trên thiết bị ảo. Vui lòng cài đặt ứng dụng trên thiết bị thật.',
      name: 'notPhysicalDevice',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản của bạn chưa có trên hệ thống. Vui lòng đăng ký tích hợp để sử dụng SDK.`
  String get partnerNotRegister {
    return Intl.message(
      'Tài khoản của bạn chưa có trên hệ thống. Vui lòng đăng ký tích hợp để sử dụng SDK.',
      name: 'partnerNotRegister',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN`
  String get pinCode {
    return Intl.message(
      'Mã PIN',
      name: 'pinCode',
      desc: '',
      args: [],
    );
  }

  /// `Có lỗi trong quá trình làm mới token.`
  String get refreshTokenFailed {
    return Intl.message(
      'Có lỗi trong quá trình làm mới token.',
      name: 'refreshTokenFailed',
      desc: '',
      args: [],
    );
  }

  /// `Lấy thông tin đăng nhập thất bại.`
  String get getAuthenticationFailed {
    return Intl.message(
      'Lấy thông tin đăng nhập thất bại.',
      name: 'getAuthenticationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Chưa xác thực đăng nhập tài khoản.`
  String get notAuthenticated {
    return Intl.message(
      'Chưa xác thực đăng nhập tài khoản.',
      name: 'notAuthenticated',
      desc: '',
      args: [],
    );
  }

  /// `- Chỉ dùng khi thay đổi sang tài khoản khác trên thiết bị này\n- Thông tin của tài sẽ bị xóa, Bạn sẽ quay trở lại màn hình kích hoạt tài khoản!`
  String get alertDelRegDevice {
    return Intl.message(
      '- Chỉ dùng khi thay đổi sang tài khoản khác trên thiết bị này\n- Thông tin của tài sẽ bị xóa, Bạn sẽ quay trở lại màn hình kích hoạt tài khoản!',
      name: 'alertDelRegDevice',
      desc: '',
      args: [],
    );
  }

  /// `Tham số không đúng.`
  String get invalidParameter {
    return Intl.message(
      'Tham số không đúng.',
      name: 'invalidParameter',
      desc: '',
      args: [],
    );
  }

  /// `Không có file để xem trước`
  String get listFileEmpty {
    return Intl.message(
      'Không có file để xem trước',
      name: 'listFileEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Đang hoạt động`
  String get activing {
    return Intl.message(
      'Đang hoạt động',
      name: 'activing',
      desc: '',
      args: [],
    );
  }

  /// `Làm mới`
  String get clear {
    return Intl.message(
      'Làm mới',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Vẽ chữ ký của bạn`
  String get drawYourSignature {
    return Intl.message(
      'Vẽ chữ ký của bạn',
      name: 'drawYourSignature',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng vẽ Chữ ký của bạn`
  String get pleaseDrawSign {
    return Intl.message(
      'Vui lòng vẽ Chữ ký của bạn',
      name: 'pleaseDrawSign',
      desc: '',
      args: [],
    );
  }

  /// `Mã thiết bị`
  String get deviceId {
    return Intl.message(
      'Mã thiết bị',
      name: 'deviceId',
      desc: '',
      args: [],
    );
  }

  /// `Ký số theo QĐ-769-BTTTT`
  String get signToQD769 {
    return Intl.message(
      'Ký số theo QĐ-769-BTTTT',
      name: 'signToQD769',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách đã ký`
  String get listsigned {
    return Intl.message(
      'Danh sách đã ký',
      name: 'listsigned',
      desc: '',
      args: [],
    );
  }

  /// `Không hỗ trợ xem tài liệu Ký hash!`
  String get viewFileHash {
    return Intl.message(
      'Không hỗ trợ xem tài liệu Ký hash!',
      name: 'viewFileHash',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin lịch sử giao dịch`
  String get transactionhistoryinfo {
    return Intl.message(
      'Thông tin lịch sử giao dịch',
      name: 'transactionhistoryinfo',
      desc: '',
      args: [],
    );
  }

  /// `Để bảo vệ mã PIN của bạn vui lòng sử dụng thiết bị có hỗ trợ sinh trắc học và kích hoạt tính năng này`
  String get bio_protect_pin {
    return Intl.message(
      'Để bảo vệ mã PIN của bạn vui lòng sử dụng thiết bị có hỗ trợ sinh trắc học và kích hoạt tính năng này',
      name: 'bio_protect_pin',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng sinh trắc học`
  String get active_bio {
    return Intl.message(
      'Sử dụng sinh trắc học',
      name: 'active_bio',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản của Quý khách cần xác minh thông tin đăng ký, vui lòng chuẩn bị:`
  String get introEkycTitle {
    return Intl.message(
      'Tài khoản của Quý khách cần xác minh thông tin đăng ký, vui lòng chuẩn bị:',
      name: 'introEkycTitle',
      desc: '',
      args: [],
    );
  }

  /// `Giấy chứng nhận đăng ký kinh doanh bản gốc`
  String get certBusinessRegistration {
    return Intl.message(
      'Giấy chứng nhận đăng ký kinh doanh bản gốc',
      name: 'certBusinessRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Giấy CMND/Thẻ CCCD bản gốc, còn hiệu lực, không scan/photocopy`
  String get idEkyc {
    return Intl.message(
      'Giấy CMND/Thẻ CCCD bản gốc, còn hiệu lực, không scan/photocopy',
      name: 'idEkyc',
      desc: '',
      args: [],
    );
  }

  /// `Giấy CMND / Thẻ CCCD bản gốc, còn hiệu lực của Người đại diện pháp luật`
  String get idRepreEkyc {
    return Intl.message(
      'Giấy CMND / Thẻ CCCD bản gốc, còn hiệu lực của Người đại diện pháp luật',
      name: 'idRepreEkyc',
      desc: '',
      args: [],
    );
  }

  /// `Đối chiếu khuôn mặt với ảnh CMND/CCCD`
  String get certRequester {
    return Intl.message(
      'Đối chiếu khuôn mặt với ảnh CMND/CCCD',
      name: 'certRequester',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý chụp ảnh giấy tờ:`
  String get noteEkyc {
    return Intl.message(
      'Lưu ý chụp ảnh giấy tờ:',
      name: 'noteEkyc',
      desc: '',
      args: [],
    );
  }

  /// `Không chụp ảnh quá mờ`
  String get blurryPhotos {
    return Intl.message(
      'Không chụp ảnh quá mờ',
      name: 'blurryPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Không chụp mất góc`
  String get missingCorner {
    return Intl.message(
      'Không chụp mất góc',
      name: 'missingCorner',
      desc: '',
      args: [],
    );
  }

  /// `Không chụp quá lóa sáng`
  String get backLighting {
    return Intl.message(
      'Không chụp quá lóa sáng',
      name: 'backLighting',
      desc: '',
      args: [],
    );
  }

  /// `VNPT SmartCA đã tiếp nhận hồ sơ của quý khách, vui lòng chờ VNPT SmartCA thẩm định hồ sơ và cấp chứng thư số.`
  String get waitingForApproval {
    return Intl.message(
      'VNPT SmartCA đã tiếp nhận hồ sơ của quý khách, vui lòng chờ VNPT SmartCA thẩm định hồ sơ và cấp chứng thư số.',
      name: 'waitingForApproval',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận thông tin của bạn gặp sự cố đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ`
  String get alertApproval {
    return Intl.message(
      'Xác nhận thông tin của bạn gặp sự cố đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ',
      name: 'alertApproval',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin đăng ký cấp Chứng thư`
  String get confirmInfo {
    return Intl.message(
      'Thông tin đăng ký cấp Chứng thư',
      name: 'confirmInfo',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên`
  String get fullName {
    return Intl.message(
      'Họ tên',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Quốc tịch`
  String get nationality {
    return Intl.message(
      'Quốc tịch',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh/TP`
  String get province {
    return Intl.message(
      'Tỉnh/TP',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Quận/Huyện`
  String get district {
    return Intl.message(
      'Quận/Huyện',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Phường/Xã`
  String get wards {
    return Intl.message(
      'Phường/Xã',
      name: 'wards',
      desc: '',
      args: [],
    );
  }

  /// `Phiếu yêu cầu cung cấp dịch vụ`
  String get serviceRequestForm {
    return Intl.message(
      'Phiếu yêu cầu cung cấp dịch vụ',
      name: 'serviceRequestForm',
      desc: '',
      args: [],
    );
  }

  /// `Ký xác nhận`
  String get signConfirm {
    return Intl.message(
      'Ký xác nhận',
      name: 'signConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Gửi yêu cầu cấp Chứng thư số thành công. Vui lòng kiểm tra email sau ít phút để kích hoạt dịch vụ.`
  String get sentServiceRequestSuccess {
    return Intl.message(
      'Gửi yêu cầu cấp Chứng thư số thành công. Vui lòng kiểm tra email sau ít phút để kích hoạt dịch vụ.',
      name: 'sentServiceRequestSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cấp`
  String get issueDate {
    return Intl.message(
      'Ngày cấp',
      name: 'issueDate',
      desc: '',
      args: [],
    );
  }

  /// `Nơi cấp`
  String get placeOfIssue {
    return Intl.message(
      'Nơi cấp',
      name: 'placeOfIssue',
      desc: '',
      args: [],
    );
  }

  /// `Thôn/Xóm`
  String get streetName {
    return Intl.message(
      'Thôn/Xóm',
      name: 'streetName',
      desc: '',
      args: [],
    );
  }

  /// `Không có dữ liệu`
  String get emptyData {
    return Intl.message(
      'Không có dữ liệu',
      name: 'emptyData',
      desc: '',
      args: [],
    );
  }

  /// `Chọn dữ liệu`
  String get selectData {
    return Intl.message(
      'Chọn dữ liệu',
      name: 'selectData',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu xác thực`
  String get bioSignInTitle {
    return Intl.message(
      'Yêu cầu xác thực',
      name: 'bioSignInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực danh tính`
  String get bioHint {
    return Intl.message(
      'Xác thực danh tính',
      name: 'bioHint',
      desc: '',
      args: [],
    );
  }

  /// `Nhận dạng không thành công`
  String get bioNotRecognized {
    return Intl.message(
      'Nhận dạng không thành công',
      name: 'bioNotRecognized',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu xác thực sinh trắc học`
  String get bioRequiredTitle {
    return Intl.message(
      'Yêu cầu xác thực sinh trắc học',
      name: 'bioRequiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực thành công`
  String get biometricSuccess {
    return Intl.message(
      'Xác thực thành công',
      name: 'biometricSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Tạo khóa gán thông tin xác thực không thành công!`
  String get err61000 {
    return Intl.message(
      'Tạo khóa gán thông tin xác thực không thành công!',
      name: 'err61000',
      desc: '',
      args: [],
    );
  }

  /// `Giao dịch đang chờ ký không thể xem!`
  String get transPending {
    return Intl.message(
      'Giao dịch đang chờ ký không thể xem!',
      name: 'transPending',
      desc: '',
      args: [],
    );
  }

  /// `Giao dịch đã hết hạn hoặc bị hủy không thể xem!`
  String get transExpired {
    return Intl.message(
      'Giao dịch đã hết hạn hoặc bị hủy không thể xem!',
      name: 'transExpired',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin mua gói lượt ký`
  String get information_buy_packages {
    return Intl.message(
      'Thông tin mua gói lượt ký',
      name: 'information_buy_packages',
      desc: '',
      args: [],
    );
  }

  /// `Tên gói:`
  String get product_name {
    return Intl.message(
      'Tên gói:',
      name: 'product_name',
      desc: '',
      args: [],
    );
  }

  /// `Số lượng:`
  String get product_quantity {
    return Intl.message(
      'Số lượng:',
      name: 'product_quantity',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá:`
  String get product_price {
    return Intl.message(
      'Đơn giá:',
      name: 'product_price',
      desc: '',
      args: [],
    );
  }

  /// `Thành tiền:`
  String get product_money {
    return Intl.message(
      'Thành tiền:',
      name: 'product_money',
      desc: '',
      args: [],
    );
  }

  /// `Lượt ký`
  String get service_pack_signatures {
    return Intl.message(
      'Lượt ký',
      name: 'service_pack_signatures',
      desc: '',
      args: [],
    );
  }

  /// `Tổng thanh toán`
  String get service_pack_total_amount {
    return Intl.message(
      'Tổng thanh toán',
      name: 'service_pack_total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Tổng lượt ký:`
  String get service_pack_total_signature {
    return Intl.message(
      'Tổng lượt ký:',
      name: 'service_pack_total_signature',
      desc: '',
      args: [],
    );
  }

  /// `(Đã bao gồm 10% VAT)`
  String get service_pack_vat_included {
    return Intl.message(
      '(Đã bao gồm 10% VAT)',
      name: 'service_pack_vat_included',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán`
  String get btnPayment {
    return Intl.message(
      'Thanh toán',
      name: 'btnPayment',
      desc: '',
      args: [],
    );
  }

  /// `Trạng thái:`
  String get service_pack_order_status {
    return Intl.message(
      'Trạng thái:',
      name: 'service_pack_order_status',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo lại gói lượt ký`
  String get re_create_service_order {
    return Intl.message(
      'Khởi tạo lại gói lượt ký',
      name: 're_create_service_order',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử mua gói lượt ký`
  String get order_history_page_title {
    return Intl.message(
      'Lịch sử mua gói lượt ký',
      name: 'order_history_page_title',
      desc: '',
      args: [],
    );
  }

  /// `CTS của khách hàng đã bị thu hồi. Vui lòng đăng ký chứng thư mới để thực hiện mua lượt ký.`
  String get revoked_alter_message {
    return Intl.message(
      'CTS của khách hàng đã bị thu hồi. Vui lòng đăng ký chứng thư mới để thực hiện mua lượt ký.',
      name: 'revoked_alter_message',
      desc: '',
      args: [],
    );
  }

  /// `CTS của khách hàng đã hết thời hạn sử dụng. Vui lòng thực hiện đăng ký cấp mới chứng thư số để tiếp tục sử dụng dịch vụ mua lượt ký.`
  String get expired_alter_message {
    return Intl.message(
      'CTS của khách hàng đã hết thời hạn sử dụng. Vui lòng thực hiện đăng ký cấp mới chứng thư số để tiếp tục sử dụng dịch vụ mua lượt ký.',
      name: 'expired_alter_message',
      desc: '',
      args: [],
    );
  }

  /// `CTS của khách hàng đang tạm dừng. Vui lòng liên hệ quản trị viên để được hỗ trợ.`
  String get suspended_alter_message {
    return Intl.message(
      'CTS của khách hàng đang tạm dừng. Vui lòng liên hệ quản trị viên để được hỗ trợ.',
      name: 'suspended_alter_message',
      desc: '',
      args: [],
    );
  }

  /// `Không có gói lượt ký nào được chọn`
  String get create_order_no_data_selected {
    return Intl.message(
      'Không có gói lượt ký nào được chọn',
      name: 'create_order_no_data_selected',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Không lấy được thông tin gói lượt ký.`
  String get service_pack_get_failed {
    return Intl.message(
      'Lỗi: Không lấy được thông tin gói lượt ký.',
      name: 'service_pack_get_failed',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Tích hợp thanh toán không thành công.`
  String get service_pack_payment_failed {
    return Intl.message(
      'Lỗi: Tích hợp thanh toán không thành công.',
      name: 'service_pack_payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Đặt hàng không thành công.`
  String get service_pack_create_order_failed {
    return Intl.message(
      'Lỗi: Đặt hàng không thành công.',
      name: 'service_pack_create_order_failed',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo gói lượt ký thành công!`
  String get notify_extend_personal_sign_success {
    return Intl.message(
      'Khởi tạo gói lượt ký thành công!',
      name: 'notify_extend_personal_sign_success',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán đơn hàng`
  String get page_servive_pack_order_title {
    return Intl.message(
      'Thanh toán đơn hàng',
      name: 'page_servive_pack_order_title',
      desc: '',
      args: [],
    );
  }

  /// `Quý khách mua gói lượt ký thành công.`
  String get page_servive_pack_order_desc {
    return Intl.message(
      'Quý khách mua gói lượt ký thành công.',
      name: 'page_servive_pack_order_desc',
      desc: '',
      args: [],
    );
  }

  /// `Xem lịch sử mua gói lượt ký`
  String get link_view_service_pack_order_history_page {
    return Intl.message(
      'Xem lịch sử mua gói lượt ký',
      name: 'link_view_service_pack_order_history_page',
      desc: '',
      args: [],
    );
  }

  /// `Mua thành công`
  String get order_success {
    return Intl.message(
      'Mua thành công',
      name: 'order_success',
      desc: '',
      args: [],
    );
  }

  /// `Đã hủy`
  String get order_canceled {
    return Intl.message(
      'Đã hủy',
      name: 'order_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Chờ khởi tạo`
  String get order_paid {
    return Intl.message(
      'Chờ khởi tạo',
      name: 'order_paid',
      desc: '',
      args: [],
    );
  }

  /// `Chờ khởi tạo`
  String get order_new {
    return Intl.message(
      'Chờ khởi tạo',
      name: 'order_new',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn gói lượt ký để tiếp tục`
  String get empty_description {
    return Intl.message(
      'Vui lòng chọn gói lượt ký để tiếp tục',
      name: 'empty_description',
      desc: '',
      args: [],
    );
  }

  /// `Số lượt ký chưa sử dụng`
  String get unuseds_ignatures {
    return Intl.message(
      'Số lượt ký chưa sử dụng',
      name: 'unuseds_ignatures',
      desc: '',
      args: [],
    );
  }

  /// `Mua lượt ký`
  String get buy_signature {
    return Intl.message(
      'Mua lượt ký',
      name: 'buy_signature',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản của bạn không được mua lượt ký!`
  String get service_pack_reject_message {
    return Intl.message(
      'Tài khoản của bạn không được mua lượt ký!',
      name: 'service_pack_reject_message',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng thử lại!`
  String get tryAgain {
    return Intl.message(
      'Vui lòng thử lại!',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực EKYC không thành công`
  String get ekycFail {
    return Intl.message(
      'Xác thực EKYC không thành công',
      name: 'ekycFail',
      desc: '',
      args: [],
    );
  }

  /// `Thành công!`
  String get successNotirce {
    return Intl.message(
      'Thành công!',
      name: 'successNotirce',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt lại tài khoản?`
  String get reactivateAccount {
    return Intl.message(
      'Kích hoạt lại tài khoản?',
      name: 'reactivateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có muốn thoát quá trình kích hoạt lại tài khoản hay không?`
  String get sureToQuitReactive {
    return Intl.message(
      'Bạn có muốn thoát quá trình kích hoạt lại tài khoản hay không?',
      name: 'sureToQuitReactive',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng kích hoạt lại tài khoản khi:\n - Tài khoản đã kích hoạt trước đó\n - Muốn thay đổi thiết bị, mất thiết bị, quên mã PIN hoặc mất thông tin khóa xác thực.`
  String get reactivation_notified {
    return Intl.message(
      'Sử dụng kích hoạt lại tài khoản khi:\n - Tài khoản đã kích hoạt trước đó\n - Muốn thay đổi thiết bị, mất thiết bị, quên mã PIN hoặc mất thông tin khóa xác thực.',
      name: 'reactivation_notified',
      desc: '',
      args: [],
    );
  }

  /// `Mã kích hoạt đã được gửi về email của bạn`
  String get activeCodeSent {
    return Intl.message(
      'Mã kích hoạt đã được gửi về email của bạn',
      name: 'activeCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `Chụp lại`
  String get Retake {
    return Intl.message(
      'Chụp lại',
      name: 'Retake',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi mật khẩu thành công`
  String get changePassSuccess {
    return Intl.message(
      'Thay đổi mật khẩu thành công',
      name: 'changePassSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu thay đổi không thành công`
  String get reactiveFail {
    return Intl.message(
      'Yêu cầu thay đổi không thành công',
      name: 'reactiveFail',
      desc: '',
      args: [],
    );
  }

  /// ` Trường mật khẩu cũ không được để trống`
  String get oldPassIsEmpty {
    return Intl.message(
      ' Trường mật khẩu cũ không được để trống',
      name: 'oldPassIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Trường mật khẩu mới không được để trống`
  String get newPassIsEmpty {
    return Intl.message(
      'Trường mật khẩu mới không được để trống',
      name: 'newPassIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Trường xác nhận lại mật khẩu mới không được để trống`
  String get confirmPassIsEmpty {
    return Intl.message(
      'Trường xác nhận lại mật khẩu mới không được để trống',
      name: 'confirmPassIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Chọn tài liệu ký số`
  String get chooseDocumentToSign {
    return Intl.message(
      'Chọn tài liệu ký số',
      name: 'chooseDocumentToSign',
      desc: '',
      args: [],
    );
  }

  /// `Kích thước tối đa: 15MB`
  String get maxSizeUpload {
    return Intl.message(
      'Kích thước tối đa: 15MB',
      name: 'maxSizeUpload',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ CSKH:`
  String get contactCSKH {
    return Intl.message(
      'Liên hệ CSKH:',
      name: 'contactCSKH',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số định danh đã đăng ký Chứng thư số`
  String get enterIdNumber {
    return Intl.message(
      'Nhập số định danh đã đăng ký Chứng thư số',
      name: 'enterIdNumber',
      desc: '',
      args: [],
    );
  }

  /// `Hướng dẫn kích hoạt`
  String get activationTutorial {
    return Intl.message(
      'Hướng dẫn kích hoạt',
      name: 'activationTutorial',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số cá nhân`
  String get ctsPersonal {
    return Intl.message(
      'Chứng thư số cá nhân',
      name: 'ctsPersonal',
      desc: '',
      args: [],
    );
  }

  /// `Đặt tên chứng thư số`
  String get nameForCTS {
    return Intl.message(
      'Đặt tên chứng thư số',
      name: 'nameForCTS',
      desc: '',
      args: [],
    );
  }

  /// `CCCD/HC/MST`
  String get citizenIdLabel {
    return Intl.message(
      'CCCD/HC/MST',
      name: 'citizenIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Thiết bị kích hoạt chứng thư`
  String get deviceUsingThisCert {
    return Intl.message(
      'Thiết bị kích hoạt chứng thư',
      name: 'deviceUsingThisCert',
      desc: '',
      args: [],
    );
  }

  /// `Email nhận thông báo`
  String get emailReceiveNotification {
    return Intl.message(
      'Email nhận thông báo',
      name: 'emailReceiveNotification',
      desc: '',
      args: [],
    );
  }

  /// `Ẩn chứng thư số khỏi màn hình danh sách`
  String get hideCTSInListScreen {
    return Intl.message(
      'Ẩn chứng thư số khỏi màn hình danh sách',
      name: 'hideCTSInListScreen',
      desc: '',
      args: [],
    );
  }

  /// `Đổi thiết bị`
  String get changeDevice {
    return Intl.message(
      'Đổi thiết bị',
      name: 'changeDevice',
      desc: '',
      args: [],
    );
  }

  /// `Đổi email`
  String get changeEmail {
    return Intl.message(
      'Đổi email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Người dùng vui lòng đặt tên chứng thư số để phân biệt dễ dàng các chứng thư số khi người dùng sử dụng hai chứng thư số trở lên.`
  String get changeNameDescription {
    return Intl.message(
      'Người dùng vui lòng đặt tên chứng thư số để phân biệt dễ dàng các chứng thư số khi người dùng sử dụng hai chứng thư số trở lên.',
      name: 'changeNameDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hủy`
  String get cancel {
    return Intl.message(
      'Hủy',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Đặt tên`
  String get nameFor {
    return Intl.message(
      'Đặt tên',
      name: 'nameFor',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số`
  String get digitalCertificate {
    return Intl.message(
      'Chứng thư số',
      name: 'digitalCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Sinh trắc học`
  String get biometrics {
    return Intl.message(
      'Sinh trắc học',
      name: 'biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Đổi PIN`
  String get changePIN {
    return Intl.message(
      'Đổi PIN',
      name: 'changePIN',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử cập nhật`
  String get updateHistory {
    return Intl.message(
      'Lịch sử cập nhật',
      name: 'updateHistory',
      desc: '',
      args: [],
    );
  }

  /// `Phiên bản`
  String get version {
    return Intl.message(
      'Phiên bản',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Câu hỏi thường gặp`
  String get faq {
    return Intl.message(
      'Câu hỏi thường gặp',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập {anything}`
  String inputRequired(Object anything) {
    return Intl.message(
      'Vui lòng nhập $anything',
      name: 'inputRequired',
      desc: '',
      args: [anything],
    );
  }

  /// `Vui lòng nhập tối đa {anything} ký tự`
  String maxLength(Object anything) {
    return Intl.message(
      'Vui lòng nhập tối đa $anything ký tự',
      name: 'maxLength',
      desc: '',
      args: [anything],
    );
  }

  /// `Vui lòng nhập tối thiểu {anything} ký tự`
  String minLength(Object anything) {
    return Intl.message(
      'Vui lòng nhập tối thiểu $anything ký tự',
      name: 'minLength',
      desc: '',
      args: [anything],
    );
  }

  /// `Vui lòng nhập đủ {anything} ký tự`
  String enoughLength(Object anything) {
    return Intl.message(
      'Vui lòng nhập đủ $anything ký tự',
      name: 'enoughLength',
      desc: '',
      args: [anything],
    );
  }

  /// `Thêm tài khoản khác`
  String get addAccount {
    return Intl.message(
      'Thêm tài khoản khác',
      name: 'addAccount',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản {number} của bạn đã kích hoạt. Vui lòng Đăng nhập để thực hiện kích hoạt CTS`
  String msgAccountActived(Object number) {
    return Intl.message(
      'Tài khoản $number của bạn đã kích hoạt. Vui lòng Đăng nhập để thực hiện kích hoạt CTS',
      name: 'msgAccountActived',
      desc: '',
      args: [number],
    );
  }

  /// `Tài khoản {number} không đúng với thông tin đăng ký.\n Vui lòng kiểm tra và nhập lại đúng số giấy tờ!`
  String msgAccountNotFound(Object number) {
    return Intl.message(
      'Tài khoản $number không đúng với thông tin đăng ký.\n Vui lòng kiểm tra và nhập lại đúng số giấy tờ!',
      name: 'msgAccountNotFound',
      desc: '',
      args: [number],
    );
  }

  /// `Thiết lập mật khẩu cho tài khoản`
  String get setupPasswordAccount {
    return Intl.message(
      'Thiết lập mật khẩu cho tài khoản',
      name: 'setupPasswordAccount',
      desc: '',
      args: [],
    );
  }

  /// `Tên đăng nhập`
  String get userName {
    return Intl.message(
      'Tên đăng nhập',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu`
  String get reEnterPassword {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu`
  String get enterPassword {
    return Intl.message(
      'Nhập mật khẩu',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã kích hoạt`
  String get enterActivateCode {
    return Intl.message(
      'Nhập mã kích hoạt',
      name: 'enterActivateCode',
      desc: '',
      args: [],
    );
  }

  /// `Đi tới Cài đặt`
  String get goToSettingsButton {
    return Intl.message(
      'Đi tới Cài đặt',
      name: 'goToSettingsButton',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực sinh trắc học chưa được thiết lập trên thiết bị. Vui lòng bật Touch ID hoặc Face ID trên điện thoại của bạn.`
  String get biometricsGoToSettingsDesc {
    return Intl.message(
      'Xác thực sinh trắc học chưa được thiết lập trên thiết bị. Vui lòng bật Touch ID hoặc Face ID trên điện thoại của bạn.',
      name: 'biometricsGoToSettingsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Thiết lập PIN`
  String get setupPinCode {
    return Intl.message(
      'Thiết lập PIN',
      name: 'setupPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN sử dụng xác thực giao dịch ký số và bảo vệ cặp khóa chứng thư số của bạn!`
  String get introPinCode {
    return Intl.message(
      'Mã PIN sử dụng xác thực giao dịch ký số và bảo vệ cặp khóa chứng thư số của bạn!',
      name: 'introPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN chỉ bao gồm ký tự số, không bao gồm khoảng trắng và ký tự chữ, ký tự đặc biệt.`
  String get pinCodeJustInclude {
    return Intl.message(
      'Mã PIN chỉ bao gồm ký tự số, không bao gồm khoảng trắng và ký tự chữ, ký tự đặc biệt.',
      name: 'pinCodeJustInclude',
      desc: '',
      args: [],
    );
  }

  /// `Mã PIN không bao gồm các số liên tiếp nhau hoặc các số trùng nhau.`
  String get pinCodeNotInclude {
    return Intl.message(
      'Mã PIN không bao gồm các số liên tiếp nhau hoặc các số trùng nhau.',
      name: 'pinCodeNotInclude',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã PIN`
  String get enterPinCode {
    return Intl.message(
      'Nhập mã PIN',
      name: 'enterPinCode',
      desc: '',
      args: [],
    );
  }

  /// `Xác minh thông tin tài khoản`
  String get verifyInformationAccount {
    return Intl.message(
      'Xác minh thông tin tài khoản',
      name: 'verifyInformationAccount',
      desc: '',
      args: [],
    );
  }

  /// `Quý khách vui lòng chuẩn bị đầy đủ giấy tờ trước khi bắt đầu!`
  String get prepareFullDocument {
    return Intl.message(
      'Quý khách vui lòng chuẩn bị đầy đủ giấy tờ trước khi bắt đầu!',
      name: 'prepareFullDocument',
      desc: '',
      args: [],
    );
  }

  /// `CCCD/CMND/Hộ chiếu`
  String get fullDocument {
    return Intl.message(
      'CCCD/CMND/Hộ chiếu',
      name: 'fullDocument',
      desc: '',
      args: [],
    );
  }

  /// `Chụp ảnh đủ sáng và rõ nét`
  String get takePhotoBrightClear {
    return Intl.message(
      'Chụp ảnh đủ sáng và rõ nét',
      name: 'takePhotoBrightClear',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu xác minh`
  String get startVerifying {
    return Intl.message(
      'Bắt đầu xác minh',
      name: 'startVerifying',
      desc: '',
      args: [],
    );
  }

  /// `Rất tiếc, chúng tôi không thể xác minh thông tin của Bạn. Bạn chỉ có 03 lần thực hiện eKYC.\n\nVui lòng thực hiện đúng theo hướng dẫn để quá trình xác minh được chính xác.\nHoặc liên hệ nhân viên VNPT để được hỗ trợ xác minh thông tin tại quầy!`
  String get desErrorEkyc {
    return Intl.message(
      'Rất tiếc, chúng tôi không thể xác minh thông tin của Bạn. Bạn chỉ có 03 lần thực hiện eKYC.\n\nVui lòng thực hiện đúng theo hướng dẫn để quá trình xác minh được chính xác.\nHoặc liên hệ nhân viên VNPT để được hỗ trợ xác minh thông tin tại quầy!',
      name: 'desErrorEkyc',
      desc: '',
      args: [],
    );
  }

  /// `Rất tiếc, chúng tôi không thể xác minh thông tin hồ sơ đăng ký online của Bạn. Vui lòng liên hệ nhân viên VNPT để được hỗ trợ xác minh thông tin tại quầy!`
  String get desErrorEkyc3times {
    return Intl.message(
      'Rất tiếc, chúng tôi không thể xác minh thông tin hồ sơ đăng ký online của Bạn. Vui lòng liên hệ nhân viên VNPT để được hỗ trợ xác minh thông tin tại quầy!',
      name: 'desErrorEkyc3times',
      desc: '',
      args: [],
    );
  }

  /// `Hỗ trợ`
  String get support {
    return Intl.message(
      'Hỗ trợ',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Thử lại`
  String get retry {
    return Intl.message(
      'Thử lại',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đã hiểu`
  String get iUnderstand {
    return Intl.message(
      'Tôi đã hiểu',
      name: 'iUnderstand',
      desc: '',
      args: [],
    );
  }

  /// `Đang xác minh thông tin`
  String get beingVerified {
    return Intl.message(
      'Đang xác minh thông tin',
      name: 'beingVerified',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang xác minh thông tin.\nVui lòng đợi trong giây lát...`
  String get systemVerifying {
    return Intl.message(
      'Hệ thống đang xác minh thông tin.\nVui lòng đợi trong giây lát...',
      name: 'systemVerifying',
      desc: '',
      args: [],
    );
  }

  /// `Mã kích hoạt hiệu lực trong `
  String get codeValidIn {
    return Intl.message(
      'Mã kích hoạt hiệu lực trong ',
      name: 'codeValidIn',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo cặp khóa`
  String get generateCerKey {
    return Intl.message(
      'Khởi tạo cặp khóa',
      name: 'generateCerKey',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang khởi tạo cặp khóa.\nVui lòng đợi trong giây lát...`
  String get processingGenKey {
    return Intl.message(
      'Hệ thống đang khởi tạo cặp khóa.\nVui lòng đợi trong giây lát...',
      name: 'processingGenKey',
      desc: '',
      args: [],
    );
  }

  /// `Chọn đối tượng`
  String get selectObject {
    return Intl.message(
      'Chọn đối tượng',
      name: 'selectObject',
      desc: '',
      args: [],
    );
  }

  /// `Hộ kinh doanh cá thể`
  String get individualBusinessHouseholds {
    return Intl.message(
      'Hộ kinh doanh cá thể',
      name: 'individualBusinessHouseholds',
      desc: '',
      args: [],
    );
  }

  /// `Tổ chức Doanh nghiệp`
  String get businessOrganization {
    return Intl.message(
      'Tổ chức Doanh nghiệp',
      name: 'businessOrganization',
      desc: '',
      args: [],
    );
  }

  /// `Cá nhân thuộc Tổ chức\nDoanh nghiệp`
  String get individualsUnderBusinessOrganizations {
    return Intl.message(
      'Cá nhân thuộc Tổ chức\nDoanh nghiệp',
      name: 'individualsUnderBusinessOrganizations',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng đang phát triển\nVui lòng thử lại sau!`
  String get theFeatureAreImprovingPleaseTryAgainLater {
    return Intl.message(
      'Tính năng đang phát triển\nVui lòng thử lại sau!',
      name: 'theFeatureAreImprovingPleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Quét mã QR`
  String get scanQRCode {
    return Intl.message(
      'Quét mã QR',
      name: 'scanQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng quét QR Code trên Căn cước \ncông dân để lấy thông tin`
  String get scanQRDescription {
    return Intl.message(
      'Vui lòng quét QR Code trên Căn cước \ncông dân để lấy thông tin',
      name: 'scanQRDescription',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng để QR Code vào chính giữa\nkhung hình`
  String get scanQRGuide {
    return Intl.message(
      'Vui lòng để QR Code vào chính giữa\nkhung hình',
      name: 'scanQRGuide',
      desc: '',
      args: [],
    );
  }

  /// `Bỏ qua`
  String get skip {
    return Intl.message(
      'Bỏ qua',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Mã QR không hợp lệ`
  String get qrCodeInvalid {
    return Intl.message(
      'Mã QR không hợp lệ',
      name: 'qrCodeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng sử dụng mã QR trên Căn cước công dân để lấy thông tin!`
  String get qrCodeInvalidDescription {
    return Intl.message(
      'Vui lòng sử dụng mã QR trên Căn cước công dân để lấy thông tin!',
      name: 'qrCodeInvalidDescription',
      desc: '',
      args: [],
    );
  }

  /// `Đã tồn tại tài khoản “{number}”, bạn có muốn mua thêm chứng thư số không? \nĐăng nhập để mua thêm chứng thư số!`
  String qrCodeIsRegistered(Object number) {
    return Intl.message(
      'Đã tồn tại tài khoản “$number”, bạn có muốn mua thêm chứng thư số không? \nĐăng nhập để mua thêm chứng thư số!',
      name: 'qrCodeIsRegistered',
      desc: '',
      args: [number],
    );
  }

  /// `Tài khoản “{number}” đang chờ kích hoạt, vui lòng thực hiện kích hoạt!`
  String qrCodeIsWaitingActive(Object number) {
    return Intl.message(
      'Tài khoản “$number” đang chờ kích hoạt, vui lòng thực hiện kích hoạt!',
      name: 'qrCodeIsWaitingActive',
      desc: '',
      args: [number],
    );
  }

  /// `Chứng thư số đã hết hạn đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ`
  String get keyCerExpired {
    return Intl.message(
      'Chứng thư số đã hết hạn đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ',
      name: 'keyCerExpired',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số đã thu hồi đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ`
  String get keyCerRevoked {
    return Intl.message(
      'Chứng thư số đã thu hồi đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ',
      name: 'keyCerRevoked',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số đang tạm dừng đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ`
  String get keyCerSuspended {
    return Intl.message(
      'Chứng thư số đang tạm dừng đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ',
      name: 'keyCerSuspended',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số không tồn tại đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ`
  String get keyCerEmpty {
    return Intl.message(
      'Chứng thư số không tồn tại đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ',
      name: 'keyCerEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Gửi hồ sơ đăng ký chứng thư số thành công!`
  String get waitingForApprovalTitle {
    return Intl.message(
      'Gửi hồ sơ đăng ký chứng thư số thành công!',
      name: 'waitingForApprovalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Về trang chính`
  String get goHome {
    return Intl.message(
      'Về trang chính',
      name: 'goHome',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số đã được kích hoạt`
  String get certValid {
    return Intl.message(
      'Chứng thư số đã được kích hoạt',
      name: 'certValid',
      desc: '',
      args: [],
    );
  }

  /// `Không tồn tại biên bản nghiệm thu. Vui lòng kiểm tra và thử lại`
  String get transactionBBNTNotFound {
    return Intl.message(
      'Không tồn tại biên bản nghiệm thu. Vui lòng kiểm tra và thử lại',
      name: 'transactionBBNTNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt chứng thư số`
  String get activeCer {
    return Intl.message(
      'Kích hoạt chứng thư số',
      name: 'activeCer',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số đang chờ kích hoạt!`
  String get waitingActiveCer {
    return Intl.message(
      'Chứng thư số đang chờ kích hoạt!',
      name: 'waitingActiveCer',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt ngay`
  String get activeNow {
    return Intl.message(
      'Kích hoạt ngay',
      name: 'activeNow',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số không được đăng ký trên thiết bị này. Vui lòng sử dụng thiết bị đã đăng ký để tiếp tục kích hoạt chứng thư số. Trường hợp mất hoặc đổi thiết bị, click Xác nhận để kích hoạt chứng thư số trên thiết bị mới!`
  String get notifActiveCerOtherDevice {
    return Intl.message(
      'Chứng thư số không được đăng ký trên thiết bị này. Vui lòng sử dụng thiết bị đã đăng ký để tiếp tục kích hoạt chứng thư số. Trường hợp mất hoặc đổi thiết bị, click Xác nhận để kích hoạt chứng thư số trên thiết bị mới!',
      name: 'notifActiveCerOtherDevice',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã xác thực`
  String get inputOTP {
    return Intl.message(
      'Nhập mã xác thực',
      name: 'inputOTP',
      desc: '',
      args: [],
    );
  }

  /// `Nhập OTP để xác thực`
  String get inputOTPVerify {
    return Intl.message(
      'Nhập OTP để xác thực',
      name: 'inputOTPVerify',
      desc: '',
      args: [],
    );
  }

  /// `Mã xác thực đã được gửi về\nsố điện thoại`
  String get inputOTPTitle {
    return Intl.message(
      'Mã xác thực đã được gửi về\nsố điện thoại',
      name: 'inputOTPTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mã xác thực sẽ hết hạn sau`
  String get otpExpiredTime {
    return Intl.message(
      'Mã xác thực sẽ hết hạn sau',
      name: 'otpExpiredTime',
      desc: '',
      args: [],
    );
  }

  /// `giây`
  String get second {
    return Intl.message(
      'giây',
      name: 'second',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa nhận được mã? `
  String get reciveOTP {
    return Intl.message(
      'Bạn chưa nhận được mã? ',
      name: 'reciveOTP',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã OTP`
  String get resendOTP {
    return Intl.message(
      'Gửi lại mã OTP',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử tài liệu ký số`
  String get docSignatureHistory {
    return Intl.message(
      'Lịch sử tài liệu ký số',
      name: 'docSignatureHistory',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên văn bản`
  String get inputNameDoc {
    return Intl.message(
      'Nhập tên văn bản',
      name: 'inputNameDoc',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm nâng cao`
  String get searchAdvance {
    return Intl.message(
      'Tìm kiếm nâng cao',
      name: 'searchAdvance',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm`
  String get search {
    return Intl.message(
      'Tìm kiếm',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Kết quả`
  String get result {
    return Intl.message(
      'Kết quả',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `({total} văn bản)`
  String totalResult(Object total) {
    return Intl.message(
      '($total văn bản)',
      name: 'totalResult',
      desc: '',
      args: [total],
    );
  }

  /// `Tên văn bản`
  String get nameDoc {
    return Intl.message(
      'Tên văn bản',
      name: 'nameDoc',
      desc: '',
      args: [],
    );
  }

  /// `Từ ngày`
  String get fromDate {
    return Intl.message(
      'Từ ngày',
      name: 'fromDate',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày`
  String get selectDate {
    return Intl.message(
      'Chọn ngày',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Đến ngày`
  String get toDate {
    return Intl.message(
      'Đến ngày',
      name: 'toDate',
      desc: '',
      args: [],
    );
  }

  /// `Chọn chứng thư số`
  String get selectCertificate {
    return Intl.message(
      'Chọn chứng thư số',
      name: 'selectCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết tài liệu ký số`
  String get detailDocSignature {
    return Intl.message(
      'Chi tiết tài liệu ký số',
      name: 'detailDocSignature',
      desc: '',
      args: [],
    );
  }

  /// `Mua ngay`
  String get buyNow {
    return Intl.message(
      'Mua ngay',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Kích hoạt`
  String get activate {
    return Intl.message(
      'Kích hoạt',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin đăng ký chứng thư số`
  String get informationOnRegistrationOfDigitalCertificates {
    return Intl.message(
      'Thông tin đăng ký chứng thư số',
      name: 'informationOnRegistrationOfDigitalCertificates',
      desc: '',
      args: [],
    );
  }

  /// `Quét QR`
  String get scanQR {
    return Intl.message(
      'Quét QR',
      name: 'scanQR',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng kiểm tra chính xác các thông tin: `
  String get pleaseCheckTheCorrectInformation {
    return Intl.message(
      'Vui lòng kiểm tra chính xác các thông tin: ',
      name: 'pleaseCheckTheCorrectInformation',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên, Số CMND/CCCD`
  String get importantInfo {
    return Intl.message(
      'Họ tên, Số CMND/CCCD',
      name: 'importantInfo',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc chọn Quét mã QR để tự động nhập thông tin!`
  String get orSelectScanQRCodeToAutomaticallyEnterInformation {
    return Intl.message(
      'Hoặc chọn Quét mã QR để tự động nhập thông tin!',
      name: 'orSelectScanQRCodeToAutomaticallyEnterInformation',
      desc: '',
      args: [],
    );
  }

  /// `Số CMND/CCCD`
  String get identificationNumber {
    return Intl.message(
      'Số CMND/CCCD',
      name: 'identificationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Loại giấy tờ chứng thực`
  String get identificationCardType {
    return Intl.message(
      'Loại giấy tờ chứng thực',
      name: 'identificationCardType',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin liên hệ`
  String get contactInfo {
    return Intl.message(
      'Thông tin liên hệ',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ liên hệ`
  String get addressInfo {
    return Intl.message(
      'Địa chỉ liên hệ',
      name: 'addressInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng sử dụng thông tin email và số điện thoại chính chủ để bảo mật thông tin dịch vụ!`
  String get pleaseUserTheOfficialEmailAndPhoneNumber {
    return Intl.message(
      'Vui lòng sử dụng thông tin email và số điện thoại chính chủ để bảo mật thông tin dịch vụ!',
      name: 'pleaseUserTheOfficialEmailAndPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng địa chỉ nới sinh sống hoặc làm việc để được hỗ trợ nhanh nhất`
  String get useTheAddress {
    return Intl.message(
      'Sử dụng địa chỉ nới sinh sống hoặc làm việc để được hỗ trợ nhanh nhất',
      name: 'useTheAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailOnly {
    return Intl.message(
      'Email',
      name: 'emailOnly',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh/Thành phố`
  String get provinceCity {
    return Intl.message(
      'Tỉnh/Thành phố',
      name: 'provinceCity',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ chi tiết`
  String get addressDetail {
    return Intl.message(
      'Địa chỉ chi tiết',
      name: 'addressDetail',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có tài khoản? `
  String get certificate_package_register_first {
    return Intl.message(
      'Chưa có tài khoản? ',
      name: 'certificate_package_register_first',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký chứng thư số`
  String get certificate_package_register_second {
    return Intl.message(
      'Đăng ký chứng thư số',
      name: 'certificate_package_register_second',
      desc: '',
      args: [],
    );
  }

  /// `Chọn gói chứng thư số`
  String get certificate_package_list_title {
    return Intl.message(
      'Chọn gói chứng thư số',
      name: 'certificate_package_list_title',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số theo lượt ký`
  String get certificate_package_list_option_sign_limit {
    return Intl.message(
      'Chứng thư số theo lượt ký',
      name: 'certificate_package_list_option_sign_limit',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số không giới hạn lượt ký`
  String get certificate_package_list_option_sign_no_limit {
    return Intl.message(
      'Chứng thư số không giới hạn lượt ký',
      name: 'certificate_package_list_option_sign_no_limit',
      desc: '',
      args: [],
    );
  }

  /// `Khai báo thông tin`
  String get certificate_package_page_register_title {
    return Intl.message(
      'Khai báo thông tin',
      name: 'certificate_package_page_register_title',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận đơn hàng`
  String get certificate_package_page_confirm_order_title {
    return Intl.message(
      'Xác nhận đơn hàng',
      name: 'certificate_package_page_confirm_order_title',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin gói dịch vụ`
  String get certificate_package_page_order_title {
    return Intl.message(
      'Thông tin gói dịch vụ',
      name: 'certificate_package_page_order_title',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký cấp chứng thư số thành công`
  String get certificate_package_notify_order_success {
    return Intl.message(
      'Đăng ký cấp chứng thư số thành công',
      name: 'certificate_package_notify_order_success',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chuẩn bị giấy tờ CCCD/CMND/Hộ chiếu để thực hiện nộp hồ sơ cấp chứng thư số!`
  String get certificate_package_notify_order_desc_success {
    return Intl.message(
      'Vui lòng chuẩn bị giấy tờ CCCD/CMND/Hộ chiếu để thực hiện nộp hồ sơ cấp chứng thư số!',
      name: 'certificate_package_notify_order_desc_success',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập chính xác các thông tin: `
  String get certificate_package_user_form_info_item_text_group_first {
    return Intl.message(
      'Vui lòng nhập chính xác các thông tin: ',
      name: 'certificate_package_user_form_info_item_text_group_first',
      desc: '',
      args: [],
    );
  }

  /// `Số CCCD/CMND`
  String get certificate_package_user_form_info_item_text_group_second {
    return Intl.message(
      'Số CCCD/CMND',
      name: 'certificate_package_user_form_info_item_text_group_second',
      desc: '',
      args: [],
    );
  }

  /// ` đúng với giấy tờ`
  String get certificate_package_user_form_info_item_text_group_three {
    return Intl.message(
      ' đúng với giấy tờ',
      name: 'certificate_package_user_form_info_item_text_group_three',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin người sở hữu chứng thư số`
  String get certificate_package_user_form_info_item_text_group_title {
    return Intl.message(
      'Thông tin người sở hữu chứng thư số',
      name: 'certificate_package_user_form_info_item_text_group_title',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên`
  String get certificate_package_user_form_info_item_fullname_label_text {
    return Intl.message(
      'Họ tên',
      name: 'certificate_package_user_form_info_item_fullname_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập đầy đủ Họ tên`
  String get certificate_package_user_form_info_item_fullname_hint_text {
    return Intl.message(
      'Nhập đầy đủ Họ tên',
      name: 'certificate_package_user_form_info_item_fullname_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Số CCCD/CMND`
  String
      get certificate_package_user_form_info_item_identitycard_number_label_text {
    return Intl.message(
      'Số CCCD/CMND',
      name:
          'certificate_package_user_form_info_item_identitycard_number_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập chính xác số CCCD/CMND`
  String
      get certificate_package_user_form_info_item_identitycard_number_hint_text {
    return Intl.message(
      'Nhập chính xác số CCCD/CMND',
      name:
          'certificate_package_user_form_info_item_identitycard_number_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Loại giấy tờ chứng thực`
  String
      get certificate_package_user_form_info_item_identitycard_type_label_text {
    return Intl.message(
      'Loại giấy tờ chứng thực',
      name:
          'certificate_package_user_form_info_item_identitycard_type_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập từ khóa tìm kiếm`
  String get certificate_package_user_form_info_item_hint_search_text {
    return Intl.message(
      'Nhập từ khóa tìm kiếm',
      name: 'certificate_package_user_form_info_item_hint_search_text',
      desc: '',
      args: [],
    );
  }

  /// `Quốc tịch`
  String get certificate_package_user_form_info_item_nationlitys_label_text {
    return Intl.message(
      'Quốc tịch',
      name: 'certificate_package_user_form_info_item_nationlitys_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Ngày cấp`
  String get certificate_package_user_form_info_item_issuedDate_label_text {
    return Intl.message(
      'Ngày cấp',
      name: 'certificate_package_user_form_info_item_issuedDate_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nơi cấp`
  String get certificate_package_user_form_info_item_issuedPlace_label_text {
    return Intl.message(
      'Nơi cấp',
      name: 'certificate_package_user_form_info_item_issuedPlace_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập nơi cấp`
  String get certificate_package_user_form_info_item_issuedPlace_hint_text {
    return Intl.message(
      'Nhập nơi cấp',
      name: 'certificate_package_user_form_info_item_issuedPlace_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ liên hệ`
  String get certificate_packageuser_form_contact_info_item_text_group_title {
    return Intl.message(
      'Địa chỉ liên hệ',
      name: 'certificate_packageuser_form_contact_info_item_text_group_title',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng địa chỉ thường trú hoặc nơi làm việc để nhận hóa đơn và được hỗ trợ nhanh nhất.`
  String get certificate_packageuser_form_contact_info_item_text_group_desc {
    return Intl.message(
      'Sử dụng địa chỉ thường trú hoặc nơi làm việc để nhận hóa đơn và được hỗ trợ nhanh nhất.',
      name: 'certificate_packageuser_form_contact_info_item_text_group_desc',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh/Thành phố`
  String
      get certificate_packageuser_form_contact_info_item_province_label_text {
    return Intl.message(
      'Tỉnh/Thành phố',
      name:
          'certificate_packageuser_form_contact_info_item_province_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Quận/Huyện`
  String
      get certificate_packageuser_form_contact_info_item_districts_label_text {
    return Intl.message(
      'Quận/Huyện',
      name:
          'certificate_packageuser_form_contact_info_item_districts_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Phường xã`
  String get certificate_packageuser_form_contact_info_item_wards_label_text {
    return Intl.message(
      'Phường xã',
      name: 'certificate_packageuser_form_contact_info_item_wards_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ chi tiết`
  String get certificate_packageuser_form_contact_info_item_address_label_text {
    return Intl.message(
      'Địa chỉ chi tiết',
      name: 'certificate_packageuser_form_contact_info_item_address_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số nhà, đường, phố`
  String get certificate_packageuser_form_contact_info_item_address_hint_text {
    return Intl.message(
      'Nhập số nhà, đường, phố',
      name: 'certificate_packageuser_form_contact_info_item_address_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin liên hệ sử dụng chứng thư số`
  String
      get certificate_packageuser_form_contact_certificate_info_item_text_group {
    return Intl.message(
      'Thông tin liên hệ sử dụng chứng thư số',
      name:
          'certificate_packageuser_form_contact_certificate_info_item_text_group',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng kiểm tra kỹ số điện thoại, email chính xác để nhận thông tin kích hoạt dịch vụ.`
  String
      get certificate_packageuser_form_contact_certificate_info_item_text_group_desc {
    return Intl.message(
      'Vui lòng kiểm tra kỹ số điện thoại, email chính xác để nhận thông tin kích hoạt dịch vụ.',
      name:
          'certificate_packageuser_form_contact_certificate_info_item_text_group_desc',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String
      get certificate_packageuser_form_contact_certificate_info_item_email_label_text {
    return Intl.message(
      'Email',
      name:
          'certificate_packageuser_form_contact_certificate_info_item_email_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập email`
  String
      get certificate_packageuser_form_contact_certificate_info_item_email_hint_text {
    return Intl.message(
      'Nhập email',
      name:
          'certificate_packageuser_form_contact_certificate_info_item_email_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String
      get certificate_packageuser_form_contact_certificate_info_item_phone_label_text {
    return Intl.message(
      'Số điện thoại',
      name:
          'certificate_packageuser_form_contact_certificate_info_item_phone_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Nhập số điện thoại`
  String
      get certificate_packageuser_form_contact_certificate_info_item_phone_hint_text {
    return Intl.message(
      'Nhập số điện thoại',
      name:
          'certificate_packageuser_form_contact_certificate_info_item_phone_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian sử dụng`
  String get certificate_package_item_timevalidity {
    return Intl.message(
      'Thời gian sử dụng',
      name: 'certificate_package_item_timevalidity',
      desc: '',
      args: [],
    );
  }

  /// `Phí dịch vụ`
  String get certificate_package_item_price_title {
    return Intl.message(
      'Phí dịch vụ',
      name: 'certificate_package_item_price_title',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá`
  String get certificate_package_item_unit_price_title {
    return Intl.message(
      'Đơn giá',
      name: 'certificate_package_item_unit_price_title',
      desc: '',
      args: [],
    );
  }

  /// `Thành tiền`
  String get certificate_package_item_amount_title {
    return Intl.message(
      'Thành tiền',
      name: 'certificate_package_item_amount_title',
      desc: '',
      args: [],
    );
  }

  /// `Số lượt ký sẽ theo gói lượt ký khách hàng mua`
  String get certificate_package_sign_type_limit {
    return Intl.message(
      'Số lượt ký sẽ theo gói lượt ký khách hàng mua',
      name: 'certificate_package_sign_type_limit',
      desc: '',
      args: [],
    );
  }

  /// `Số lượt ký không giới hạn`
  String get certificate_package_sign_type_no_limit {
    return Intl.message(
      'Số lượt ký không giới hạn',
      name: 'certificate_package_sign_type_no_limit',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Không lấy được thông tin gói Chứng thư số`
  String get certificate_package_get_list_error {
    return Intl.message(
      'Lỗi: Không lấy được thông tin gói Chứng thư số',
      name: 'certificate_package_get_list_error',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn Chứng thư số trước khi khai báo thông tin!`
  String get certificate_package_no_selected_error {
    return Intl.message(
      'Vui lòng chọn Chứng thư số trước khi khai báo thông tin!',
      name: 'certificate_package_no_selected_error',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Không lấy được thông tin Tỉnh/Thành phố`
  String get certificate_package_get_province_error {
    return Intl.message(
      'Lỗi: Không lấy được thông tin Tỉnh/Thành phố',
      name: 'certificate_package_get_province_error',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Không lấy được thông tin Quận/Huyện`
  String get certificate_package_get_districts_error {
    return Intl.message(
      'Lỗi: Không lấy được thông tin Quận/Huyện',
      name: 'certificate_package_get_districts_error',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Không lấy được thông tin Phường xã`
  String get certificate_package_get_wards_error {
    return Intl.message(
      'Lỗi: Không lấy được thông tin Phường xã',
      name: 'certificate_package_get_wards_error',
      desc: '',
      args: [],
    );
  }

  /// `Đang xử lý đơn hàng...`
  String get certificate_package_progress_order {
    return Intl.message(
      'Đang xử lý đơn hàng...',
      name: 'certificate_package_progress_order',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo dịch vụ thành công`
  String get certificate_package_progress_order_success {
    return Intl.message(
      'Khởi tạo dịch vụ thành công',
      name: 'certificate_package_progress_order_success',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi: Không lưu được đơn hàng`
  String get certificate_package_save_order_error {
    return Intl.message(
      'Lỗi: Không lưu được đơn hàng',
      name: 'certificate_package_save_order_error',
      desc: '',
      args: [],
    );
  }

  /// `Email không đúng định dạng`
  String get certificate_package_validate_emailr_error {
    return Intl.message(
      'Email không đúng định dạng',
      name: 'certificate_package_validate_emailr_error',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin không được bỏ trống`
  String get certificate_package_validate_input_error {
    return Intl.message(
      'Thông tin không được bỏ trống',
      name: 'certificate_package_validate_input_error',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không đúng định dạng`
  String get certificate_package_validate_phone_error {
    return Intl.message(
      'Số điện thoại không đúng định dạng',
      name: 'certificate_package_validate_phone_error',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin không được chứa ký tự đặc biệt`
  String get certificate_package_validate_input_special_error {
    return Intl.message(
      'Thông tin không được chứa ký tự đặc biệt',
      name: 'certificate_package_validate_input_special_error',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin chỉ nhập số, không nhập ký tự`
  String get certificate_package_validate_input_isnumeric_only_error {
    return Intl.message(
      'Thông tin chỉ nhập số, không nhập ký tự',
      name: 'certificate_package_validate_input_isnumeric_only_error',
      desc: '',
      args: [],
    );
  }

  /// `Không có dữ liệu hiển thị`
  String get certificate_package_list_empty {
    return Intl.message(
      'Không có dữ liệu hiển thị',
      name: 'certificate_package_list_empty',
      desc: '',
      args: [],
    );
  }

  /// `Không có gói Chứng thư nào được chọn`
  String get certificate_package_list_title_empty {
    return Intl.message(
      'Không có gói Chứng thư nào được chọn',
      name: 'certificate_package_list_title_empty',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản`
  String get certificate_package_register_account {
    return Intl.message(
      'Đăng ký tài khoản',
      name: 'certificate_package_register_account',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn dữ liệu từ danh sách`
  String get pleaseSelectDataInList {
    return Intl.message(
      'Vui lòng chọn dữ liệu từ danh sách',
      name: 'pleaseSelectDataInList',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy dữ liệu`
  String get dataNotFound {
    return Intl.message(
      'Không tìm thấy dữ liệu',
      name: 'dataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin tài khoản`
  String get accountInformation {
    return Intl.message(
      'Thông tin tài khoản',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Chọn gói Chứng thư số`
  String get selectCertificatePack {
    return Intl.message(
      'Chọn gói Chứng thư số',
      name: 'selectCertificatePack',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên gói cần tìm kiếm`
  String get enterThePackageNameToSearch {
    return Intl.message(
      'Nhập tên gói cần tìm kiếm',
      name: 'enterThePackageNameToSearch',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả`
  String get all {
    return Intl.message(
      'Tất cả',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Theo lượt ký`
  String get bySignatures {
    return Intl.message(
      'Theo lượt ký',
      name: 'bySignatures',
      desc: '',
      args: [],
    );
  }

  /// `Không giới hạn lượt ký`
  String get unlimitedNumberOfSignatures {
    return Intl.message(
      'Không giới hạn lượt ký',
      name: 'unlimitedNumberOfSignatures',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách gói ({numberPackages})`
  String listPacks(Object numberPackages) {
    return Intl.message(
      'Danh sách gói ($numberPackages)',
      name: 'listPacks',
      desc: '',
      args: [numberPackages],
    );
  }

  /// `{number} tháng`
  String filterByMonth(Object number) {
    return Intl.message(
      '$number tháng',
      name: 'filterByMonth',
      desc: '',
      args: [number],
    );
  }

  /// `Chọn tất cả`
  String get selectAll {
    return Intl.message(
      'Chọn tất cả',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian sử dụng`
  String get usedTime {
    return Intl.message(
      'Thời gian sử dụng',
      name: 'usedTime',
      desc: '',
      args: [],
    );
  }

  /// `Phí dịch vụ`
  String get serviceCharge {
    return Intl.message(
      'Phí dịch vụ',
      name: 'serviceCharge',
      desc: '',
      args: [],
    );
  }

  /// `Điều bạn cần biết`
  String get whatYouNeedTKnow {
    return Intl.message(
      'Điều bạn cần biết',
      name: 'whatYouNeedTKnow',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số chưa bao gồm lượt ký. Số lượt ký sẽ theo gói lượt ký mua riêng`
  String get youKnowOne {
    return Intl.message(
      'Chứng thư số chưa bao gồm lượt ký. Số lượt ký sẽ theo gói lượt ký mua riêng',
      name: 'youKnowOne',
      desc: '',
      args: [],
    );
  }

  /// `Ký số miễn phí khi thực hiện các giao dịch trên cổng dịch vụ công quốc gia.`
  String get youKnowTwo {
    return Intl.message(
      'Ký số miễn phí khi thực hiện các giao dịch trên cổng dịch vụ công quốc gia.',
      name: 'youKnowTwo',
      desc: '',
      args: [],
    );
  }

  /// `Chu kỳ`
  String get cycle {
    return Intl.message(
      'Chu kỳ',
      name: 'cycle',
      desc: '',
      args: [],
    );
  }

  /// `Áp dụng`
  String get apply {
    return Intl.message(
      'Áp dụng',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Miễn phí`
  String get free {
    return Intl.message(
      'Miễn phí',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Không có gói nào phù hợp\nvới điều kiện lọc`
  String get emptyDataFiltered {
    return Intl.message(
      'Không có gói nào phù hợp\nvới điều kiện lọc',
      name: 'emptyDataFiltered',
      desc: '',
      args: [],
    );
  }

  /// `Bộ lọc tìm kiếm`
  String get searchFilters {
    return Intl.message(
      'Bộ lọc tìm kiếm',
      name: 'searchFilters',
      desc: '',
      args: [],
    );
  }

  /// `Miễn phí`
  String get order_free {
    return Intl.message(
      'Miễn phí',
      name: 'order_free',
      desc: '',
      args: [],
    );
  }

  /// `Tháng`
  String get month_text {
    return Intl.message(
      'Tháng',
      name: 'month_text',
      desc: '',
      args: [],
    );
  }

  /// `Kết quả ({numberPackages})`
  String resultPacks(Object numberPackages) {
    return Intl.message(
      'Kết quả ($numberPackages)',
      name: 'resultPacks',
      desc: '',
      args: [numberPackages],
    );
  }

  /// `Lựa chọn chứng thư số để thực hiện mua lượt ký`
  String get selectCertToSign {
    return Intl.message(
      'Lựa chọn chứng thư số để thực hiện mua lượt ký',
      name: 'selectCertToSign',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin mua gói lượt ký`
  String get infoBuySignature {
    return Intl.message(
      'Thông tin mua gói lượt ký',
      name: 'infoBuySignature',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get forgotPasswordScreen {
    return Intl.message(
      'Quên mật khẩu',
      name: 'forgotPasswordScreen',
      desc: '',
      args: [],
    );
  }

  /// `Gói`
  String get package {
    return Intl.message(
      'Gói',
      name: 'package',
      desc: '',
      args: [],
    );
  }

  /// `Đã bao gồm 10% VAT`
  String get included10VAT {
    return Intl.message(
      'Đã bao gồm 10% VAT',
      name: 'included10VAT',
      desc: '',
      args: [],
    );
  }

  /// `Tổng lượt ký: ({number})`
  String totalNumberSignatures(Object number) {
    return Intl.message(
      'Tổng lượt ký: ($number)',
      name: 'totalNumberSignatures',
      desc: '',
      args: [number],
    );
  }

  /// `Số lượng`
  String get quantity {
    return Intl.message(
      'Số lượng',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Đơn giá`
  String get price {
    return Intl.message(
      'Đơn giá',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Thành tiền`
  String get money {
    return Intl.message(
      'Thành tiền',
      name: 'money',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin xuất hóa đơn`
  String get noticeOfInvoice {
    return Intl.message(
      'Thông tin xuất hóa đơn',
      name: 'noticeOfInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin lượt ký`
  String get signingInformation {
    return Intl.message(
      'Thông tin lượt ký',
      name: 'signingInformation',
      desc: '',
      args: [],
    );
  }

  /// `Số lượt ký`
  String get numberOfSignatures {
    return Intl.message(
      'Số lượt ký',
      name: 'numberOfSignatures',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý`
  String get certPackNoteLabel {
    return Intl.message(
      'Lưu ý',
      name: 'certPackNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số chưa bao gồm lượt ký. Số lượt ký sẽ theo gói lượt ký mua riêng.`
  String get certPackNoteContent {
    return Intl.message(
      'Chứng thư số chưa bao gồm lượt ký. Số lượt ký sẽ theo gói lượt ký mua riêng.',
      name: 'certPackNoteContent',
      desc: '',
      args: [],
    );
  }

  /// `Mã giới thiệu`
  String get referralCode {
    return Intl.message(
      'Mã giới thiệu',
      name: 'referralCode',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã giới thiệu`
  String get inputReferralCode {
    return Intl.message(
      'Nhập mã giới thiệu',
      name: 'inputReferralCode',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán`
  String get pay {
    return Intl.message(
      'Thanh toán',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `{number} lượt`
  String turn(Object number) {
    return Intl.message(
      '$number lượt',
      name: 'turn',
      desc: '',
      args: [number],
    );
  }

  /// `{number} VNĐ`
  String vnd(Object number) {
    return Intl.message(
      '$number VNĐ',
      name: 'vnd',
      desc: '',
      args: [number],
    );
  }

  /// `Đang khởi tạo dịch vụ`
  String get initializingTheService {
    return Intl.message(
      'Đang khởi tạo dịch vụ',
      name: 'initializingTheService',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang khởi tạo dịch vụ,\nvui lòng đợi trong giây lát....`
  String get theSystemIsInitializingTheServicePleaseWaitAMoment {
    return Intl.message(
      'Hệ thống đang khởi tạo dịch vụ,\nvui lòng đợi trong giây lát....',
      name: 'theSystemIsInitializingTheServicePleaseWaitAMoment',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký dịch vụ thành công!`
  String get registerServiceSuccess {
    return Intl.message(
      'Đăng ký dịch vụ thành công!',
      name: 'registerServiceSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp theo, Bạn cần {action} và nộp hồ sơ để sử dụng chứng thư số, vui lòng kiểm tra email/sms để nhận thông tin kích hoạt từ VNPT SmartCA!`
  String registerServiceSuccessGuideNextStep(Object action) {
    return Intl.message(
      'Tiếp theo, Bạn cần $action và nộp hồ sơ để sử dụng chứng thư số, vui lòng kiểm tra email/sms để nhận thông tin kích hoạt từ VNPT SmartCA!',
      name: 'registerServiceSuccessGuideNextStep',
      desc: '',
      args: [action],
    );
  }

  /// `Kích hoạt`
  String get Activated {
    return Intl.message(
      'Kích hoạt',
      name: 'Activated',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo dịch vụ`
  String get serviceInitialization {
    return Intl.message(
      'Khởi tạo dịch vụ',
      name: 'serviceInitialization',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán thành công`
  String get paymentSuccess {
    return Intl.message(
      'Thanh toán thành công',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang khởi tạo dịch vụ gói lượt ký.\nVui lòng đợi thêm giây lát!`
  String get processingPackageSignature {
    return Intl.message(
      'Hệ thống đang khởi tạo dịch vụ gói lượt ký.\nVui lòng đợi thêm giây lát!',
      name: 'processingPackageSignature',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán thất bại`
  String get paymentFailed {
    return Intl.message(
      'Thanh toán thất bại',
      name: 'paymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Quý khách vui lòng thực hiện lại thanh toán.\nXin cảm ơn!`
  String get pleaseMakePaymentAgain {
    return Intl.message(
      'Quý khách vui lòng thực hiện lại thanh toán.\nXin cảm ơn!',
      name: 'pleaseMakePaymentAgain',
      desc: '',
      args: [],
    );
  }

  /// `Thực hiện lại thanh toán`
  String get makePaymentAgain {
    return Intl.message(
      'Thực hiện lại thanh toán',
      name: 'makePaymentAgain',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin xuất hoá đơn`
  String get invoiceInformation {
    return Intl.message(
      'Thông tin xuất hoá đơn',
      name: 'invoiceInformation',
      desc: '',
      args: [],
    );
  }

  /// `Thu gọn`
  String get collapse {
    return Intl.message(
      'Thu gọn',
      name: 'collapse',
      desc: '',
      args: [],
    );
  }

  /// `Chọn chứng thư số cần đổi thiết bị`
  String get changeDeviceDescription {
    return Intl.message(
      'Chọn chứng thư số cần đổi thiết bị',
      name: 'changeDeviceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Giao dịch chờ Ký`
  String get listTransactions {
    return Intl.message(
      'Giao dịch chờ Ký',
      name: 'listTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Mua\nchứng thư`
  String get buyCTS {
    return Intl.message(
      'Mua\nchứng thư',
      name: 'buyCTS',
      desc: '',
      args: [],
    );
  }

  /// `Xác minh thông tin không thành công!`
  String get verifyInfoError {
    return Intl.message(
      'Xác minh thông tin không thành công!',
      name: 'verifyInfoError',
      desc: '',
      args: [],
    );
  }

  /// `Rất tiếc, chúng tôi không thể xác minh thông tin của bạn.`
  String get verifyInfoErrorDescription {
    return Intl.message(
      'Rất tiếc, chúng tôi không thể xác minh thông tin của bạn.',
      name: 'verifyInfoErrorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chỉ có tối đa 03 lần thực hiện eKYC.`
  String get verifyInfoErrorCauseGuide {
    return Intl.message(
      'Bạn chỉ có tối đa 03 lần thực hiện eKYC.',
      name: 'verifyInfoErrorCauseGuide',
      desc: '',
      args: [],
    );
  }

  /// `Lý do:`
  String get verifyInfoErrorCauseLabel {
    return Intl.message(
      'Lý do:',
      name: 'verifyInfoErrorCauseLabel',
      desc: '',
      args: [],
    );
  }

  /// `Ảnh chân dung không phải ảnh thật!`
  String get verifyInfoErrorCauseContent {
    return Intl.message(
      'Ảnh chân dung không phải ảnh thật!',
      name: 'verifyInfoErrorCauseContent',
      desc: '',
      args: [],
    );
  }

  /// `Khuôn mặt không trùng khớp`
  String get verifyInfoErrorCauseContent2 {
    return Intl.message(
      'Khuôn mặt không trùng khớp',
      name: 'verifyInfoErrorCauseContent2',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ xác minh thông tin tại quầy!`
  String get verifyInfoErrorSolution {
    return Intl.message(
      'Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ xác minh thông tin tại quầy!',
      name: 'verifyInfoErrorSolution',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng thực hiện đúng theo hướng dẫn để quá trình xác minh được chính xác.`
  String get verifyInfoErrorSolution2 {
    return Intl.message(
      'Vui lòng thực hiện đúng theo hướng dẫn để quá trình xác minh được chính xác.',
      name: 'verifyInfoErrorSolution2',
      desc: '',
      args: [],
    );
  }

  /// `Xác minh thông tin`
  String get verifyInfo {
    return Intl.message(
      'Xác minh thông tin',
      name: 'verifyInfo',
      desc: '',
      args: [],
    );
  }

  /// `•`
  String get bulletDot {
    return Intl.message(
      '•',
      name: 'bulletDot',
      desc: '',
      args: [],
    );
  }

  /// `Tồn tại yêu cầu đăng ký chứng thư số trước đó, Bạn có muốn tiếp tục hay đăng ký mới?`
  String get certOrderIsExistingNotice {
    return Intl.message(
      'Tồn tại yêu cầu đăng ký chứng thư số trước đó, Bạn có muốn tiếp tục hay đăng ký mới?',
      name: 'certOrderIsExistingNotice',
      desc: '',
      args: [],
    );
  }

  /// `Xử lý tiếp`
  String get continueProcessing {
    return Intl.message(
      'Xử lý tiếp',
      name: 'continueProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký mới`
  String get newRegistration {
    return Intl.message(
      'Đăng ký mới',
      name: 'newRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực không thành công!`
  String get verifyFail {
    return Intl.message(
      'Xác thực không thành công!',
      name: 'verifyFail',
      desc: '',
      args: [],
    );
  }

  /// `Đã có lỗi xảy ra, vui lòng thử lại sau!`
  String get verifyFailDetail {
    return Intl.message(
      'Đã có lỗi xảy ra, vui lòng thử lại sau!',
      name: 'verifyFailDetail',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách đơn hàng`
  String get orderList {
    return Intl.message(
      'Danh sách đơn hàng',
      name: 'orderList',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get completed {
    return Intl.message(
      'Hoàn thành',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Đang xử lý`
  String get inProgress {
    return Intl.message(
      'Đang xử lý',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng liên hệ Tổng đài (18001260) nhánh 1 nếu đơn hàng ở các trạng thái:`
  String get orderNoteContent {
    return Intl.message(
      'Vui lòng liên hệ Tổng đài (18001260) nhánh 1 nếu đơn hàng ở các trạng thái:',
      name: 'orderNoteContent',
      desc: '',
      args: [],
    );
  }

  /// `Tạo hợp đồng không thành công.`
  String get orderNoteContentState1 {
    return Intl.message(
      'Tạo hợp đồng không thành công.',
      name: 'orderNoteContentState1',
      desc: '',
      args: [],
    );
  }

  /// `Ký hợp đồng không thành công.`
  String get orderNoteContentState2 {
    return Intl.message(
      'Ký hợp đồng không thành công.',
      name: 'orderNoteContentState2',
      desc: '',
      args: [],
    );
  }

  /// `Tạo yêu cầu không thành công.`
  String get orderNoteContentState3 {
    return Intl.message(
      'Tạo yêu cầu không thành công.',
      name: 'orderNoteContentState3',
      desc: '',
      args: [],
    );
  }

  /// `Đồng bộ hồ sơ không thành công.`
  String get orderNoteContentState4 {
    return Intl.message(
      'Đồng bộ hồ sơ không thành công.',
      name: 'orderNoteContentState4',
      desc: '',
      args: [],
    );
  }

  /// `Cấp mới chứng thư số`
  String get newCertOrder {
    return Intl.message(
      'Cấp mới chứng thư số',
      name: 'newCertOrder',
      desc: '',
      args: [],
    );
  }

  /// `Gia hạn chứng thư số`
  String get renewCertOrder {
    return Intl.message(
      'Gia hạn chứng thư số',
      name: 'renewCertOrder',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi thiết bị`
  String get changeDeviceOrder {
    return Intl.message(
      'Thay đổi thiết bị',
      name: 'changeDeviceOrder',
      desc: '',
      args: [],
    );
  }

  /// `Mã đơn hàng`
  String get orderCode {
    return Intl.message(
      'Mã đơn hàng',
      name: 'orderCode',
      desc: '',
      args: [],
    );
  }

  /// `Ngày tạo`
  String get orderDate {
    return Intl.message(
      'Ngày tạo',
      name: 'orderDate',
      desc: '',
      args: [],
    );
  }

  /// `Chờ xác thực eKYC`
  String get orderEKYC_WAITING {
    return Intl.message(
      'Chờ xác thực eKYC',
      name: 'orderEKYC_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ xác thực bằng OTP`
  String get orderOTP_WAITING {
    return Intl.message(
      'Chờ xác thực bằng OTP',
      name: 'orderOTP_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ thanh toán online`
  String get orderPAYMENT_WAITING {
    return Intl.message(
      'Chờ thanh toán online',
      name: 'orderPAYMENT_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ sinh hợp đồng`
  String get orderCONTRACT_CREATE_WAITING {
    return Intl.message(
      'Chờ sinh hợp đồng',
      name: 'orderCONTRACT_CREATE_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ ký hợp đồng`
  String get orderCONTRACT_SIGN_WAITING {
    return Intl.message(
      'Chờ ký hợp đồng',
      name: 'orderCONTRACT_SIGN_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ sinh yêu cầu tạo chứng thư số`
  String get orderREQUESTCERT_WATING {
    return Intl.message(
      'Chờ sinh yêu cầu tạo chứng thư số',
      name: 'orderREQUESTCERT_WATING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ submit sang OneBSS`
  String get orderONEBSS_SUBMIT_WAITING {
    return Intl.message(
      'Chờ submit sang OneBSS',
      name: 'orderONEBSS_SUBMIT_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Chờ duyệt cấp chứng thư số`
  String get orderAPPROVE_REQUEST_CERT_WAITING {
    return Intl.message(
      'Chờ duyệt cấp chứng thư số',
      name: 'orderAPPROVE_REQUEST_CERT_WAITING',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực eKYC không thành công`
  String get orderEKYC_ERROR {
    return Intl.message(
      'Xác thực eKYC không thành công',
      name: 'orderEKYC_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực OTP không thành công`
  String get orderOTP_ERROR {
    return Intl.message(
      'Xác thực OTP không thành công',
      name: 'orderOTP_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán không thành công`
  String get orderPAYMENT_ERROR {
    return Intl.message(
      'Thanh toán không thành công',
      name: 'orderPAYMENT_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Tạo hợp đồng không thành công`
  String get orderCONTRACT_CREATE_ERROR {
    return Intl.message(
      'Tạo hợp đồng không thành công',
      name: 'orderCONTRACT_CREATE_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Ký hợp đồng không thành công`
  String get orderCONTRACT_SIGN_ERROR {
    return Intl.message(
      'Ký hợp đồng không thành công',
      name: 'orderCONTRACT_SIGN_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Tạo yêu cầu gia hạn không thành công`
  String get orderREQUESTCERT_ERROR {
    return Intl.message(
      'Tạo yêu cầu gia hạn không thành công',
      name: 'orderREQUESTCERT_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Đồng bộ hồ sơ không thành công`
  String get orderONEBSS_SUBMIT_ERROR {
    return Intl.message(
      'Đồng bộ hồ sơ không thành công',
      name: 'orderONEBSS_SUBMIT_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Duyệt yêu cầu không thành công`
  String get orderAPPROVE_REQUEST_CERT_ERROR {
    return Intl.message(
      'Duyệt yêu cầu không thành công',
      name: 'orderAPPROVE_REQUEST_CERT_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Từ chối yêu cầu`
  String get orderREJECT_REQUEST_CERT {
    return Intl.message(
      'Từ chối yêu cầu',
      name: 'orderREJECT_REQUEST_CERT',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get orderDONE {
    return Intl.message(
      'Hoàn thành',
      name: 'orderDONE',
      desc: '',
      args: [],
    );
  }

  /// `Đã hủy`
  String get orderCANCELED {
    return Intl.message(
      'Đã hủy',
      name: 'orderCANCELED',
      desc: '',
      args: [],
    );
  }

  /// `Chờ khởi tạo cặp khóa`
  String get orderKEY_ASSIGN_WATING {
    return Intl.message(
      'Chờ khởi tạo cặp khóa',
      name: 'orderKEY_ASSIGN_WATING',
      desc: '',
      args: [],
    );
  }

  /// `Khởi tạo cặp khóa không thành công`
  String get orderKEY_ASSIGN_ERROR {
    return Intl.message(
      'Khởi tạo cặp khóa không thành công',
      name: 'orderKEY_ASSIGN_ERROR',
      desc: '',
      args: [],
    );
  }

  /// `Tạo tài khoản`
  String get createAccount {
    return Intl.message(
      'Tạo tài khoản',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Nhận tư vấn`
  String get getAdvice {
    return Intl.message(
      'Nhận tư vấn',
      name: 'getAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng cung cấp thông tin để nhân viên VNPT hỗ trợ thủ tục đăng ký chứng thư số cho Tổ chức Doanh nghiệp!`
  String get desAdviceBusiness {
    return Intl.message(
      'Vui lòng cung cấp thông tin để nhân viên VNPT hỗ trợ thủ tục đăng ký chứng thư số cho Tổ chức Doanh nghiệp!',
      name: 'desAdviceBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Tên Cơ quan/Tổ chức/Doanh nghiệp`
  String get nameBusiness {
    return Intl.message(
      'Tên Cơ quan/Tổ chức/Doanh nghiệp',
      name: 'nameBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên người liên hệ`
  String get nameContact {
    return Intl.message(
      'Họ tên người liên hệ',
      name: 'nameContact',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại liên hệ`
  String get phoneContact {
    return Intl.message(
      'Số điện thoại liên hệ',
      name: 'phoneContact',
      desc: '',
      args: [],
    );
  }

  /// `Email liên hệ`
  String get emailContact {
    return Intl.message(
      'Email liên hệ',
      name: 'emailContact',
      desc: '',
      args: [],
    );
  }

  /// `Gửi yêu cầu hỗ trợ`
  String get sendSupportRequest {
    return Intl.message(
      'Gửi yêu cầu hỗ trợ',
      name: 'sendSupportRequest',
      desc: '',
      args: [],
    );
  }

  /// `Gửi yêu cầu thành công`
  String get requestSentSuccessfully {
    return Intl.message(
      'Gửi yêu cầu thành công',
      name: 'requestSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Nhân viên kinh doanh VNPT sẽ liên hệ với bạn. Vui lòng kiểm tra email hoặc điện thoại để được tư vấn hỗ trợ!`
  String get desRequestSentSuccessfully {
    return Intl.message(
      'Nhân viên kinh doanh VNPT sẽ liên hệ với bạn. Vui lòng kiểm tra email hoặc điện thoại để được tư vấn hỗ trợ!',
      name: 'desRequestSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Hướng dẫn đăng ký tài khoản`
  String get tutorialRegisterAccount {
    return Intl.message(
      'Hướng dẫn đăng ký tài khoản',
      name: 'tutorialRegisterAccount',
      desc: '',
      args: [],
    );
  }

  /// `Loại giấy tờ đăng ký`
  String get registrationCardType {
    return Intl.message(
      'Loại giấy tờ đăng ký',
      name: 'registrationCardType',
      desc: '',
      args: [],
    );
  }

  /// `Căn cước công dân`
  String get citizenIdentification {
    return Intl.message(
      'Căn cước công dân',
      name: 'citizenIdentification',
      desc: '',
      args: [],
    );
  }

  /// `Hộ chiếu`
  String get passport {
    return Intl.message(
      'Hộ chiếu',
      name: 'passport',
      desc: '',
      args: [],
    );
  }

  /// `Giấy đăng ký kinh doanh`
  String get businessRegistrationCertificate {
    return Intl.message(
      'Giấy đăng ký kinh doanh',
      name: 'businessRegistrationCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản đã được đăng ký thành công. \nVui lòng Đăng nhập để tiếp tục!`
  String get accountRegisteredSuccessfully {
    return Intl.message(
      'Tài khoản đã được đăng ký thành công. \nVui lòng Đăng nhập để tiếp tục!',
      name: 'accountRegisteredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận thông tin`
  String get confirmInformation {
    return Intl.message(
      'Xác nhận thông tin',
      name: 'confirmInformation',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin đăng ký`
  String get informationRegistration {
    return Intl.message(
      'Thông tin đăng ký',
      name: 'informationRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Tên Cơ quan/Tổ chức/Cá nhân`
  String get nameBusinessPersonal {
    return Intl.message(
      'Tên Cơ quan/Tổ chức/Cá nhân',
      name: 'nameBusinessPersonal',
      desc: '',
      args: [],
    );
  }

  /// `Số CCCD/Hộ chiếu/Mã số thuế`
  String get citizenIdFullLabel {
    return Intl.message(
      'Số CCCD/Hộ chiếu/Mã số thuế',
      name: 'citizenIdFullLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sửa thông tin`
  String get editInformation {
    return Intl.message(
      'Sửa thông tin',
      name: 'editInformation',
      desc: '',
      args: [],
    );
  }

  /// `Tỉnh/Thành phố, Quận/Huyện, Phường/Xã`
  String get addressFullLabel {
    return Intl.message(
      'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã',
      name: 'addressFullLabel',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ chi tiết`
  String get detailAddress {
    return Intl.message(
      'Địa chỉ chi tiết',
      name: 'detailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý: Thông tin địa chỉ sẽ hiển thị trên chứng thư số. Trường hợp thay đổi vui lòng chọn lại`
  String get noteInformationAddress {
    return Intl.message(
      'Lưu ý: Thông tin địa chỉ sẽ hiển thị trên chứng thư số. Trường hợp thay đổi vui lòng chọn lại',
      name: 'noteInformationAddress',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý: Số điện thoại này sử dụng để nhận mã xác thực giao dịch!`
  String get notePhoneNumber {
    return Intl.message(
      'Lưu ý: Số điện thoại này sử dụng để nhận mã xác thực giao dịch!',
      name: 'notePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get complete {
    return Intl.message(
      'Hoàn thành',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Tuỳ chọn địa chỉ`
  String get addressOption {
    return Intl.message(
      'Tuỳ chọn địa chỉ',
      name: 'addressOption',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực số điện thoại`
  String get phoneNumberVerification {
    return Intl.message(
      'Xác thực số điện thoại',
      name: 'phoneNumberVerification',
      desc: '',
      args: [],
    );
  }

  /// `OTP đã được gửi về số điện thoại`
  String get otpSendToPhone {
    return Intl.message(
      'OTP đã được gửi về số điện thoại',
      name: 'otpSendToPhone',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã otp sau`
  String get resendOTPLater {
    return Intl.message(
      'Gửi lại mã otp sau',
      name: 'resendOTPLater',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản thành công`
  String get successfulAccountRegistration {
    return Intl.message(
      'Đăng ký tài khoản thành công',
      name: 'successfulAccountRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn đăng ký chứng thư số để sử dụng dịch vụ ký số từ xa VNPT SmartCA!`
  String get desSuccessfulAccountRegistration {
    return Intl.message(
      'Vui lòng chọn đăng ký chứng thư số để sử dụng dịch vụ ký số từ xa VNPT SmartCA!',
      name: 'desSuccessfulAccountRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Giao dịch gần đây`
  String get recentTransactions {
    return Intl.message(
      'Giao dịch gần đây',
      name: 'recentTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Ký phiếu đề nghị`
  String get signTheProposalForm {
    return Intl.message(
      'Ký phiếu đề nghị',
      name: 'signTheProposalForm',
      desc: '',
      args: [],
    );
  }

  /// `Đang tạo hợp đồng`
  String get creatingContract {
    return Intl.message(
      'Đang tạo hợp đồng',
      name: 'creatingContract',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang khởi tạo hợp đồng\nVui lòng đợi trong giây lát...`
  String get theSystemIsInitializingTheContract {
    return Intl.message(
      'Hệ thống đang khởi tạo hợp đồng\nVui lòng đợi trong giây lát...',
      name: 'theSystemIsInitializingTheContract',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng thử lại sau ít phút`
  String get pleaseTryAgainInAFewMinutes {
    return Intl.message(
      'Vui lòng thử lại sau ít phút',
      name: 'pleaseTryAgainInAFewMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Xem chi tiết đơn hàng`
  String get viewOrderDetail {
    return Intl.message(
      'Xem chi tiết đơn hàng',
      name: 'viewOrderDetail',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin gói chứng thư số`
  String get orderDetailCert {
    return Intl.message(
      'Thông tin gói chứng thư số',
      name: 'orderDetailCert',
      desc: '',
      args: [],
    );
  }

  /// `Đã thanh toán`
  String get paymentDone {
    return Intl.message(
      'Đã thanh toán',
      name: 'paymentDone',
      desc: '',
      args: [],
    );
  }

  /// `Chưa thanh toán`
  String get paymentWaiting {
    return Intl.message(
      'Chưa thanh toán',
      name: 'paymentWaiting',
      desc: '',
      args: [],
    );
  }

  /// `Đang xử lý yêu cầu`
  String get processingRequest {
    return Intl.message(
      'Đang xử lý yêu cầu',
      name: 'processingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Đơn hàng của bạn đang được xử lý.\nVui lòng đợi trong giây lát...`
  String get processingRequestDescription {
    return Intl.message(
      'Đơn hàng của bạn đang được xử lý.\nVui lòng đợi trong giây lát...',
      name: 'processingRequestDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hộ chiếu không đúng định dạng`
  String get validate_passport_error {
    return Intl.message(
      'Hộ chiếu không đúng định dạng',
      name: 'validate_passport_error',
      desc: '',
      args: [],
    );
  }

  /// `Để đăng ký tài khoản vui lòng liên hệ số hotline {hotline} nhánh 1 (miễn phí)!`
  String registerAccountContactHotline(Object hotline) {
    return Intl.message(
      'Để đăng ký tài khoản vui lòng liên hệ số hotline $hotline nhánh 1 (miễn phí)!',
      name: 'registerAccountContactHotline',
      desc: '',
      args: [hotline],
    );
  }

  /// `Rất tiếc, chúng tôi không thể xác minh giấy tờ của Bạn. Vui lòng liên hệ Tổng đài {hotline} (nhánh 1) để được hỗ trợ xác minh thông tin tại quầy!`
  String ekycErrorContactHotline(Object hotline) {
    return Intl.message(
      'Rất tiếc, chúng tôi không thể xác minh giấy tờ của Bạn. Vui lòng liên hệ Tổng đài $hotline (nhánh 1) để được hỗ trợ xác minh thông tin tại quầy!',
      name: 'ekycErrorContactHotline',
      desc: '',
      args: [hotline],
    );
  }

  /// `Số điện thoại không chính xác`
  String get phoneNumberIncorrect {
    return Intl.message(
      'Số điện thoại không chính xác',
      name: 'phoneNumberIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đúng số điện thoại đã đăng ký. Quý khách kiểm tra email để biết thông tin số điện thoại.`
  String get enterPhoneNumberForRegister {
    return Intl.message(
      'Vui lòng nhập đúng số điện thoại đã đăng ký. Quý khách kiểm tra email để biết thông tin số điện thoại.',
      name: 'enterPhoneNumberForRegister',
      desc: '',
      args: [],
    );
  }

  /// `Xem hướng dẫn xử lý`
  String get handlingInstructions {
    return Intl.message(
      'Xem hướng dẫn xử lý',
      name: 'handlingInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Trình ký`
  String get signerTranTypeDesc {
    return Intl.message(
      'Trình ký',
      name: 'signerTranTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ký tài liệu`
  String get signTranTypeDesc {
    return Intl.message(
      'Ký tài liệu',
      name: 'signTranTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ký hash`
  String get hashTranTypeDesc {
    return Intl.message(
      'Ký hash',
      name: 'hashTranTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Chờ xác nhận`
  String get verifyTranTypeDesc {
    return Intl.message(
      'Chờ xác nhận',
      name: 'verifyTranTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ký BBNT`
  String get acceptanceTranTypeDesc {
    return Intl.message(
      'Ký BBNT',
      name: 'acceptanceTranTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ký hash 769`
  String get sign769TranTypeDesc {
    return Intl.message(
      'Ký hash 769',
      name: 'sign769TranTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Tài liệu Hết hạn/Hủy xác nhận không được hỗ trợ xem lại`
  String get notSupportViewFile {
    return Intl.message(
      'Tài liệu Hết hạn/Hủy xác nhận không được hỗ trợ xem lại',
      name: 'notSupportViewFile',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đồng ý với các điều khoản chính sách bảo vệ dữ liệu cá nhân của VNPT Vinaphone `
  String get iAgreeTerms {
    return Intl.message(
      'Tôi đồng ý với các điều khoản chính sách bảo vệ dữ liệu cá nhân của VNPT Vinaphone ',
      name: 'iAgreeTerms',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone.`
  String get iReadAndAgree {
    return Intl.message(
      'Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone.',
      name: 'iReadAndAgree',
      desc: '',
      args: [],
    );
  }

  /// `Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone.`
  String get iDontWantReceive {
    return Intl.message(
      'Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone.',
      name: 'iDontWantReceive',
      desc: '',
      args: [],
    );
  }

  /// `tại đây`
  String get here {
    return Intl.message(
      'tại đây',
      name: 'here',
      desc: '',
      args: [],
    );
  }

  /// `Chính sách bảo vệ dữ liệu cá nhân`
  String get personalDataProtectionPolicy {
    return Intl.message(
      'Chính sách bảo vệ dữ liệu cá nhân',
      name: 'personalDataProtectionPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Chính sách bảo vệ dữ liệu cá nhân của khách hàng (sau đây gọi tắt là “Chính Sách”) nhằm mục đích thông báo với Khách Hàng những Dữ Liệu Cá Nhân được TỔNG CÔNG TY DỊCH VỤ VIỄN THÔNG (“VNPT-VINAPHONE”) xử lý, mục đích xử lý, cách thức xử lý, thời gian lưu trữ, chia sẻ Dữ Liệu Cá Nhân, và các quyền của Khách Hàng đối với Dữ Liệu Cá Nhân của mình theo quy định của pháp luật Việt Nam về bảo vệ dữ liệu cá nhân. Chính Sách này đồng thời đưa ra các khuyến nghị cho Khách Hàng để nâng cao nhận thức về bảo vệ dữ liệu cá nhân tránh những thiệt hại không mong muốn xảy ra trong quá trình VNPT-Vinaphone thực hiện xử lý Dữ Liệu Cá Nhân của Khách Hàng. \nChính Sách này được áp dụng cho toàn bộ các nền tảng (App, Web…), trang thông tin điện tử, kênh giao diện, phương tiện, công cụ trên các website/ứng dụng của VNPT-Vinaphone bao gồm cả việc tư vấn và ký kết hợp đồng cung cấp dịch vụ trực tiếp tại các điểm cung cấp dịch vụ viễn thông của VNPT-Vinaphone. \nChính Sách này bao gồm các nội dung sau:\nĐiều 1. Điều khoản định nghĩa  \nĐiều 2. Xử lý dữ liệu cá nhân\nĐiều 3. Mục đích xử lý dữ liệu cá nhân \nĐiều 4. Cách thức xử lý dữ liệu cá nhân \nĐiều 5. Thời gian bắt đầu, thời gian kết thúc xử lý dữ liệu cá nhân \nĐiều 6. Chia sẻ dữ liệu cá nhân\nĐiều 7. Lưu trữ dữ liệu cá nhân \nĐiều 8. Kiểm soát dữ liệu cá nhân \nĐiều 9. Bảo vệ dữ liệu cá nhân\nĐiều 10. Hậu quả, thiệt hại không mong muốn có khả năng xảy ra \nĐiều 11. Sử dụng Cookies \nĐiều 12. Quảng cáo trên Internet và bên thứ ba\nĐiều 13. Xử lý dữ liệu cá nhân không cần sự đồng ý của chủ thể dữ liệu\nĐiều 14. Thông tin liên lạc \nĐiều 15. Điều chỉnh, sửa đổi \nBằng việc tích vào ô “Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone”, Khách Hàng xác nhận rằng đã đọc, hiểu, và chấp thuận toàn bộ các điều khoản và điều kiện quy định tại Chính Sách này. Chính Sách này là một phần các điều khoản và điều kiện cung cấp dịch vụ và là một phụ lục không tách rời của Hợp đồng dịch vụ của từng sản phẩm, dịch vụ mà Khách Hàng đã xác lập với VNPT-Vinaphone.  \nĐiều 1. \tĐIỀU KHOẢN ĐỊNH NGHĨA\nTrong phạm vi Chính Sách này, trừ khi ngữ cảnh yêu cầu khác đi, các thuật ngữ dưới đây được hiểu và giải thích như sau: \n1.1.\tVNPT-Vinaphone có nghĩa là TỔNG CÔNG TY DỊCH VỤ VIỄN THÔNG \n1.2.\tKhách Hàng có nghĩa là \n•\tCá nhân hoặc người đại diện hợp pháp của cá nhân sử dụng và/hoặc quan tâm tới các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone; \n•\tCá nhân hoặc người đại diện hợp pháp của cá nhân đã truy cập và/hoặc đăng ký tài khoản tại các website và/hoặc ứng dụng thuộc quyền sở hữu của VNPT-Vinaphone.  \n1.3.\tSản Phẩm, Dịch Vụ Của VNPT-Vinaphone có nghĩa là \n•\tSản phẩm, dịch vụ do VNPT-Vinaphone trực tiếp nghiên cứu, phát triển và cung cấp cho Khách Hàng;\n•\tSản phẩm, dịch vụ của Tập đoàn Bưu chính Viễn thông hoặc các sản phẩm, dịch vụ của các đơn vị trực thuộc Tập đoàn Bưu chính Viễn thông mà VNPT-Vinaphone là bên đại diện thực hiện các quyền và nghĩa vụ của bên cung cấp dịch vụ;\n•\tSản phẩm, dịch vụ do VNPT-Vinaphone hợp tác với (các) bên thứ ba để cung cấp cho Khách Hàng. \nĐiều 2. \tXỬ LÝ DỮ LIỆU CÁ NHÂN \n2.1\tVNPT-Vinaphone tiến hành xử lý Dữ Liệu Cá Nhân của Khách Hàng trong từng trường hợp cụ thể, bao gồm, nhưng không giới hạn bởi: \n•\tKhi Khách Hàng hoặc người đại diện hợp pháp của Khách Hàng liên hệ với VNPT-Vinaphone để yêu cầu tư vấn Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone hoặc bày tỏ sự quan tâm tới các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone; \n•\tKhi Khách Hàng sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n•\tKhi Khách Hàng truy cập và/hoặc đăng ký tài khoản tại các website và/hoặc ứng dụng thuộc quyền sở hữu của VNPT-Vinaphone;\n•\tKhi Khách Hàng đồng thuận cung cấp Dữ Liệu Cá Nhân cho VNPT-Vinaphone qua các nguồn công khai, bao gồm nhưng không giới hạn bởi: cuộc họp, sự kiện, hội thảo, hội nghị, các mạng xã hội, hay chương trình đối thoại, thảo luận do VNPT-Vinaphone tổ chức, tài trợ hoặc tham dự và/hoặc từ các tệp lưu trữ (cookies) ghi nhận được trên trang website của VNPT-Vinaphone;\n•\tKhi Khách Hàng cho phép một bên thứ ba không phải là VNPT-Vinaphone thực hiện chia sẻ Dữ Liệu Cá Nhân của Khách hàng với VNPT-Vinaphone;\n•\tKhi Khách Hàng là khách hàng của một tổ chức, doanh nghiệp được VNPT-Vinaphone thực hiện góp vốn, mua cổ phần; \n•\tKhi có yêu cầu của các cơ quan nhà nước có thẩm quyền. \n2.2\tDữ Liệu Cá Nhân của Khách Hàng mà VNPT- Vinaphone tiến hành xử lý (sau đây gọi tắt là “Dữ Liệu Cá Nhân”) bao gồm nhưng không giới hạn và có thể thay đổi tùy thuộc và sản phẩm hoặc dịch vụ, tương tác của Khách Hàng với VNPT-Vinaphone: \n2.2.1.\tDữ liệu cá nhân cơ bản\na) Họ, chữ đệm và tên khai sinh, tên gọi khác (nếu có);\nb) Ngày, tháng, năm sinh; ngày, tháng, năm chết hoặc mất tích;\nc) Giới tính;\nd) Nơi sinh, nơi đăng ký khai sinh, nơi thường trú, nơi tạm trú, nơi ở hiện tại, quê quán, địa chỉ liên hệ;\nđ) Quốc tịch;\ne) Hình ảnh của cá nhân;\ng) Số điện thoại, số chứng minh nhân dân, số định danh cá nhân, số hộ chiếu, số giấy phép lái xe, số biển số xe, số mã số thuế cá nhân, số bảo hiểm xã hội, số thẻ bảo hiểm y tế;\nh) Tình trạng hôn nhân;\ni) Thông tin về mối quan hệ gia đình (cha mẹ, con cái);\nk) Thông tin về tài khoản số của cá nhân; dữ liệu cá nhân phản ánh hoạt động, lịch sử hoạt động trên không gian mạng;\nl) Điểm tín nhiệm viễn thông của Khách hàng: được thể hiện dưới dạng điểm số, là kết quả của quá trình VNPT-Vinaphone xử lý, phân tích dữ liệu của Khách Hàng sử dụng dịch vụ viễn thông, nhằm đánh giá, phân tích, dự đoán hoạt động như: thói quen, sở thích, mức độ tin cậy, hành vi, địa điểm, xu hướng, năng lực và các trường hợp khác, hỗ trợ cho việc cung cấp các sản phẩm, dịch vụ viễn thông của VNPT-Vinaphone cho Khách Hàng một cách tốt nhất. \n2.2.2.\tDữ liệu cá nhân nhạy cảm \na) Dữ liệu về tội phạm, hành vi phạm tội được thu thập, lưu trữ bởi các cơ quan thực thi pháp luật;\nb) Thông tin khách hàng của tổ chức tín dụng, chi nhánh ngân hàng nước ngoài, tổ chức cung ứng dịch vụ trung gian thanh toán, các tổ chức được phép khác, gồm: thông tin định danh khách hàng theo quy định của pháp luật, thông tin về tài khoản, thông tin về tiền gửi, thông tin về tài sản gửi, thông tin về giao dịch, thông tin về tổ chức, cá nhân là bên bảo đảm tại tổ chức tín dụng, chi nhánh ngân hàng, tổ chức cung ứng dịch vụ trung gian thanh toán;\nc) Dữ liệu về vị trí của cá nhân được xác định qua dịch vụ định vị.\n2.2.3.\tDữ liệu cá nhân khác không thuộc nhóm dữ liệu cá nhân cơ bản và dữ liệu cá nhân nhạy cảm quy định tại Điều 2.2.1 và Điều 2.2.2. \n2.3.\tVNPT-Vinaphone sẽ thông báo cho Khách Hàng các Dữ Liệu Cá Nhân bắt buộc phải cung cấp và/hoặc tùy chọn cung cấp tại thời điểm thu thập Dữ Liệu Cá Nhân của Khách Hàng. Nếu các Dữ Liệu Cá Nhân bắt buộc không được cung cấp theo yêu cầu, Khách Hàng sẽ không thể sử dụng một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone và/hoặc VNPT-Vinaphone có thể từ chối cung cấp Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng mà không phải chịu bất kì một khoản bồi thường và/hoặc phạt vi phạm nào. \n2.4.\tTại từng thời điểm, Khách Hàng có thể tự nguyện cung cấp cho VNPT-Vinaphone các Dữ Liệu Cá Nhân nằm ngoài yêu cầu của VNPT-Vinaphone. Khi Khách Hàng cung cấp Dữ Liệu Cá Nhân cho VNPT-Vinaphone với bất cứ lý do gì, đồng nghĩa với việc Khách Hàng đã đồng ý cho phép VNPT-Vinaphone xử lý Dữ Liệu Cá Nhân đó với Mục Đích được nêu trong Chính Sách này hoặc với mục đích được nêu tại thời điểm Khách Hàng cung cấp những Dữ Liệu Cá Nhân đó. Ngoài ra, khi chủ động cung cấp thông tin nằm ngoài yêu cầu của VNPT-Vinaphone, Khách Hàng vui lòng không cung cấp Dữ Liệu Cá Nhân nhạy cảm theo quy định của pháp luật tại từng thời điểm. VNPT-Vinaphone sẽ không thực hiện xử lý và không chịu bất kì trách nhiệm pháp lý nào đối với các Dữ Liệu Cá Nhân nhạy cảm do Khách Hàng tự nguyện cung cấp nằm ngoài yêu cầu của VNPT-Vinaphone. \nĐiều 3. \tMỤC ĐÍCH XỬ LÝ DỮ LIỆU CÁ NHÂN \nVNPT - Vinaphone có thể xử lý Dữ Liệu Cá Nhân của Khách Hàng cho một hoặc một vài mục đích được liệt kê sau đây (“Mục Đích”) bao gồm, nhưng không giới hạn bởi các Mục Đích sau: \n3.1.\tXác minh tính chính xác, đầy đủ của các thông tin được Khách Hàng cung cấp; xác định hoặc xác thực danh tính của Khách Hàng và thực hiện quy trình xác thực Khách Hàng; Xử lý việc đăng ký sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.2.\tThẩm định hồ sơ và khả năng đủ điều kiện của Khách Hàng đối với việc sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone. VNPT-Vinaphone có thể sử dụng các phương pháp chấm điểm, gán ngưỡng cước nóng, kiểm tra lịch sử Khách Hàng sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone để đánh giá và quản trị rủi ro tín dụng, đảm bảo khả năng thanh toán đối với các nghĩa vụ thanh toán và các nghĩa vụ khác có liên quan trong suốt quá trình cung cấp Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng;\n3.3.\tQuản lý và đánh giá các hoạt động kinh doanh bao gồm thiết kế, cải tiến và nâng cao chất lượng các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone hoặc thực hiện các hoạt động truyền thông tiếp thị; Thực hiện nghiên cứu thị trường, khảo sát và phân tích dữ liệu liên quan đến Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.4.\tLiên hệ với Khách Hàng nhằm trao đổi thông tin, giải quyết yêu cầu, khiếu nại, giao các hóa đơn, các sao kê, các báo cáo hoặc các tài liệu khác liên quan tới Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone thông qua các kênh khác nhau (ví dụ: email, chat) và để trả lời yêu cầu của Khách Hàng. Điều này bao gồm việc liên hệ với Khách Hàng (hoặc các bên cần thiết khác) để thông báo cho Khách Hàng về thông tin liên quan đến việc sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.5.\tQuảng cáo, tiếp thị dựa trên sở thích, thói quen sử dụng dịch vụ của Khách Hàng: VNPT-Vinaphone có thể sử dụng Dữ Liệu Cá Nhân để quảng cáo, tiếp thị với Khách Hàng về các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone, chương trình khuyến mại, nghiên cứu, khảo sát, tin tức, thông tin cập nhật, các sự kiện, cuộc thi có thưởng, trao các phần thưởng có liên quan, các quảng cáo và nội dung có liên quan về Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone, sản phẩm, dịch vụ của các đơn vị thuộc hệ sinh thái của Tập đoàn Bưu chính Viễn thông Việt Nam hoặc của các đối tác hợp tác với VNPT-Vinaphone hoặc hợp tác với các đơn vị trực thuộc Tập đoàn Bưu chính Viễn thông Việt Nam. Trường hợp Khách Hàng không muốn nhận email, tin nhắn và/hoặc bản tin định kỳ với mục đích quảng cáo, tiếp thị của VNPT-Vinaphone với tần suất tùy thuộc vào chính sách của VNPT-Vinaphone theo từng thời kỳ và phù hợp với quy định pháp luật, Khách Hàng có thể tích vào ô “Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone” hoặc liên hệ với VNPT-Vinaphone theo các thông tin liên lạc quy định tại Chính Sách này để được hỗ trợ;\n3.6.\tLập các báo cáo tài chính, báo cáo hoạt động hoặc các loại báo cáo liên quan khác mà pháp luật quy định;\n3.7.\tTuân thủ các nghĩa vụ pháp lý theo quy định của pháp luật;\n3.8.\tNgăn chặn gian lận hoặc giảm thiểu mối đe doạ đối với tính mạng, sức khỏe của người khác và lợi ích công cộng: VNPT-Vinaphone có thể sử dụng thông tin cá nhân của Khách Hàng để ngăn chặn và phát hiện gian lận và lạm dụng nhằm bảo vệ Khách Hàng, VNPT-Vinaphone và các chủ thể liên quan;\n3.9.\tQuản trị nội bộ;\n3.10.\tCác mục đích khác có liên quan đến những mục đích được nêu trên.\nĐiều 4. \tCÁCH THỨC XỬ LÝ DỮ LIỆU CÁ NHÂN\nVNPT-Vinaphone áp dụng một hoặc nhiều hoạt động tác động tới Dữ Liệu Cá Nhân như: thu thập, ghi, phân tích, xác nhận, lưu trữ, chỉnh sửa, công khai, kết hợp, truy cập, truy xuất, thu hồi, mã hóa, giải mã, sao chép, chia sẻ, truyền đưa, cung cấp, chuyển giao, xóa, hủy dữ liệu cá nhân hoặc các hành động khác có liên quan. \nĐiều 5. \tTHỜI GIAN BẮT ĐẦU, THỜI GIAN KẾT THÚC XỬ LÝ DỮ LIỆU \n5.1.\tThời gian bắt đầu xử lý dữ liệu\nKể từ thời điểm Khách Hàng chấp thuận với Chính sách này. \n5.2.\tThời gian kết thúc xử lý dữ liệu \nTrừ trường hợp pháp luật Việt Nam có quy định khác hoặc Khách Hàng có yêu cầu chấm dứt việc xử lý Dữ Liệu Cá Nhân của Khách Hàng, VNPT-Vinaphone chấm dứt việc xử lý Dữ Liệu Cá Nhân khi đã hoàn thành Mục Đích quy định tại Chính Sách này. \nĐiều 6. \tCHIA SẺ DỮ LIỆU CÁ NHÂN \n6.1.\tĐể thực hiện các Mục Đích quy định tại Chính Sách này, VNPT-Vinaphone có thể chia sẻ Dữ Liệu Cá Nhân của Khách Hàng với:\n6.1.1.\tCác công ty con, đơn vị trực thuộc của VNPT-Vinaphone, công ty mẹ là Tập đoàn Bưu Chính Viễn thông Việt Nam, các đơn vị trực thuộc, liên kết của Tập đoàn Bưu Chính Viễn thông Việt Nam: Một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone do Tập đoàn Bưu chính Viễn thông Việt Nam, các đơn vị trực thuộc, liên kết của Tập đoàn hợp tác với VNPT-Vinaphone cung cấp, do đó, việc chia sẻ Dữ Liệu Cá Nhân với các chủ thể này là cần thiết và chỉ nhằm mục đích cung cấp dịch vụ cho Khách Hàng;\n6.1.2.\tBên thứ ba cung cấp dịch vụ: VNPT-Vinaphone sử dụng và/hoặc hợp tác với các công ty và cá nhân khác để thực hiện một số công việc và chương trình như chương trình khuyến mại dành cho Khách Hàng, nghiên cứu thị trường, phân tích và phát triển sản phẩm, tư vấn chiến lược, cung cấp dịch vụ thu cước. Các Bên thứ ba cung cấp dịch vụ này có quyền truy cập, thu thập, sử dụng và xử lý Dữ Liệu Cá Nhân cần thiết để thực hiện các chức năng của họ, bao gồm nhưng không giới hạn hoạt động quảng cáo, giới thiệu, cung cấp các sản phẩm/dịch vụ khác thuộc hệ sinh thái của Tập đoàn Bưu chính Viễn thông Việt Nam hoặc của các đối tác hợp tác với Tập đoàn Bưu chính Viễn thông Việt Nam hoặc hợp tác với các đơn vị trực thuộc, liên kết của Tập đoàn Bưu chính Viễn thông Việt Nam. Các bên thứ ba cung cấp dịch vụ này phải tuân thủ pháp luật về bảo vệ Dữ Liệu Cá Nhân với tư cách là Bên Xử lý Dữ Liệu;\n6.1.3.\tTái cấu trúc doanh nghiệp: Trong quá trình phát triển kinh doanh, VNPT-Vinaphone có thể bán hoặc mua các doanh nghiệp hoặc tái cấu trúc doanh nghiệp phù hợp với quy định của pháp luật và nhu cầu sản xuất kinh doanh. Trong các giao dịch như vậy, Dữ Liệu Cá Nhân là một trong những tài sản kinh doanh được chuyển nhượng nhưng bên nhận chuyển nhượng vẫn phải tuân theo các quy định của Chính Sách này;\n6.1.4.\tBảo vệ quyền và lợi ích hợp pháp của VNPT-Vinaphone và các chủ thể khác: VNPT-Vinaphone được phép tiết lộ Dữ Liệu Cá Nhân khi VNPT-Vinaphone có căn cứ cho rằng việc tiết lộ này được pháp luật yêu cầu, theo yêu cầu của cơ quan quản lý nhà nước, để thực thi hoặc áp dụng các điều khoản và thỏa thuận khác của VNPT-Vinaphone hoặc để bảo vệ quyền, tài sản hoặc an ninh của VNPT-Vinaphone, khách hàng của VNPT-Vinaphone, hoặc bất kỳ chủ thể nào khác. Các công việc nêu trên có thể bao gồm việc trao đổi thông tin với các công ty và tổ chức khác để ngăn chặn và phát hiện gian lận và giảm rủi ro tài sản và tín dụng, hoặc tiết lộ một số loại thông tin nhất định trong trường hợp VNPT-Vinaphone nhận được yêu cầu ràng buộc về mặt pháp lý từ các cơ quan nhà nước có thẩm quyền;\n6.1.5.\tTùy theo sự lựa chọn của Khách Hàng: Ngoài các trường hợp nêu trên, Dữ Liệu Cá Nhân có thể được chia sẻ với bên thứ ba nhằm mục đích theo quy định tại Điều 3.5 Chính Sách này và Khách Hàng sẽ có quyền không chấp thuận việc chia sẻ thông tin theo quy định tại Điều 8.4 Chính Sách này. \n6.2.\tVNPT-Vinaphone không thực hiện chia sẻ Dữ Liệu Cá Nhân vì mục đích lợi nhuận. \nĐiều 7. \tLƯU TRỮ DỮ LIỆU CÁ NHÂN \n7.1.\tDữ Liệu Cá Nhân của Khách Hàng do VNPT-Vinaphone lưu trữ sẽ được bảo mật. VNPT-Vinaphone, trong khả năng của mình, sẽ nỗ lực thực hiện các biện pháp hợp lý để bảo vệ Dữ Liệu Cá Nhân của Khách Hàng.\n7.2.\tĐịa điểm lưu trữ Dữ Liệu Cá nhân\nTrong phạm vi pháp luật cho phép, VNPT-Vinaphone có thể lưu trữ Dữ Liệu Cá Nhân của Khách Hàng tại Việt Nam và ở nước ngoài, kể cả trên giải pháp lưu trữ điện toán đám mây. VNPT-Vinaphone áp dụng các tiêu chuẩn về bảo mật dữ liệu phù hợp với quy định pháp luật hiện hành.\n7.3.\tThời gian lưu trữ Dữ Liệu Cá Nhân\nVNPT-Vinaphone chỉ thực hiện lưu trữ Dữ Liệu Cá Nhân của Khách Hàng trong khoảng thời gian cần thiết và hợp lý để hoàn thành các Mục Đích. Trường hợp pháp luật hiện hành có quy định về thời hạn lưu trữ Dữ Liệu Cá Nhân kể cả sau khi đã hoàn thành Mục Đích nêu trong Chính Sách này, VNPT-Vinaphone có nghĩa vụ tuân thủ quy định của pháp luật. \nĐiều 8. \tKIỂM SOÁT DỮ LIỆU CÁ NHÂN \n8.1.\tQuyền được biết và Quyền đồng ý\nBằng Chính Sách này, VNPT-Vinaphone thông báo cho Khách Hàng được biết về hoạt động xử lý Dữ Liệu Cá Nhân của Khách Hàng trước khi thực hiện xử lý Dữ Liệu Cá Nhân. Đồng thời, Khách Hàng có quyền đồng ý hoặc không đồng ý với các điều khoản và điều kiện của Chính Sách này bằng cách tích hoặc không tích vào ô “Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone”.\n8.2.\tQuyền truy cập và yêu cầu cung cấp Dữ Liệu Cá Nhân \nKhách Hàng có quyền truy cập vào các ứng dụng/website của VNPT-Vinaphone và/hoặc liên hệ trực tiếp với VNPT-Vinaphone để kiểm tra, trích xuất các Dữ Liệu Cá Nhân mà Khách Hàng đã cung cấp cho VNPT-Vinaphone phục vụ các Mục Đích quy định tại Chính Sách này. Trường hợp Khách Hàng không thể tự truy cập, trích xuất hoặc gặp khó khăn trong việc truy cập, trích xuất các Dữ Liệu Cá Nhân, Khách Hàng có thể liên hệ với VNPT-Vinaphone để được hỗ trợ.\n8.3.\tQuyền chỉnh sửa\nKhách Hàng có quyền chỉnh sửa các Dữ Liệu Cá Nhân của mình với điều kiện và việc chỉnh sửa này không vi phạm các quy định của pháp luật. Trường hợp Khách Hàng không thể tự chỉnh sửa hoặc gặp khó khăn trong việc chỉnh sửa các Dữ Liệu Cá Nhân, Khách Hàng có thể liên hệ với VNPT-Vinaphone để được hỗ trợ.\n8.4.\tQuyền phản đối, hạn chế, rút lại sự đồng ý xử lý dữ liệu\nTrường hợp Khách Hàng không muốn nhận nội dung tiếp thị quảng cáo, khuyến mại từ VNPT-Vinaphone và muốn rút lại sự chấp thuận trước đó (nếu có) và/hoặc phản đối việc tiếp tục sử dụng thông tin cá nhân của mình cho mục đích trên, vui lòng đánh dấu vào ô “Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone” tại thời điểm VNPT-Vinaphone thu thập dữ liệu cá nhân, hoặc gửi từ chối dịch vụ quảng cáo theo cú pháp được hướng dẫn (hoặc cách thức khác theo quy định tại hợp đồng liên quan với Khách Hàng) hoặc liên hệ với VNPT-Vinaphone theo các thông tin được cung cấp tại Chính Sách này. Nếu Khách Hàng không muốn nhận thông báo từ ứng dụng của VNPT-Vinaphone, vui lòng điều chỉnh cài đặt thông báo trong ứng dụng hoặc thiết bị của mình. \n8.5.\tQuyền xóa Dữ Liệu Cá Nhân \nKhách Hàng có quyền yêu cầu VNPT-Vinaphone thực hiện xóa Dữ Liệu Cá Nhân của Khách Hàng với điều kiện là yêu cầu của Khách Hàng phải phù hợp với quy định của pháp luật về cung cấp các sản phẩm, dịch vụ viễn thông và công nghệ thông tin. Tuy nhiên, việc yêu cầu xóa Dữ Liệu Cá Nhân có thể dẫn tới việc VNPT-Vinaphone không thể cung cấp được một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng, điều này đồng nghĩa với việc VNPT-Vinaphone có thể đơn phương chấm dứt hợp đồng mà không cần phải bồi thường cho Khách Hàng do các điều kiện để thực hiện hợp đồng đã thay đổi. Do đó, VNPT-Vinaphone khuyến nghị Khách Hàng cân nhắc kĩ lưỡng trước khi yêu cầu VNPT-Vinaphone thực hiện xóa Dữ Liệu Cá Nhân. \n8.6.\tQuyền khiếu nại \nKhách Hàng có quyền khiếu nại trực tiếp với VNPT-Vinaphone hoặc với cơ quan nhà nước có thẩm quyền trong trường hợp Khách Hàng cho rằng VNPT-Vinaphone vi phạm các quy định của pháp luật liên quan tới bảo vệ Dữ Liệu Cá Nhân. \nĐiều 9. \tBẢO VỆ DỮ LIỆU CÁ NHÂN \n9.1.\tNghĩa vụ của VNPT-Vinaphone\nVNPT-Vinaphone nỗ lực đảm bảo Dữ Liệu Cá Nhân của Khách Hàng được bảo vệ khỏi các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân. VNPT-Vinaphone duy trì cam kết bảo mật Dữ Liệu Cá Nhân này bằng cách áp dụng những biện pháp vật lý, điện tử và quản lý để bảo vệ Dữ Liệu Cá Nhân, bao gồm: \n•\tCác máy chủ trang thông tin điện tử chính thức của VNPT-Vinaphone được bảo vệ bởi “bức tường lửa” và hệ thống của VNPT-Vinaphone luôn được kiểm tra để phòng tránh các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân;\n•\tVNPT-Vinaphone sẽ thực hiện tất cả các bước hợp lý để đảm bảo rằng Dữ Liệu Cá Nhân của Khách Hàng, Dữ Liệu Cá Nhân do Đối Tác Kiểm Soát Dữ Liệu Cá Nhân cung cấp không bị lưu giữ lâu hơn mức cần thiết và rằng VNPT-Vinaphone sẽ luôn tuân thủ những yêu cầu của pháp luật liên quan đến việc lưu trữ Dữ Liệu Cá Nhân. \n9.2.\tNghĩa vụ của Khách Hàng \nKhách Hàng có trách nhiệm bảo vệ Dữ Liệu Cá Nhân của mình như sau: \n•\tChủ động thực hiện các biện pháp giúp ngăn chặn việc truy cập trái phép vào mật khẩu, quản lý và sử dụng tài khoản, thiết bị di động của mình (bao gồm nhưng không giới hạn bởi điện thoại thông minh, máy tính, máy tính bảng, laptop) bằng cách đăng xuất tài khoản sau khi sử dụng, đặt một mật khẩu mạnh và khó đoán và giữ bí mật thông tin đăng nhập cũng như mật khẩu của mình. VNPT-Vinaphone được loại trừ trách nhiệm với Khách Hàng trong trường hợp Khách hàng bị lộ/mất, bị đánh cắp hoặc xâm phạm mật khẩu, hoặc bất kỳ hoạt động nào trên tài khoản của Khách Hàng sử dụng mật khẩu trái phép hoặc mất/thất lạc thiết bị di động dẫn đến người không có thẩm quyền tự ý sử dụng dịch vụ hoặc hệ thống bị xâm phạm bất hợp pháp bởi bên thứ ba mặc dù VNPT-Vinaphone đã thực hiện đầy đủ các biện pháp để bảo vệ hệ thống;\n•\tKhách hàng có trách nhiệm cập nhập các văn bản điều chỉnh Chính Sách này (nếu có) trên các kênh thông tin chính thống của VNPT-Vinaphone;\n•\tKhi đã chấp thuận toàn bộ điều khoản và điều kiện của của Chính Sách này, Khách Hàng có trách nhiệm cung cấp Dữ Liệu Cá Nhân chính xác, đầy đủ theo yêu cầu của VNPT-Vinaphone và thực hiện các trách nhiệm thông báo cho VNPT-Vinaphone ngay khi phát hiện có hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá nhân. Khách Hàng có thể chủ động cung cấp Dữ Liệu Cá Nhân nằm ngoài yêu cầu của VNPT-Vinaphone với điều kiện Khách Hàng phải tuân thủ quy định tại Điều 2.4 Chính Sách này;\n•\tKhách Hàng có trách nhiệm tôn trọng Dữ Liệu Cá Nhân của chủ thể khác và thực hiện quy định của pháp luật về bảo vệ Dữ Liệu Cá Nhân, tham gia phòng, chống các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân.\nĐiều 10. \tHẬU QUẢ, THIỆT HẠI KHÔNG MONG MUỐN CÓ KHẢ NĂNG XẢY RA\n10.1.\tVNPT-Vinaphone sử dụng nhiều công nghệ bảo mật thông tin khác nhau nhằm bảo vệ Dữ Liệu Cá Nhân của Khách Hàng không bị truy lục, sử dụng hoặc chia sẻ ngoài ý muốn. Tuy nhiên, không một dữ liệu nào có thể được bảo mật 100%. Do vậy, VNPT-Vinaphone cam kết sẽ bảo mật một cách tối đa Dữ Liệu Cá Nhân của Khách Hàng. Một số hậu quả, thiệt hại không mong muốn có thể xảy ra bao gồm nhưng không giới hạn: \n•\tLỗi phần cứng, phần mềm trong quá trình xử lý Dữ Liệu Cá Nhân làm mất Dữ Liệu Cá Nhân của Khách Hàng; \n•\tLỗ hổng bảo mật nằm ngoài khả năng kiểm soát của VNPT-Vinaphone, hệ thống bị hacker tấn công gây lộ lọt Dữ Liệu Cá Nhân của Khách Hàng; \n•\tKhách Hàng tự làm lộ lọt Dữ Liệu Cá Nhân của Khách Hàng do: bất cẩn hoặc bị lừa đảo; truy cập các website/tải các ứng dụng có chứa phần mềm độc hại.\n10.2.\tVNPT-Vinaphone khuyến cáo Khách Hàng thực hiện nghiêm ngặt các trách nhiệm bảo vệ Dữ Liệu Cá Nhân theo quy định tại Điều 9.2 Chính Sách này và theo quy định của pháp luật. \n10.3.\tTrong trường hợp máy chủ lưu trữ dữ liệu bị hacker tấn công dẫn đến mất mát Dữ Liệu Cá Nhân của Khách Hàng, VNPT-Vinaphone sẽ có trách nhiệm thông báo vụ việc cho cơ quan chức năng điều tra xử lý kịp thời và thông báo cho Khách Hàng được biết. \nĐiều 11. \tSỬ DỤNG COOKIES \n11.1.\tCookies có thể được sử dụng trên website của VNPT-Vinaphone. “Cookies” là các tệp văn bản nhỏ được lưu trên ổ cứng máy tính của Khách Hàng nhằm giúp tùy biến trải nghiệm website cho người dùng. VNPT-Vinaphone có chính sách sử dụng cookies nhằm khiến việc điều hướng trang web dễ dàng hơn và tạo điều kiện thuận lợi cho quá trình đăng nhập. Dữ liệu thống kê trang web được xử lý bởi các bên thứ ba, và do đó, địa chỉ IP của Khách Hàng sẽ được chuyển tới bên thứ ba chỉ với mục đích báo cáo thống kê.\n11.2.\tKhi VNPT-Vinaphone thu thập thông tin qua trang web của VNPT-Vinaphone, VNPT-Vinaphone tự động thu thập những thông tin không mang tính cá nhân liên quan tới việc sử dụng trang web nhưng không xác định danh tính người dùng bao gồm nhưng kh¬ông giới hạn như: địa chỉ IP của máy tính cá nhân, địa chỉ IP của nhà cung cấp dịch vụ Internet, ngày giờ truy cập trang web, hệ điều hành, các mục đã truy cập trên trang web, nội dung tải về từ trang web và địa chỉ trang web đã trực tiếp dẫn quý khách tới trang web của VNPT-Vinaphone. VNPT-Vinaphone có thể dùng những thông tin không mang tính cá nhân này để phục vụ cho những báo cáo thống kê về lưu lượng người truy cập trang web và hành vi sử dụng trang web. Các thông tin phân tích này đều không có khả năng xác định danh tính của Khách Hàng.\n11.3.\tTrường hợp Khách hàng không muốn sử dụng cookies, đa số các trình duyệt web đều cho phép người dùng từ chối cookies bằng cách thay đổi cài đặt riêng tư trên trình duyệt. Việc từ chối cookies hầu như không gây ảnh hưởng tới việc điều hướng trang web. Tuy nhiên một số chức năng của trang web có thể bị ảnh hưởng. Sau khi hoàn thành việc truy cập trang web, Khách Hàng vẫn có thể xóa cookies khỏi hệ thống nếu muốn.\nĐiều 12. \tQUẢNG CÁO TRÊN INTERNET VÀ BÊN THỨ BA\nCác ứng dụng/website của VNPT-Vinaphone có thể bao gồm quảng cáo của bên thứ ba và liên kết tới các trang website và ứng dụng khác. Các đối tác quảng cáo bên thứ ba có thể thu thập thông tin về Khách Hàng khi Khách Hàng tương tác với nội dung, quảng cáo hoặc dịch vụ của họ. Mọi quyền truy cập và sử dụng các liên kết hoặc trang website của bên thứ ba không bị điều chỉnh bởi Chính Sách này, mà thay vào đó được điều chỉnh bởi chính sách quyền riêng tư của các bên thứ ba đó. VNPT-Vinaphone không chịu trách nhiệm về các quy định về thông tin của các bên thứ ba. \nĐiều 13. \tXỬ LÝ DỮ LIỆU CÁ NHÂN KHÔNG CẦN SỰ ĐỒNG Ý CỦA CHỦ THỂ DỮ LIỆU\nVNPT-Vinaphone có thể tiến hành xử lý Dữ Liệu Cá Nhân mà không cần sự đồng ý của Chủ Thể Dữ Liệu trong các trường hợp sau: \n13.1.\tTrong trường hợp khẩn cấp, cần xử lý ngay Dữ Liệu Cá Nhân có liên quan để bảo vệ tính mạng, sức khỏe của chủ thể dữ liệu hoặc người khác;\n13.2.\tViệc công khai dữ liệu cá nhân theo quy định của luật;\n13.3.\tViệc xử lý dữ liệu của cơ quan nhà nước có thẩm quyền trong trường hợp tình trạng khẩn cấp về quốc phòng, an ninh quốc gia, trật tự an toàn xã hội, thảm họa lớn, dịch bệnh nguy hiểm; khi có nguy cơ đe dọa an ninh, quốc phòng nhưng chưa đến mức ban bố tình trạng khẩn cấp; phòng, chống bạo loạn, khủng bố, phòng, chống tội phạm và vi phạm pháp luật theo quy định của luật;\n13.4.\tĐể thực hiện nghĩa vụ theo hợp đồng của chủ thể dữ liệu với cơ quan, tổ chức, cá nhân có liên quan theo quy định của luật;\n13.5.\tPhục vụ hoạt động của cơ quan nhà nước đã được quy định theo luật chuyên ngành.\nĐiều 14. \tTHÔNG TIN LIÊN LẠC\nTrường hợp Khách Hàng có bất kỳ câu hỏi nào về Chính Sách này hoặc muốn thực hiện các quyền của Khách Hàng liên quan tới Dữ Liệu Cá Nhân, vui lòng liên hệ với VNPT-Vinaphone theo các phương thức và thông tin dưới đây: \n•\tLiên hệ tới tổng đài theo thông tin tại các website/ứng dụng chính thức của VNPT-Vinaphone tại từng thời điểm. \n•\tGửi công văn tới trụ sở chính của VNPT-Vinaphone tại Toà nhà Vinaphone, đường Xuân Tảo, Phường Xuân La, Quận Tây Hồ, Hà Nội.\n•\tLiên hệ trực tiếp tại các điểm giao dịch của VNPT-Vinaphone trên phạm vi toàn quốc. \n•\tCác cách thức liên hệ khác như Livechat, liên hệ qua fanpage chính thức của VNPT-Vinaphone, email chăm sóc khách hàng được cung cấp cho khách hàng tại mọi thời điểm. \nĐiều 15. \tĐIỀU CHỈNH VÀ SỬA ĐỔI\nVNPT-Vinaphone có thể điều chỉnh Chính Sách này vào bất kỳ thời điểm nào đồng thời đăng tải công khai Chính Sách được điều chỉnh trên các kênh thông tin chính thống của VNPT-Vinaphone. Việc Khách Hàng tiếp tục sử dụng Sản Phẩm, Dịch vụ Của VNPT-Vinaphone và không có bất kì khiếu nại nào đối với Chính Sách được điều chỉnh được hiểu rằng Khách Hàng đã chấp thuận Chính Sách được điều chỉnh đó của VNPT-Vinaphone.\n`
  String get fullPolicyProtection {
    return Intl.message(
      'Chính sách bảo vệ dữ liệu cá nhân của khách hàng (sau đây gọi tắt là “Chính Sách”) nhằm mục đích thông báo với Khách Hàng những Dữ Liệu Cá Nhân được TỔNG CÔNG TY DỊCH VỤ VIỄN THÔNG (“VNPT-VINAPHONE”) xử lý, mục đích xử lý, cách thức xử lý, thời gian lưu trữ, chia sẻ Dữ Liệu Cá Nhân, và các quyền của Khách Hàng đối với Dữ Liệu Cá Nhân của mình theo quy định của pháp luật Việt Nam về bảo vệ dữ liệu cá nhân. Chính Sách này đồng thời đưa ra các khuyến nghị cho Khách Hàng để nâng cao nhận thức về bảo vệ dữ liệu cá nhân tránh những thiệt hại không mong muốn xảy ra trong quá trình VNPT-Vinaphone thực hiện xử lý Dữ Liệu Cá Nhân của Khách Hàng. \nChính Sách này được áp dụng cho toàn bộ các nền tảng (App, Web…), trang thông tin điện tử, kênh giao diện, phương tiện, công cụ trên các website/ứng dụng của VNPT-Vinaphone bao gồm cả việc tư vấn và ký kết hợp đồng cung cấp dịch vụ trực tiếp tại các điểm cung cấp dịch vụ viễn thông của VNPT-Vinaphone. \nChính Sách này bao gồm các nội dung sau:\nĐiều 1. Điều khoản định nghĩa  \nĐiều 2. Xử lý dữ liệu cá nhân\nĐiều 3. Mục đích xử lý dữ liệu cá nhân \nĐiều 4. Cách thức xử lý dữ liệu cá nhân \nĐiều 5. Thời gian bắt đầu, thời gian kết thúc xử lý dữ liệu cá nhân \nĐiều 6. Chia sẻ dữ liệu cá nhân\nĐiều 7. Lưu trữ dữ liệu cá nhân \nĐiều 8. Kiểm soát dữ liệu cá nhân \nĐiều 9. Bảo vệ dữ liệu cá nhân\nĐiều 10. Hậu quả, thiệt hại không mong muốn có khả năng xảy ra \nĐiều 11. Sử dụng Cookies \nĐiều 12. Quảng cáo trên Internet và bên thứ ba\nĐiều 13. Xử lý dữ liệu cá nhân không cần sự đồng ý của chủ thể dữ liệu\nĐiều 14. Thông tin liên lạc \nĐiều 15. Điều chỉnh, sửa đổi \nBằng việc tích vào ô “Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone”, Khách Hàng xác nhận rằng đã đọc, hiểu, và chấp thuận toàn bộ các điều khoản và điều kiện quy định tại Chính Sách này. Chính Sách này là một phần các điều khoản và điều kiện cung cấp dịch vụ và là một phụ lục không tách rời của Hợp đồng dịch vụ của từng sản phẩm, dịch vụ mà Khách Hàng đã xác lập với VNPT-Vinaphone.  \nĐiều 1. \tĐIỀU KHOẢN ĐỊNH NGHĨA\nTrong phạm vi Chính Sách này, trừ khi ngữ cảnh yêu cầu khác đi, các thuật ngữ dưới đây được hiểu và giải thích như sau: \n1.1.\tVNPT-Vinaphone có nghĩa là TỔNG CÔNG TY DỊCH VỤ VIỄN THÔNG \n1.2.\tKhách Hàng có nghĩa là \n•\tCá nhân hoặc người đại diện hợp pháp của cá nhân sử dụng và/hoặc quan tâm tới các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone; \n•\tCá nhân hoặc người đại diện hợp pháp của cá nhân đã truy cập và/hoặc đăng ký tài khoản tại các website và/hoặc ứng dụng thuộc quyền sở hữu của VNPT-Vinaphone.  \n1.3.\tSản Phẩm, Dịch Vụ Của VNPT-Vinaphone có nghĩa là \n•\tSản phẩm, dịch vụ do VNPT-Vinaphone trực tiếp nghiên cứu, phát triển và cung cấp cho Khách Hàng;\n•\tSản phẩm, dịch vụ của Tập đoàn Bưu chính Viễn thông hoặc các sản phẩm, dịch vụ của các đơn vị trực thuộc Tập đoàn Bưu chính Viễn thông mà VNPT-Vinaphone là bên đại diện thực hiện các quyền và nghĩa vụ của bên cung cấp dịch vụ;\n•\tSản phẩm, dịch vụ do VNPT-Vinaphone hợp tác với (các) bên thứ ba để cung cấp cho Khách Hàng. \nĐiều 2. \tXỬ LÝ DỮ LIỆU CÁ NHÂN \n2.1\tVNPT-Vinaphone tiến hành xử lý Dữ Liệu Cá Nhân của Khách Hàng trong từng trường hợp cụ thể, bao gồm, nhưng không giới hạn bởi: \n•\tKhi Khách Hàng hoặc người đại diện hợp pháp của Khách Hàng liên hệ với VNPT-Vinaphone để yêu cầu tư vấn Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone hoặc bày tỏ sự quan tâm tới các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone; \n•\tKhi Khách Hàng sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n•\tKhi Khách Hàng truy cập và/hoặc đăng ký tài khoản tại các website và/hoặc ứng dụng thuộc quyền sở hữu của VNPT-Vinaphone;\n•\tKhi Khách Hàng đồng thuận cung cấp Dữ Liệu Cá Nhân cho VNPT-Vinaphone qua các nguồn công khai, bao gồm nhưng không giới hạn bởi: cuộc họp, sự kiện, hội thảo, hội nghị, các mạng xã hội, hay chương trình đối thoại, thảo luận do VNPT-Vinaphone tổ chức, tài trợ hoặc tham dự và/hoặc từ các tệp lưu trữ (cookies) ghi nhận được trên trang website của VNPT-Vinaphone;\n•\tKhi Khách Hàng cho phép một bên thứ ba không phải là VNPT-Vinaphone thực hiện chia sẻ Dữ Liệu Cá Nhân của Khách hàng với VNPT-Vinaphone;\n•\tKhi Khách Hàng là khách hàng của một tổ chức, doanh nghiệp được VNPT-Vinaphone thực hiện góp vốn, mua cổ phần; \n•\tKhi có yêu cầu của các cơ quan nhà nước có thẩm quyền. \n2.2\tDữ Liệu Cá Nhân của Khách Hàng mà VNPT- Vinaphone tiến hành xử lý (sau đây gọi tắt là “Dữ Liệu Cá Nhân”) bao gồm nhưng không giới hạn và có thể thay đổi tùy thuộc và sản phẩm hoặc dịch vụ, tương tác của Khách Hàng với VNPT-Vinaphone: \n2.2.1.\tDữ liệu cá nhân cơ bản\na) Họ, chữ đệm và tên khai sinh, tên gọi khác (nếu có);\nb) Ngày, tháng, năm sinh; ngày, tháng, năm chết hoặc mất tích;\nc) Giới tính;\nd) Nơi sinh, nơi đăng ký khai sinh, nơi thường trú, nơi tạm trú, nơi ở hiện tại, quê quán, địa chỉ liên hệ;\nđ) Quốc tịch;\ne) Hình ảnh của cá nhân;\ng) Số điện thoại, số chứng minh nhân dân, số định danh cá nhân, số hộ chiếu, số giấy phép lái xe, số biển số xe, số mã số thuế cá nhân, số bảo hiểm xã hội, số thẻ bảo hiểm y tế;\nh) Tình trạng hôn nhân;\ni) Thông tin về mối quan hệ gia đình (cha mẹ, con cái);\nk) Thông tin về tài khoản số của cá nhân; dữ liệu cá nhân phản ánh hoạt động, lịch sử hoạt động trên không gian mạng;\nl) Điểm tín nhiệm viễn thông của Khách hàng: được thể hiện dưới dạng điểm số, là kết quả của quá trình VNPT-Vinaphone xử lý, phân tích dữ liệu của Khách Hàng sử dụng dịch vụ viễn thông, nhằm đánh giá, phân tích, dự đoán hoạt động như: thói quen, sở thích, mức độ tin cậy, hành vi, địa điểm, xu hướng, năng lực và các trường hợp khác, hỗ trợ cho việc cung cấp các sản phẩm, dịch vụ viễn thông của VNPT-Vinaphone cho Khách Hàng một cách tốt nhất. \n2.2.2.\tDữ liệu cá nhân nhạy cảm \na) Dữ liệu về tội phạm, hành vi phạm tội được thu thập, lưu trữ bởi các cơ quan thực thi pháp luật;\nb) Thông tin khách hàng của tổ chức tín dụng, chi nhánh ngân hàng nước ngoài, tổ chức cung ứng dịch vụ trung gian thanh toán, các tổ chức được phép khác, gồm: thông tin định danh khách hàng theo quy định của pháp luật, thông tin về tài khoản, thông tin về tiền gửi, thông tin về tài sản gửi, thông tin về giao dịch, thông tin về tổ chức, cá nhân là bên bảo đảm tại tổ chức tín dụng, chi nhánh ngân hàng, tổ chức cung ứng dịch vụ trung gian thanh toán;\nc) Dữ liệu về vị trí của cá nhân được xác định qua dịch vụ định vị.\n2.2.3.\tDữ liệu cá nhân khác không thuộc nhóm dữ liệu cá nhân cơ bản và dữ liệu cá nhân nhạy cảm quy định tại Điều 2.2.1 và Điều 2.2.2. \n2.3.\tVNPT-Vinaphone sẽ thông báo cho Khách Hàng các Dữ Liệu Cá Nhân bắt buộc phải cung cấp và/hoặc tùy chọn cung cấp tại thời điểm thu thập Dữ Liệu Cá Nhân của Khách Hàng. Nếu các Dữ Liệu Cá Nhân bắt buộc không được cung cấp theo yêu cầu, Khách Hàng sẽ không thể sử dụng một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone và/hoặc VNPT-Vinaphone có thể từ chối cung cấp Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng mà không phải chịu bất kì một khoản bồi thường và/hoặc phạt vi phạm nào. \n2.4.\tTại từng thời điểm, Khách Hàng có thể tự nguyện cung cấp cho VNPT-Vinaphone các Dữ Liệu Cá Nhân nằm ngoài yêu cầu của VNPT-Vinaphone. Khi Khách Hàng cung cấp Dữ Liệu Cá Nhân cho VNPT-Vinaphone với bất cứ lý do gì, đồng nghĩa với việc Khách Hàng đã đồng ý cho phép VNPT-Vinaphone xử lý Dữ Liệu Cá Nhân đó với Mục Đích được nêu trong Chính Sách này hoặc với mục đích được nêu tại thời điểm Khách Hàng cung cấp những Dữ Liệu Cá Nhân đó. Ngoài ra, khi chủ động cung cấp thông tin nằm ngoài yêu cầu của VNPT-Vinaphone, Khách Hàng vui lòng không cung cấp Dữ Liệu Cá Nhân nhạy cảm theo quy định của pháp luật tại từng thời điểm. VNPT-Vinaphone sẽ không thực hiện xử lý và không chịu bất kì trách nhiệm pháp lý nào đối với các Dữ Liệu Cá Nhân nhạy cảm do Khách Hàng tự nguyện cung cấp nằm ngoài yêu cầu của VNPT-Vinaphone. \nĐiều 3. \tMỤC ĐÍCH XỬ LÝ DỮ LIỆU CÁ NHÂN \nVNPT - Vinaphone có thể xử lý Dữ Liệu Cá Nhân của Khách Hàng cho một hoặc một vài mục đích được liệt kê sau đây (“Mục Đích”) bao gồm, nhưng không giới hạn bởi các Mục Đích sau: \n3.1.\tXác minh tính chính xác, đầy đủ của các thông tin được Khách Hàng cung cấp; xác định hoặc xác thực danh tính của Khách Hàng và thực hiện quy trình xác thực Khách Hàng; Xử lý việc đăng ký sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.2.\tThẩm định hồ sơ và khả năng đủ điều kiện của Khách Hàng đối với việc sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone. VNPT-Vinaphone có thể sử dụng các phương pháp chấm điểm, gán ngưỡng cước nóng, kiểm tra lịch sử Khách Hàng sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone để đánh giá và quản trị rủi ro tín dụng, đảm bảo khả năng thanh toán đối với các nghĩa vụ thanh toán và các nghĩa vụ khác có liên quan trong suốt quá trình cung cấp Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng;\n3.3.\tQuản lý và đánh giá các hoạt động kinh doanh bao gồm thiết kế, cải tiến và nâng cao chất lượng các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone hoặc thực hiện các hoạt động truyền thông tiếp thị; Thực hiện nghiên cứu thị trường, khảo sát và phân tích dữ liệu liên quan đến Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.4.\tLiên hệ với Khách Hàng nhằm trao đổi thông tin, giải quyết yêu cầu, khiếu nại, giao các hóa đơn, các sao kê, các báo cáo hoặc các tài liệu khác liên quan tới Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone thông qua các kênh khác nhau (ví dụ: email, chat) và để trả lời yêu cầu của Khách Hàng. Điều này bao gồm việc liên hệ với Khách Hàng (hoặc các bên cần thiết khác) để thông báo cho Khách Hàng về thông tin liên quan đến việc sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.5.\tQuảng cáo, tiếp thị dựa trên sở thích, thói quen sử dụng dịch vụ của Khách Hàng: VNPT-Vinaphone có thể sử dụng Dữ Liệu Cá Nhân để quảng cáo, tiếp thị với Khách Hàng về các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone, chương trình khuyến mại, nghiên cứu, khảo sát, tin tức, thông tin cập nhật, các sự kiện, cuộc thi có thưởng, trao các phần thưởng có liên quan, các quảng cáo và nội dung có liên quan về Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone, sản phẩm, dịch vụ của các đơn vị thuộc hệ sinh thái của Tập đoàn Bưu chính Viễn thông Việt Nam hoặc của các đối tác hợp tác với VNPT-Vinaphone hoặc hợp tác với các đơn vị trực thuộc Tập đoàn Bưu chính Viễn thông Việt Nam. Trường hợp Khách Hàng không muốn nhận email, tin nhắn và/hoặc bản tin định kỳ với mục đích quảng cáo, tiếp thị của VNPT-Vinaphone với tần suất tùy thuộc vào chính sách của VNPT-Vinaphone theo từng thời kỳ và phù hợp với quy định pháp luật, Khách Hàng có thể tích vào ô “Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone” hoặc liên hệ với VNPT-Vinaphone theo các thông tin liên lạc quy định tại Chính Sách này để được hỗ trợ;\n3.6.\tLập các báo cáo tài chính, báo cáo hoạt động hoặc các loại báo cáo liên quan khác mà pháp luật quy định;\n3.7.\tTuân thủ các nghĩa vụ pháp lý theo quy định của pháp luật;\n3.8.\tNgăn chặn gian lận hoặc giảm thiểu mối đe doạ đối với tính mạng, sức khỏe của người khác và lợi ích công cộng: VNPT-Vinaphone có thể sử dụng thông tin cá nhân của Khách Hàng để ngăn chặn và phát hiện gian lận và lạm dụng nhằm bảo vệ Khách Hàng, VNPT-Vinaphone và các chủ thể liên quan;\n3.9.\tQuản trị nội bộ;\n3.10.\tCác mục đích khác có liên quan đến những mục đích được nêu trên.\nĐiều 4. \tCÁCH THỨC XỬ LÝ DỮ LIỆU CÁ NHÂN\nVNPT-Vinaphone áp dụng một hoặc nhiều hoạt động tác động tới Dữ Liệu Cá Nhân như: thu thập, ghi, phân tích, xác nhận, lưu trữ, chỉnh sửa, công khai, kết hợp, truy cập, truy xuất, thu hồi, mã hóa, giải mã, sao chép, chia sẻ, truyền đưa, cung cấp, chuyển giao, xóa, hủy dữ liệu cá nhân hoặc các hành động khác có liên quan. \nĐiều 5. \tTHỜI GIAN BẮT ĐẦU, THỜI GIAN KẾT THÚC XỬ LÝ DỮ LIỆU \n5.1.\tThời gian bắt đầu xử lý dữ liệu\nKể từ thời điểm Khách Hàng chấp thuận với Chính sách này. \n5.2.\tThời gian kết thúc xử lý dữ liệu \nTrừ trường hợp pháp luật Việt Nam có quy định khác hoặc Khách Hàng có yêu cầu chấm dứt việc xử lý Dữ Liệu Cá Nhân của Khách Hàng, VNPT-Vinaphone chấm dứt việc xử lý Dữ Liệu Cá Nhân khi đã hoàn thành Mục Đích quy định tại Chính Sách này. \nĐiều 6. \tCHIA SẺ DỮ LIỆU CÁ NHÂN \n6.1.\tĐể thực hiện các Mục Đích quy định tại Chính Sách này, VNPT-Vinaphone có thể chia sẻ Dữ Liệu Cá Nhân của Khách Hàng với:\n6.1.1.\tCác công ty con, đơn vị trực thuộc của VNPT-Vinaphone, công ty mẹ là Tập đoàn Bưu Chính Viễn thông Việt Nam, các đơn vị trực thuộc, liên kết của Tập đoàn Bưu Chính Viễn thông Việt Nam: Một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone do Tập đoàn Bưu chính Viễn thông Việt Nam, các đơn vị trực thuộc, liên kết của Tập đoàn hợp tác với VNPT-Vinaphone cung cấp, do đó, việc chia sẻ Dữ Liệu Cá Nhân với các chủ thể này là cần thiết và chỉ nhằm mục đích cung cấp dịch vụ cho Khách Hàng;\n6.1.2.\tBên thứ ba cung cấp dịch vụ: VNPT-Vinaphone sử dụng và/hoặc hợp tác với các công ty và cá nhân khác để thực hiện một số công việc và chương trình như chương trình khuyến mại dành cho Khách Hàng, nghiên cứu thị trường, phân tích và phát triển sản phẩm, tư vấn chiến lược, cung cấp dịch vụ thu cước. Các Bên thứ ba cung cấp dịch vụ này có quyền truy cập, thu thập, sử dụng và xử lý Dữ Liệu Cá Nhân cần thiết để thực hiện các chức năng của họ, bao gồm nhưng không giới hạn hoạt động quảng cáo, giới thiệu, cung cấp các sản phẩm/dịch vụ khác thuộc hệ sinh thái của Tập đoàn Bưu chính Viễn thông Việt Nam hoặc của các đối tác hợp tác với Tập đoàn Bưu chính Viễn thông Việt Nam hoặc hợp tác với các đơn vị trực thuộc, liên kết của Tập đoàn Bưu chính Viễn thông Việt Nam. Các bên thứ ba cung cấp dịch vụ này phải tuân thủ pháp luật về bảo vệ Dữ Liệu Cá Nhân với tư cách là Bên Xử lý Dữ Liệu;\n6.1.3.\tTái cấu trúc doanh nghiệp: Trong quá trình phát triển kinh doanh, VNPT-Vinaphone có thể bán hoặc mua các doanh nghiệp hoặc tái cấu trúc doanh nghiệp phù hợp với quy định của pháp luật và nhu cầu sản xuất kinh doanh. Trong các giao dịch như vậy, Dữ Liệu Cá Nhân là một trong những tài sản kinh doanh được chuyển nhượng nhưng bên nhận chuyển nhượng vẫn phải tuân theo các quy định của Chính Sách này;\n6.1.4.\tBảo vệ quyền và lợi ích hợp pháp của VNPT-Vinaphone và các chủ thể khác: VNPT-Vinaphone được phép tiết lộ Dữ Liệu Cá Nhân khi VNPT-Vinaphone có căn cứ cho rằng việc tiết lộ này được pháp luật yêu cầu, theo yêu cầu của cơ quan quản lý nhà nước, để thực thi hoặc áp dụng các điều khoản và thỏa thuận khác của VNPT-Vinaphone hoặc để bảo vệ quyền, tài sản hoặc an ninh của VNPT-Vinaphone, khách hàng của VNPT-Vinaphone, hoặc bất kỳ chủ thể nào khác. Các công việc nêu trên có thể bao gồm việc trao đổi thông tin với các công ty và tổ chức khác để ngăn chặn và phát hiện gian lận và giảm rủi ro tài sản và tín dụng, hoặc tiết lộ một số loại thông tin nhất định trong trường hợp VNPT-Vinaphone nhận được yêu cầu ràng buộc về mặt pháp lý từ các cơ quan nhà nước có thẩm quyền;\n6.1.5.\tTùy theo sự lựa chọn của Khách Hàng: Ngoài các trường hợp nêu trên, Dữ Liệu Cá Nhân có thể được chia sẻ với bên thứ ba nhằm mục đích theo quy định tại Điều 3.5 Chính Sách này và Khách Hàng sẽ có quyền không chấp thuận việc chia sẻ thông tin theo quy định tại Điều 8.4 Chính Sách này. \n6.2.\tVNPT-Vinaphone không thực hiện chia sẻ Dữ Liệu Cá Nhân vì mục đích lợi nhuận. \nĐiều 7. \tLƯU TRỮ DỮ LIỆU CÁ NHÂN \n7.1.\tDữ Liệu Cá Nhân của Khách Hàng do VNPT-Vinaphone lưu trữ sẽ được bảo mật. VNPT-Vinaphone, trong khả năng của mình, sẽ nỗ lực thực hiện các biện pháp hợp lý để bảo vệ Dữ Liệu Cá Nhân của Khách Hàng.\n7.2.\tĐịa điểm lưu trữ Dữ Liệu Cá nhân\nTrong phạm vi pháp luật cho phép, VNPT-Vinaphone có thể lưu trữ Dữ Liệu Cá Nhân của Khách Hàng tại Việt Nam và ở nước ngoài, kể cả trên giải pháp lưu trữ điện toán đám mây. VNPT-Vinaphone áp dụng các tiêu chuẩn về bảo mật dữ liệu phù hợp với quy định pháp luật hiện hành.\n7.3.\tThời gian lưu trữ Dữ Liệu Cá Nhân\nVNPT-Vinaphone chỉ thực hiện lưu trữ Dữ Liệu Cá Nhân của Khách Hàng trong khoảng thời gian cần thiết và hợp lý để hoàn thành các Mục Đích. Trường hợp pháp luật hiện hành có quy định về thời hạn lưu trữ Dữ Liệu Cá Nhân kể cả sau khi đã hoàn thành Mục Đích nêu trong Chính Sách này, VNPT-Vinaphone có nghĩa vụ tuân thủ quy định của pháp luật. \nĐiều 8. \tKIỂM SOÁT DỮ LIỆU CÁ NHÂN \n8.1.\tQuyền được biết và Quyền đồng ý\nBằng Chính Sách này, VNPT-Vinaphone thông báo cho Khách Hàng được biết về hoạt động xử lý Dữ Liệu Cá Nhân của Khách Hàng trước khi thực hiện xử lý Dữ Liệu Cá Nhân. Đồng thời, Khách Hàng có quyền đồng ý hoặc không đồng ý với các điều khoản và điều kiện của Chính Sách này bằng cách tích hoặc không tích vào ô “Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone”.\n8.2.\tQuyền truy cập và yêu cầu cung cấp Dữ Liệu Cá Nhân \nKhách Hàng có quyền truy cập vào các ứng dụng/website của VNPT-Vinaphone và/hoặc liên hệ trực tiếp với VNPT-Vinaphone để kiểm tra, trích xuất các Dữ Liệu Cá Nhân mà Khách Hàng đã cung cấp cho VNPT-Vinaphone phục vụ các Mục Đích quy định tại Chính Sách này. Trường hợp Khách Hàng không thể tự truy cập, trích xuất hoặc gặp khó khăn trong việc truy cập, trích xuất các Dữ Liệu Cá Nhân, Khách Hàng có thể liên hệ với VNPT-Vinaphone để được hỗ trợ.\n8.3.\tQuyền chỉnh sửa\nKhách Hàng có quyền chỉnh sửa các Dữ Liệu Cá Nhân của mình với điều kiện và việc chỉnh sửa này không vi phạm các quy định của pháp luật. Trường hợp Khách Hàng không thể tự chỉnh sửa hoặc gặp khó khăn trong việc chỉnh sửa các Dữ Liệu Cá Nhân, Khách Hàng có thể liên hệ với VNPT-Vinaphone để được hỗ trợ.\n8.4.\tQuyền phản đối, hạn chế, rút lại sự đồng ý xử lý dữ liệu\nTrường hợp Khách Hàng không muốn nhận nội dung tiếp thị quảng cáo, khuyến mại từ VNPT-Vinaphone và muốn rút lại sự chấp thuận trước đó (nếu có) và/hoặc phản đối việc tiếp tục sử dụng thông tin cá nhân của mình cho mục đích trên, vui lòng đánh dấu vào ô “Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone” tại thời điểm VNPT-Vinaphone thu thập dữ liệu cá nhân, hoặc gửi từ chối dịch vụ quảng cáo theo cú pháp được hướng dẫn (hoặc cách thức khác theo quy định tại hợp đồng liên quan với Khách Hàng) hoặc liên hệ với VNPT-Vinaphone theo các thông tin được cung cấp tại Chính Sách này. Nếu Khách Hàng không muốn nhận thông báo từ ứng dụng của VNPT-Vinaphone, vui lòng điều chỉnh cài đặt thông báo trong ứng dụng hoặc thiết bị của mình. \n8.5.\tQuyền xóa Dữ Liệu Cá Nhân \nKhách Hàng có quyền yêu cầu VNPT-Vinaphone thực hiện xóa Dữ Liệu Cá Nhân của Khách Hàng với điều kiện là yêu cầu của Khách Hàng phải phù hợp với quy định của pháp luật về cung cấp các sản phẩm, dịch vụ viễn thông và công nghệ thông tin. Tuy nhiên, việc yêu cầu xóa Dữ Liệu Cá Nhân có thể dẫn tới việc VNPT-Vinaphone không thể cung cấp được một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng, điều này đồng nghĩa với việc VNPT-Vinaphone có thể đơn phương chấm dứt hợp đồng mà không cần phải bồi thường cho Khách Hàng do các điều kiện để thực hiện hợp đồng đã thay đổi. Do đó, VNPT-Vinaphone khuyến nghị Khách Hàng cân nhắc kĩ lưỡng trước khi yêu cầu VNPT-Vinaphone thực hiện xóa Dữ Liệu Cá Nhân. \n8.6.\tQuyền khiếu nại \nKhách Hàng có quyền khiếu nại trực tiếp với VNPT-Vinaphone hoặc với cơ quan nhà nước có thẩm quyền trong trường hợp Khách Hàng cho rằng VNPT-Vinaphone vi phạm các quy định của pháp luật liên quan tới bảo vệ Dữ Liệu Cá Nhân. \nĐiều 9. \tBẢO VỆ DỮ LIỆU CÁ NHÂN \n9.1.\tNghĩa vụ của VNPT-Vinaphone\nVNPT-Vinaphone nỗ lực đảm bảo Dữ Liệu Cá Nhân của Khách Hàng được bảo vệ khỏi các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân. VNPT-Vinaphone duy trì cam kết bảo mật Dữ Liệu Cá Nhân này bằng cách áp dụng những biện pháp vật lý, điện tử và quản lý để bảo vệ Dữ Liệu Cá Nhân, bao gồm: \n•\tCác máy chủ trang thông tin điện tử chính thức của VNPT-Vinaphone được bảo vệ bởi “bức tường lửa” và hệ thống của VNPT-Vinaphone luôn được kiểm tra để phòng tránh các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân;\n•\tVNPT-Vinaphone sẽ thực hiện tất cả các bước hợp lý để đảm bảo rằng Dữ Liệu Cá Nhân của Khách Hàng, Dữ Liệu Cá Nhân do Đối Tác Kiểm Soát Dữ Liệu Cá Nhân cung cấp không bị lưu giữ lâu hơn mức cần thiết và rằng VNPT-Vinaphone sẽ luôn tuân thủ những yêu cầu của pháp luật liên quan đến việc lưu trữ Dữ Liệu Cá Nhân. \n9.2.\tNghĩa vụ của Khách Hàng \nKhách Hàng có trách nhiệm bảo vệ Dữ Liệu Cá Nhân của mình như sau: \n•\tChủ động thực hiện các biện pháp giúp ngăn chặn việc truy cập trái phép vào mật khẩu, quản lý và sử dụng tài khoản, thiết bị di động của mình (bao gồm nhưng không giới hạn bởi điện thoại thông minh, máy tính, máy tính bảng, laptop) bằng cách đăng xuất tài khoản sau khi sử dụng, đặt một mật khẩu mạnh và khó đoán và giữ bí mật thông tin đăng nhập cũng như mật khẩu của mình. VNPT-Vinaphone được loại trừ trách nhiệm với Khách Hàng trong trường hợp Khách hàng bị lộ/mất, bị đánh cắp hoặc xâm phạm mật khẩu, hoặc bất kỳ hoạt động nào trên tài khoản của Khách Hàng sử dụng mật khẩu trái phép hoặc mất/thất lạc thiết bị di động dẫn đến người không có thẩm quyền tự ý sử dụng dịch vụ hoặc hệ thống bị xâm phạm bất hợp pháp bởi bên thứ ba mặc dù VNPT-Vinaphone đã thực hiện đầy đủ các biện pháp để bảo vệ hệ thống;\n•\tKhách hàng có trách nhiệm cập nhập các văn bản điều chỉnh Chính Sách này (nếu có) trên các kênh thông tin chính thống của VNPT-Vinaphone;\n•\tKhi đã chấp thuận toàn bộ điều khoản và điều kiện của của Chính Sách này, Khách Hàng có trách nhiệm cung cấp Dữ Liệu Cá Nhân chính xác, đầy đủ theo yêu cầu của VNPT-Vinaphone và thực hiện các trách nhiệm thông báo cho VNPT-Vinaphone ngay khi phát hiện có hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá nhân. Khách Hàng có thể chủ động cung cấp Dữ Liệu Cá Nhân nằm ngoài yêu cầu của VNPT-Vinaphone với điều kiện Khách Hàng phải tuân thủ quy định tại Điều 2.4 Chính Sách này;\n•\tKhách Hàng có trách nhiệm tôn trọng Dữ Liệu Cá Nhân của chủ thể khác và thực hiện quy định của pháp luật về bảo vệ Dữ Liệu Cá Nhân, tham gia phòng, chống các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân.\nĐiều 10. \tHẬU QUẢ, THIỆT HẠI KHÔNG MONG MUỐN CÓ KHẢ NĂNG XẢY RA\n10.1.\tVNPT-Vinaphone sử dụng nhiều công nghệ bảo mật thông tin khác nhau nhằm bảo vệ Dữ Liệu Cá Nhân của Khách Hàng không bị truy lục, sử dụng hoặc chia sẻ ngoài ý muốn. Tuy nhiên, không một dữ liệu nào có thể được bảo mật 100%. Do vậy, VNPT-Vinaphone cam kết sẽ bảo mật một cách tối đa Dữ Liệu Cá Nhân của Khách Hàng. Một số hậu quả, thiệt hại không mong muốn có thể xảy ra bao gồm nhưng không giới hạn: \n•\tLỗi phần cứng, phần mềm trong quá trình xử lý Dữ Liệu Cá Nhân làm mất Dữ Liệu Cá Nhân của Khách Hàng; \n•\tLỗ hổng bảo mật nằm ngoài khả năng kiểm soát của VNPT-Vinaphone, hệ thống bị hacker tấn công gây lộ lọt Dữ Liệu Cá Nhân của Khách Hàng; \n•\tKhách Hàng tự làm lộ lọt Dữ Liệu Cá Nhân của Khách Hàng do: bất cẩn hoặc bị lừa đảo; truy cập các website/tải các ứng dụng có chứa phần mềm độc hại.\n10.2.\tVNPT-Vinaphone khuyến cáo Khách Hàng thực hiện nghiêm ngặt các trách nhiệm bảo vệ Dữ Liệu Cá Nhân theo quy định tại Điều 9.2 Chính Sách này và theo quy định của pháp luật. \n10.3.\tTrong trường hợp máy chủ lưu trữ dữ liệu bị hacker tấn công dẫn đến mất mát Dữ Liệu Cá Nhân của Khách Hàng, VNPT-Vinaphone sẽ có trách nhiệm thông báo vụ việc cho cơ quan chức năng điều tra xử lý kịp thời và thông báo cho Khách Hàng được biết. \nĐiều 11. \tSỬ DỤNG COOKIES \n11.1.\tCookies có thể được sử dụng trên website của VNPT-Vinaphone. “Cookies” là các tệp văn bản nhỏ được lưu trên ổ cứng máy tính của Khách Hàng nhằm giúp tùy biến trải nghiệm website cho người dùng. VNPT-Vinaphone có chính sách sử dụng cookies nhằm khiến việc điều hướng trang web dễ dàng hơn và tạo điều kiện thuận lợi cho quá trình đăng nhập. Dữ liệu thống kê trang web được xử lý bởi các bên thứ ba, và do đó, địa chỉ IP của Khách Hàng sẽ được chuyển tới bên thứ ba chỉ với mục đích báo cáo thống kê.\n11.2.\tKhi VNPT-Vinaphone thu thập thông tin qua trang web của VNPT-Vinaphone, VNPT-Vinaphone tự động thu thập những thông tin không mang tính cá nhân liên quan tới việc sử dụng trang web nhưng không xác định danh tính người dùng bao gồm nhưng kh¬ông giới hạn như: địa chỉ IP của máy tính cá nhân, địa chỉ IP của nhà cung cấp dịch vụ Internet, ngày giờ truy cập trang web, hệ điều hành, các mục đã truy cập trên trang web, nội dung tải về từ trang web và địa chỉ trang web đã trực tiếp dẫn quý khách tới trang web của VNPT-Vinaphone. VNPT-Vinaphone có thể dùng những thông tin không mang tính cá nhân này để phục vụ cho những báo cáo thống kê về lưu lượng người truy cập trang web và hành vi sử dụng trang web. Các thông tin phân tích này đều không có khả năng xác định danh tính của Khách Hàng.\n11.3.\tTrường hợp Khách hàng không muốn sử dụng cookies, đa số các trình duyệt web đều cho phép người dùng từ chối cookies bằng cách thay đổi cài đặt riêng tư trên trình duyệt. Việc từ chối cookies hầu như không gây ảnh hưởng tới việc điều hướng trang web. Tuy nhiên một số chức năng của trang web có thể bị ảnh hưởng. Sau khi hoàn thành việc truy cập trang web, Khách Hàng vẫn có thể xóa cookies khỏi hệ thống nếu muốn.\nĐiều 12. \tQUẢNG CÁO TRÊN INTERNET VÀ BÊN THỨ BA\nCác ứng dụng/website của VNPT-Vinaphone có thể bao gồm quảng cáo của bên thứ ba và liên kết tới các trang website và ứng dụng khác. Các đối tác quảng cáo bên thứ ba có thể thu thập thông tin về Khách Hàng khi Khách Hàng tương tác với nội dung, quảng cáo hoặc dịch vụ của họ. Mọi quyền truy cập và sử dụng các liên kết hoặc trang website của bên thứ ba không bị điều chỉnh bởi Chính Sách này, mà thay vào đó được điều chỉnh bởi chính sách quyền riêng tư của các bên thứ ba đó. VNPT-Vinaphone không chịu trách nhiệm về các quy định về thông tin của các bên thứ ba. \nĐiều 13. \tXỬ LÝ DỮ LIỆU CÁ NHÂN KHÔNG CẦN SỰ ĐỒNG Ý CỦA CHỦ THỂ DỮ LIỆU\nVNPT-Vinaphone có thể tiến hành xử lý Dữ Liệu Cá Nhân mà không cần sự đồng ý của Chủ Thể Dữ Liệu trong các trường hợp sau: \n13.1.\tTrong trường hợp khẩn cấp, cần xử lý ngay Dữ Liệu Cá Nhân có liên quan để bảo vệ tính mạng, sức khỏe của chủ thể dữ liệu hoặc người khác;\n13.2.\tViệc công khai dữ liệu cá nhân theo quy định của luật;\n13.3.\tViệc xử lý dữ liệu của cơ quan nhà nước có thẩm quyền trong trường hợp tình trạng khẩn cấp về quốc phòng, an ninh quốc gia, trật tự an toàn xã hội, thảm họa lớn, dịch bệnh nguy hiểm; khi có nguy cơ đe dọa an ninh, quốc phòng nhưng chưa đến mức ban bố tình trạng khẩn cấp; phòng, chống bạo loạn, khủng bố, phòng, chống tội phạm và vi phạm pháp luật theo quy định của luật;\n13.4.\tĐể thực hiện nghĩa vụ theo hợp đồng của chủ thể dữ liệu với cơ quan, tổ chức, cá nhân có liên quan theo quy định của luật;\n13.5.\tPhục vụ hoạt động của cơ quan nhà nước đã được quy định theo luật chuyên ngành.\nĐiều 14. \tTHÔNG TIN LIÊN LẠC\nTrường hợp Khách Hàng có bất kỳ câu hỏi nào về Chính Sách này hoặc muốn thực hiện các quyền của Khách Hàng liên quan tới Dữ Liệu Cá Nhân, vui lòng liên hệ với VNPT-Vinaphone theo các phương thức và thông tin dưới đây: \n•\tLiên hệ tới tổng đài theo thông tin tại các website/ứng dụng chính thức của VNPT-Vinaphone tại từng thời điểm. \n•\tGửi công văn tới trụ sở chính của VNPT-Vinaphone tại Toà nhà Vinaphone, đường Xuân Tảo, Phường Xuân La, Quận Tây Hồ, Hà Nội.\n•\tLiên hệ trực tiếp tại các điểm giao dịch của VNPT-Vinaphone trên phạm vi toàn quốc. \n•\tCác cách thức liên hệ khác như Livechat, liên hệ qua fanpage chính thức của VNPT-Vinaphone, email chăm sóc khách hàng được cung cấp cho khách hàng tại mọi thời điểm. \nĐiều 15. \tĐIỀU CHỈNH VÀ SỬA ĐỔI\nVNPT-Vinaphone có thể điều chỉnh Chính Sách này vào bất kỳ thời điểm nào đồng thời đăng tải công khai Chính Sách được điều chỉnh trên các kênh thông tin chính thống của VNPT-Vinaphone. Việc Khách Hàng tiếp tục sử dụng Sản Phẩm, Dịch vụ Của VNPT-Vinaphone và không có bất kì khiếu nại nào đối với Chính Sách được điều chỉnh được hiểu rằng Khách Hàng đã chấp thuận Chính Sách được điều chỉnh đó của VNPT-Vinaphone.\n',
      name: 'fullPolicyProtection',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết`
  String get detail {
    return Intl.message(
      'Chi tiết',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Tạo giao dịch ký`
  String get createTransaction {
    return Intl.message(
      'Tạo giao dịch ký',
      name: 'createTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách tài liệu {anything}`
  String documentList(Object anything) {
    return Intl.message(
      'Danh sách tài liệu $anything',
      name: 'documentList',
      desc: '',
      args: [anything],
    );
  }

  /// `Thêm tài liệu`
  String get addDocument {
    return Intl.message(
      'Thêm tài liệu',
      name: 'addDocument',
      desc: '',
      args: [],
    );
  }

  /// `Không lấy được thông tin chứng thư số`
  String get certificate_get_list_error {
    return Intl.message(
      'Không lấy được thông tin chứng thư số',
      name: 'certificate_get_list_error',
      desc: '',
      args: [],
    );
  }

  /// `Số giấy tờ`
  String get idNumber {
    return Intl.message(
      'Số giấy tờ',
      name: 'idNumber',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết chứng thư số`
  String get certDetail {
    return Intl.message(
      'Chi tiết chứng thư số',
      name: 'certDetail',
      desc: '',
      args: [],
    );
  }

  /// `Đang khởi tạo cặp khoá`
  String get initializingKeyPair {
    return Intl.message(
      'Đang khởi tạo cặp khoá',
      name: 'initializingKeyPair',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang khởi tạo cặp khóa.\nVui lòng đợi trong giây lát...`
  String get initializingKeyPairDescription {
    return Intl.message(
      'Hệ thống đang khởi tạo cặp khóa.\nVui lòng đợi trong giây lát...',
      name: 'initializingKeyPairDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ của quý khách sẽ được  duyệt trong vòng 30 phút (trong giờ hành chính).  Kết quả sẽ được thông báo qua ứng dụng VNPT SmartCA!`
  String get waitingCapCTS {
    return Intl.message(
      'Hồ sơ của quý khách sẽ được  duyệt trong vòng 30 phút (trong giờ hành chính).  Kết quả sẽ được thông báo qua ứng dụng VNPT SmartCA!',
      name: 'waitingCapCTS',
      desc: '',
      args: [],
    );
  }

  /// `Thiết bị không hỗ trợ sinh trắc học`
  String get notSupportBiometrics {
    return Intl.message(
      'Thiết bị không hỗ trợ sinh trắc học',
      name: 'notSupportBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Có {number} chứng thư số đang chờ kích hoạt!`
  String numberWaitingActiveCer(Object number) {
    return Intl.message(
      'Có $number chứng thư số đang chờ kích hoạt!',
      name: 'numberWaitingActiveCer',
      desc: '',
      args: [number],
    );
  }

  /// `Yêu cầu chấp nhận các điều khoản chính sách bảo vệ dữ liệu cá nhân`
  String get requestAcceptTerms {
    return Intl.message(
      'Yêu cầu chấp nhận các điều khoản chính sách bảo vệ dữ liệu cá nhân',
      name: 'requestAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `10 hoặc 13`
  String get validate10or13 {
    return Intl.message(
      '10 hoặc 13',
      name: 'validate10or13',
      desc: '',
      args: [],
    );
  }

  /// `Chờ duyệt yêu cầu đăng ký\nchứng thư số!`
  String get waitingForAcceptCertTitle {
    return Intl.message(
      'Chờ duyệt yêu cầu đăng ký\nchứng thư số!',
      name: 'waitingForAcceptCertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ của quý khách sẽ được duyệt trong\nvòng 30 phút (trong giờ hành chính).\nKết quả sẽ được thông báo qua email!`
  String get waitingForAcceptCertDescription {
    return Intl.message(
      'Hồ sơ của quý khách sẽ được duyệt trong\nvòng 30 phút (trong giờ hành chính).\nKết quả sẽ được thông báo qua email!',
      name: 'waitingForAcceptCertDescription',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa có chứng thư số`
  String get youDontHaveCert {
    return Intl.message(
      'Bạn chưa có chứng thư số',
      name: 'youDontHaveCert',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn đăng ký chứng thư số để sử dụng dịch vụ ký số từ xa VNPT SmartCA`
  String get pleaseChooseRegisterCert {
    return Intl.message(
      'Vui lòng chọn đăng ký chứng thư số để sử dụng dịch vụ ký số từ xa VNPT SmartCA',
      name: 'pleaseChooseRegisterCert',
      desc: '',
      args: [],
    );
  }

  /// `Chờ người dùng kích hoạt`
  String get waitingUserActive {
    return Intl.message(
      'Chờ người dùng kích hoạt',
      name: 'waitingUserActive',
      desc: '',
      args: [],
    );
  }

  /// `Ký BBNT lỗi, chữ ký không hợp lệ`
  String get signErrorInvalid {
    return Intl.message(
      'Ký BBNT lỗi, chữ ký không hợp lệ',
      name: 'signErrorInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Chờ đồng bộ biên bản nghiệm thu`
  String get waitingSyncBBNT {
    return Intl.message(
      'Chờ đồng bộ biên bản nghiệm thu',
      name: 'waitingSyncBBNT',
      desc: '',
      args: [],
    );
  }

  /// `Đồng bộ biên bản nghiệm thu không thành công`
  String get syncBBNTFailure {
    return Intl.message(
      'Đồng bộ biên bản nghiệm thu không thành công',
      name: 'syncBBNTFailure',
      desc: '',
      args: [],
    );
  }

  /// `Chờ duyệt`
  String get waitingApprove {
    return Intl.message(
      'Chờ duyệt',
      name: 'waitingApprove',
      desc: '',
      args: [],
    );
  }

  /// `giao dịch`
  String get giao_dich {
    return Intl.message(
      'giao dịch',
      name: 'giao_dich',
      desc: '',
      args: [],
    );
  }

  /// `Ký tất cả`
  String get ky_tat_ca {
    return Intl.message(
      'Ký tất cả',
      name: 'ky_tat_ca',
      desc: '',
      args: [],
    );
  }

  /// `Hủy tất cả`
  String get huy_tat_ca {
    return Intl.message(
      'Hủy tất cả',
      name: 'huy_tat_ca',
      desc: '',
      args: [],
    );
  }

  /// `Chọn tài liệu`
  String get chon_tai_lieu {
    return Intl.message(
      'Chọn tài liệu',
      name: 'chon_tai_lieu',
      desc: '',
      args: [],
    );
  }

  /// `Chọn tệp`
  String get chon_tep {
    return Intl.message(
      'Chọn tệp',
      name: 'chon_tep',
      desc: '',
      args: [],
    );
  }

  /// `Chụp ảnh`
  String get chup_anh {
    return Intl.message(
      'Chụp ảnh',
      name: 'chup_anh',
      desc: '',
      args: [],
    );
  }

  /// `Ký nâng cao`
  String get ky_nang_cao {
    return Intl.message(
      'Ký nâng cao',
      name: 'ky_nang_cao',
      desc: '',
      args: [],
    );
  }

  /// `Chạm vị trí bất kỳ để chọn chữ ký`
  String get chon_chu_ky {
    return Intl.message(
      'Chạm vị trí bất kỳ để chọn chữ ký',
      name: 'chon_chu_ky',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách chữ ký`
  String get danh_sach_chu_ky {
    return Intl.message(
      'Danh sách chữ ký',
      name: 'danh_sach_chu_ky',
      desc: '',
      args: [],
    );
  }

  /// `Thêm mẫu chữ ký`
  String get them_mau_chu_ky {
    return Intl.message(
      'Thêm mẫu chữ ký',
      name: 'them_mau_chu_ky',
      desc: '',
      args: [],
    );
  }

  /// `Thêm chữ ký`
  String get them_chu_ky {
    return Intl.message(
      'Thêm chữ ký',
      name: 'them_chu_ky',
      desc: '',
      args: [],
    );
  }

  /// `Tên chứng thư`
  String get ten_chung_thu {
    return Intl.message(
      'Tên chứng thư',
      name: 'ten_chung_thu',
      desc: '',
      args: [],
    );
  }

  /// `Vẽ`
  String get but_ve {
    return Intl.message(
      'Vẽ',
      name: 'but_ve',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên`
  String get nhap_ten {
    return Intl.message(
      'Nhập tên',
      name: 'nhap_ten',
      desc: '',
      args: [],
    );
  }

  /// `Tải lên`
  String get tai_anh_chu_ky {
    return Intl.message(
      'Tải lên',
      name: 'tai_anh_chu_ky',
      desc: '',
      args: [],
    );
  }

  /// `Tải lên hình nền`
  String get tai_hinh_nen {
    return Intl.message(
      'Tải lên hình nền',
      name: 'tai_hinh_nen',
      desc: '',
      args: [],
    );
  }

  /// `Ký bởi`
  String get ky_boi {
    return Intl.message(
      'Ký bởi',
      name: 'ky_boi',
      desc: '',
      args: [],
    );
  }

  /// `Ngày ký`
  String get ngay_ky {
    return Intl.message(
      'Ngày ký',
      name: 'ngay_ky',
      desc: '',
      args: [],
    );
  }

  /// `Tổ chức xác thực`
  String get to_chu_xac_thuc {
    return Intl.message(
      'Tổ chức xác thực',
      name: 'to_chu_xac_thuc',
      desc: '',
      args: [],
    );
  }

  /// `Định dạng file được hỗ trợ`
  String get dinh_danh_file_ho_tro {
    return Intl.message(
      'Định dạng file được hỗ trợ',
      name: 'dinh_danh_file_ho_tro',
      desc: '',
      args: [],
    );
  }

  /// `Dung lượng file tối đa là 15MB`
  String get dung_luong_vuot_qua_15mb {
    return Intl.message(
      'Dung lượng file tối đa là 15MB',
      name: 'dung_luong_vuot_qua_15mb',
      desc: '',
      args: [],
    );
  }

  /// `Tùy chọn vị trí chữ ký`
  String get tuy_chon_vi_tri_ky {
    return Intl.message(
      'Tùy chọn vị trí chữ ký',
      name: 'tuy_chon_vi_tri_ky',
      desc: '',
      args: [],
    );
  }

  /// `Chữ ký bên phải, logo và chữ bên trái`
  String get chu_ky_ben_phai_logo_chu_ben_trai {
    return Intl.message(
      'Chữ ký bên phải, logo và chữ bên trái',
      name: 'chu_ky_ben_phai_logo_chu_ben_trai',
      desc: '',
      args: [],
    );
  }

  /// `Chữ ký bên trái, logo và chữ bên phải`
  String get chu_ky_ben_trai_logo_chu_ben_phai {
    return Intl.message(
      'Chữ ký bên trái, logo và chữ bên phải',
      name: 'chu_ky_ben_trai_logo_chu_ben_phai',
      desc: '',
      args: [],
    );
  }

  /// `Chữ ký ở giữa`
  String get chu_ky_giua {
    return Intl.message(
      'Chữ ký ở giữa',
      name: 'chu_ky_giua',
      desc: '',
      args: [],
    );
  }

  /// `Căn lề`
  String get can_le {
    return Intl.message(
      'Căn lề',
      name: 'can_le',
      desc: '',
      args: [],
    );
  }

  /// `Căn trái`
  String get can_trai {
    return Intl.message(
      'Căn trái',
      name: 'can_trai',
      desc: '',
      args: [],
    );
  }

  /// `Căn giữa`
  String get can_giua {
    return Intl.message(
      'Căn giữa',
      name: 'can_giua',
      desc: '',
      args: [],
    );
  }

  /// `Căn phải`
  String get can_phai {
    return Intl.message(
      'Căn phải',
      name: 'can_phai',
      desc: '',
      args: [],
    );
  }

  /// `Kiểu hiển thị`
  String get kieu_hien_thi {
    return Intl.message(
      'Kiểu hiển thị',
      name: 'kieu_hien_thi',
      desc: '',
      args: [],
    );
  }

  /// `Nhập nội dung`
  String get nha_noi_dung_chu_ky {
    return Intl.message(
      'Nhập nội dung',
      name: 'nha_noi_dung_chu_ky',
      desc: '',
      args: [],
    );
  }

  /// `Tải mẫu đính kèm`
  String get tai_mau_dinh_kem {
    return Intl.message(
      'Tải mẫu đính kèm',
      name: 'tai_mau_dinh_kem',
      desc: '',
      args: [],
    );
  }

  /// `1. Chỉ hiển thị text`
  String get chi_hien_thi_text {
    return Intl.message(
      '1. Chỉ hiển thị text',
      name: 'chi_hien_thi_text',
      desc: '',
      args: [],
    );
  }

  /// `2. Hiển thị text và logo bên trái`
  String get hien_thi_text_logo_ben_trai {
    return Intl.message(
      '2. Hiển thị text và logo bên trái',
      name: 'hien_thi_text_logo_ben_trai',
      desc: '',
      args: [],
    );
  }

  /// `3. Chỉ hiển thị logo`
  String get chi_hien_thi_logo {
    return Intl.message(
      '3. Chỉ hiển thị logo',
      name: 'chi_hien_thi_logo',
      desc: '',
      args: [],
    );
  }

  /// `4. Hiển thị text và logo phía trên`
  String get hien_thi_text_logo_tren {
    return Intl.message(
      '4. Hiển thị text và logo phía trên',
      name: 'hien_thi_text_logo_tren',
      desc: '',
      args: [],
    );
  }

  /// `5. Hiển thị text và hình nền`
  String get hien_thi_text_hinh_nen {
    return Intl.message(
      '5. Hiển thị text và hình nền',
      name: 'hien_thi_text_hinh_nen',
      desc: '',
      args: [],
    );
  }

  /// `6. Hiển thị text, logo bên trái và chữ ký`
  String get hien_thi_text_logo_ben_trai_chu {
    return Intl.message(
      '6. Hiển thị text, logo bên trái và chữ ký',
      name: 'hien_thi_text_logo_ben_trai_chu',
      desc: '',
      args: [],
    );
  }

  /// `Vẽ chữ ký tại đây`
  String get ve_chu_ky_tai_day {
    return Intl.message(
      'Vẽ chữ ký tại đây',
      name: 've_chu_ky_tai_day',
      desc: '',
      args: [],
    );
  }

  /// `Thực hiện mới`
  String get newImplement {
    return Intl.message(
      'Thực hiện mới',
      name: 'newImplement',
      desc: '',
      args: [],
    );
  }

  /// `Đã tồn tại yêu cầu thay đổi thiết bị với serial {serial}.  Bạn có muốn tiếp tục?`
  String thereIsDeviceChangeRequest(Object serial) {
    return Intl.message(
      'Đã tồn tại yêu cầu thay đổi thiết bị với serial $serial.  Bạn có muốn tiếp tục?',
      name: 'thereIsDeviceChangeRequest',
      desc: '',
      args: [serial],
    );
  }

  /// `Ký phiếu yêu cầu thay đổi`
  String get signChangeRequest {
    return Intl.message(
      'Ký phiếu yêu cầu thay đổi',
      name: 'signChangeRequest',
      desc: '',
      args: [],
    );
  }

  /// `Ký điện tử`
  String get electronicSignature {
    return Intl.message(
      'Ký điện tử',
      name: 'electronicSignature',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đã đọc và đồng ý với nội dung trên Phiếu đề nghị`
  String get desCheckboxRequestBill {
    return Intl.message(
      'Tôi đã đọc và đồng ý với nội dung trên Phiếu đề nghị',
      name: 'desCheckboxRequestBill',
      desc: '',
      args: [],
    );
  }

  /// `Đang tạo yêu cầu thay đổi thiết bị`
  String get creatingRequest {
    return Intl.message(
      'Đang tạo yêu cầu thay đổi thiết bị',
      name: 'creatingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang xử lý yêu cầu thay đổi thiết bị. \nVui lòng đợi trong giây lát...`
  String get processingRequestChangeDevice {
    return Intl.message(
      'Hệ thống đang xử lý yêu cầu thay đổi thiết bị. \nVui lòng đợi trong giây lát...',
      name: 'processingRequestChangeDevice',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu đồng ý với nội dung trên Phiếu đề nghị`
  String get requestAgreeBill {
    return Intl.message(
      'Yêu cầu đồng ý với nội dung trên Phiếu đề nghị',
      name: 'requestAgreeBill',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập bằng Sinh trắc học`
  String get biometricAuthentication {
    return Intl.message(
      'Đăng nhập bằng Sinh trắc học',
      name: 'biometricAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có muốn dùng sinh trắc học để Đăng nhập?`
  String get biometricAuthDesc {
    return Intl.message(
      'Bạn có muốn dùng sinh trắc học để Đăng nhập?',
      name: 'biometricAuthDesc',
      desc: '',
      args: [],
    );
  }

  /// `Gói tích hợp`
  String get esealType {
    return Intl.message(
      'Gói tích hợp',
      name: 'esealType',
      desc: '',
      args: [],
    );
  }

  /// `Chờ duyệt yêu cầu thay đổi\nthiết bị!`
  String get waitingForAcceptChangeDeviceTitle {
    return Intl.message(
      'Chờ duyệt yêu cầu thay đổi\nthiết bị!',
      name: 'waitingForAcceptChangeDeviceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số {numberCertificate}`
  String transaction_request_group_title(Object numberCertificate) {
    return Intl.message(
      'Chứng thư số $numberCertificate',
      name: 'transaction_request_group_title',
      desc: '',
      args: [numberCertificate],
    );
  }

  /// `Không có thông tin giao dịch ký`
  String get list_document_sign_empty {
    return Intl.message(
      'Không có thông tin giao dịch ký',
      name: 'list_document_sign_empty',
      desc: '',
      args: [],
    );
  }

  /// `Mỗi giao dịch ký số chỉ thực hiện tối đa 10 file`
  String get list_document_sign_limited {
    return Intl.message(
      'Mỗi giao dịch ký số chỉ thực hiện tối đa 10 file',
      name: 'list_document_sign_limited',
      desc: '',
      args: [],
    );
  }

  /// `Ký thành công {transactionCount} giao dịch \n {message}`
  String sign_tranaction_success(Object transactionCount, Object message) {
    return Intl.message(
      'Ký thành công $transactionCount giao dịch \n $message',
      name: 'sign_tranaction_success',
      desc: '',
      args: [transactionCount, message],
    );
  }

  /// `Hủy thành công {transactionCount} giao dịch \n {message}`
  String cancel_tranaction_success(Object transactionCount, Object message) {
    return Intl.message(
      'Hủy thành công $transactionCount giao dịch \n $message',
      name: 'cancel_tranaction_success',
      desc: '',
      args: [transactionCount, message],
    );
  }

  /// `Bạn không thể mua lượt ký.\nLý do: Không tồn tại Chứng thư số theo Lượt ký ở trạng thái Đang hoạt động.`
  String get youCanNotBuySignature {
    return Intl.message(
      'Bạn không thể mua lượt ký.\nLý do: Không tồn tại Chứng thư số theo Lượt ký ở trạng thái Đang hoạt động.',
      name: 'youCanNotBuySignature',
      desc: '',
      args: [],
    );
  }

  /// `Chọn chứng thư số cần gia hạn!`
  String get select_cert_to_extend {
    return Intl.message(
      'Chọn chứng thư số cần gia hạn!',
      name: 'select_cert_to_extend',
      desc: '',
      args: [],
    );
  }

  /// `Hết hạn sau {number} ngày`
  String expire_in_day(Object number) {
    return Intl.message(
      'Hết hạn sau $number ngày',
      name: 'expire_in_day',
      desc: '',
      args: [number],
    );
  }

  /// `Chọn chu kỳ gia hạn`
  String get select_time_to_extend {
    return Intl.message(
      'Chọn chu kỳ gia hạn',
      name: 'select_time_to_extend',
      desc: '',
      args: [],
    );
  }

  /// `Gợi ý gia hạn`
  String get suggested_extension {
    return Intl.message(
      'Gợi ý gia hạn',
      name: 'suggested_extension',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cần biết`
  String get you_need_know {
    return Intl.message(
      'Bạn cần biết',
      name: 'you_need_know',
      desc: '',
      args: [],
    );
  }

  /// `Bạn còn {number} lượt ký chưa sử dụng, nếu gia hạn số lượt ký sẽ hết hiệu lực. Bạn có muốn tiếp tục Gia hạn không?`
  String warning_number_sign(Object number) {
    return Intl.message(
      'Bạn còn $number lượt ký chưa sử dụng, nếu gia hạn số lượt ký sẽ hết hiệu lực. Bạn có muốn tiếp tục Gia hạn không?',
      name: 'warning_number_sign',
      desc: '',
      args: [number],
    );
  }

  /// `Gia hạn ngay`
  String get extend_now {
    return Intl.message(
      'Gia hạn ngay',
      name: 'extend_now',
      desc: '',
      args: [],
    );
  }

  /// `Tài liệu đã được thêm, Bạn có muốn tiếp tục?`
  String get document_exits {
    return Intl.message(
      'Tài liệu đã được thêm, Bạn có muốn tiếp tục?',
      name: 'document_exits',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu hiện tại`
  String get currentPassword {
    return Intl.message(
      'Mật khẩu hiện tại',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu hiện tại`
  String get enterCurrentPassword {
    return Intl.message(
      'Nhập mật khẩu hiện tại',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu mới`
  String get enterNewPassword {
    return Intl.message(
      'Nhập mật khẩu mới',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu mới`
  String get reEnterNewPassword {
    return Intl.message(
      'Nhập lại mật khẩu mới',
      name: 'reEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Tuỳ chọn lượt ký`
  String get signatureOption {
    return Intl.message(
      'Tuỳ chọn lượt ký',
      name: 'signatureOption',
      desc: '',
      args: [],
    );
  }

  /// `lượt`
  String get luot {
    return Intl.message(
      'lượt',
      name: 'luot',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin thuê bao`
  String get subscriber_information {
    return Intl.message(
      'Thông tin thuê bao',
      name: 'subscriber_information',
      desc: '',
      args: [],
    );
  }

  /// `Tên thuê bao`
  String get subscriber_name {
    return Intl.message(
      'Tên thuê bao',
      name: 'subscriber_name',
      desc: '',
      args: [],
    );
  }

  /// `Serial chứng thư số`
  String get certificate_serial {
    return Intl.message(
      'Serial chứng thư số',
      name: 'certificate_serial',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin gói cước`
  String get package_information {
    return Intl.message(
      'Thông tin gói cước',
      name: 'package_information',
      desc: '',
      args: [],
    );
  }

  /// `Chờ duyệt yêu cầu gia hạn\nchứng thư số!`
  String get waitingForAcceptExtendTitle {
    return Intl.message(
      'Chờ duyệt yêu cầu gia hạn\nchứng thư số!',
      name: 'waitingForAcceptExtendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xem chi tiết`
  String get view_detail {
    return Intl.message(
      'Xem chi tiết',
      name: 'view_detail',
      desc: '',
      args: [],
    );
  }

  /// `Tồn tại đơn hàng thay đổi thông tin/đổi thiết bị/gia hạn cho chứng thư số này, Nhấn vào Xem chi tiết để xem thêm thông tin!`
  String get exist_order {
    return Intl.message(
      'Tồn tại đơn hàng thay đổi thông tin/đổi thiết bị/gia hạn cho chứng thư số này, Nhấn vào Xem chi tiết để xem thêm thông tin!',
      name: 'exist_order',
      desc: '',
      args: [],
    );
  }

  /// `Đang tạo Phiếu đề nghị gia hạn dịch vụ`
  String get creating_extend_ticket_label {
    return Intl.message(
      'Đang tạo Phiếu đề nghị gia hạn dịch vụ',
      name: 'creating_extend_ticket_label',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống đang khởi tạo phiếu đề nghị gia hạn, \nvui lòng đợi trong giây lát....`
  String get creating_extend_ticket_description {
    return Intl.message(
      'Hệ thống đang khởi tạo phiếu đề nghị gia hạn, \nvui lòng đợi trong giây lát....',
      name: 'creating_extend_ticket_description',
      desc: '',
      args: [],
    );
  }

  /// `Hủy đơn hàng`
  String get cancel_order {
    return Intl.message(
      'Hủy đơn hàng',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Quý khách đang có 0 lượt ký; Vui lòng mua Lượt ký trên app SmartCA để tiếp tục sử dụng dịch vụ`
  String get remaining_to_sign_equal_zero {
    return Intl.message(
      'Quý khách đang có 0 lượt ký; Vui lòng mua Lượt ký trên app SmartCA để tiếp tục sử dụng dịch vụ',
      name: 'remaining_to_sign_equal_zero',
      desc: '',
      args: [],
    );
  }

  /// `Không thể thực hiện ký số vì chứng thư số đang được sử dụng bởi thiết bị khác`
  String get cant_not_signature_document {
    return Intl.message(
      'Không thể thực hiện ký số vì chứng thư số đang được sử dụng bởi thiết bị khác',
      name: 'cant_not_signature_document',
      desc: '',
      args: [],
    );
  }

  /// `Không có chứng thư được kích hoạt trên thiết bị này. Vui lòng thực hiện Đổi thiết bị`
  String get cant_not_certificate_active_in_device {
    return Intl.message(
      'Không có chứng thư được kích hoạt trên thiết bị này. Vui lòng thực hiện Đổi thiết bị',
      name: 'cant_not_certificate_active_in_device',
      desc: '',
      args: [],
    );
  }

  /// `Bạn không thể gia hạn!`
  String get can_not_extend_cert {
    return Intl.message(
      'Bạn không thể gia hạn!',
      name: 'can_not_extend_cert',
      desc: '',
      args: [],
    );
  }

  /// `Lý do Không tồn tại chứng thư số ở trạng thái Đang hoạt động hoặc Hết hạn.`
  String get can_not_extend_cert_description {
    return Intl.message(
      'Lý do Không tồn tại chứng thư số ở trạng thái Đang hoạt động hoặc Hết hạn.',
      name: 'can_not_extend_cert_description',
      desc: '',
      args: [],
    );
  }

  /// `Ký phiếu đề nghị gia hạn`
  String get sign_ticket_extension_title {
    return Intl.message(
      'Ký phiếu đề nghị gia hạn',
      name: 'sign_ticket_extension_title',
      desc: '',
      args: [],
    );
  }

  /// `Tạo phiếu đề nghị gia hạn không thành công`
  String get create_ticket_extension_error_label {
    return Intl.message(
      'Tạo phiếu đề nghị gia hạn không thành công',
      name: 'create_ticket_extension_error_label',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) \nmiễn phí để được hỗ trợ!`
  String get create_ticket_extension_error_description {
    return Intl.message(
      'Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) \nmiễn phí để được hỗ trợ!',
      name: 'create_ticket_extension_error_description',
      desc: '',
      args: [],
    );
  }

  /// `Mã thiết bị đang đăng nhập`
  String get deviceIdloggedIn {
    return Intl.message(
      'Mã thiết bị đang đăng nhập',
      name: 'deviceIdloggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Hãy bổ sung chữ ký của bạn`
  String get pleaseAddYourSignature {
    return Intl.message(
      'Hãy bổ sung chữ ký của bạn',
      name: 'pleaseAddYourSignature',
      desc: '',
      args: [],
    );
  }

  /// `Số lượt ký chưa sử dụng`
  String get numberOfUnusedTurns {
    return Intl.message(
      'Số lượt ký chưa sử dụng',
      name: 'numberOfUnusedTurns',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ trên giấy tờ`
  String get addressOnDocuments {
    return Intl.message(
      'Địa chỉ trên giấy tờ',
      name: 'addressOnDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý: Số giấy tờ này sử dụng làm Tên đăng nhập!`
  String get noteIdentifier {
    return Intl.message(
      'Lưu ý: Số giấy tờ này sử dụng làm Tên đăng nhập!',
      name: 'noteIdentifier',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng đang được phát triển`
  String get featureDevelopment {
    return Intl.message(
      'Tính năng đang được phát triển',
      name: 'featureDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có chắc muốn xóa dữ liệu tài khoản này?`
  String get deleteAccount {
    return Intl.message(
      'Bạn có chắc muốn xóa dữ liệu tài khoản này?',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chắc chắn muốn hủy đơn hàng này?`
  String get cancelOrderConfirm {
    return Intl.message(
      'Bạn chắc chắn muốn hủy đơn hàng này?',
      name: 'cancelOrderConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Không có đơn hàng nào\nphù hợp với điều kiện lọc`
  String get emptyOrderData {
    return Intl.message(
      'Không có đơn hàng nào\nphù hợp với điều kiện lọc',
      name: 'emptyOrderData',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã hoặc tên đơn hàng`
  String get enterTextToSearchOrder {
    return Intl.message(
      'Nhập mã hoặc tên đơn hàng',
      name: 'enterTextToSearchOrder',
      desc: '',
      args: [],
    );
  }

  /// `Loại yêu cầu`
  String get requestOrderType {
    return Intl.message(
      'Loại yêu cầu',
      name: 'requestOrderType',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn ngày bắt đầu!`
  String get pleaseChooseStartDate {
    return Intl.message(
      'Vui lòng chọn ngày bắt đầu!',
      name: 'pleaseChooseStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn ngày kết thúc!`
  String get pleaseChooseEndDate {
    return Intl.message(
      'Vui lòng chọn ngày kết thúc!',
      name: 'pleaseChooseEndDate',
      desc: '',
      args: [],
    );
  }

  /// `Ngày bắt đầu phải sớm hơn ngày kết thúc!`
  String get pleaseChooseDateValid {
    return Intl.message(
      'Ngày bắt đầu phải sớm hơn ngày kết thúc!',
      name: 'pleaseChooseDateValid',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực sinh trắc học bị vô hiệu hóa. Vui lòng Khóa và Mở khóa màn hình của bạn.`
  String get iOSLockOut {
    return Intl.message(
      'Xác thực sinh trắc học bị vô hiệu hóa. Vui lòng Khóa và Mở khóa màn hình của bạn.',
      name: 'iOSLockOut',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng mới`
  String get newFeatures {
    return Intl.message(
      'Tính năng mới',
      name: 'newFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản trực tuyến sử dụng eKYC`
  String get registerIntro {
    return Intl.message(
      'Đăng ký tài khoản trực tuyến sử dụng eKYC',
      name: 'registerIntro',
      desc: '',
      args: [],
    );
  }

  /// `Mua chứng thư, Mua lượt ký, Gia hạn, Thay đổi thông tin Chứng thư số trực tuyến`
  String get certIntro {
    return Intl.message(
      'Mua chứng thư, Mua lượt ký, Gia hạn, Thay đổi thông tin Chứng thư số trực tuyến',
      name: 'certIntro',
      desc: '',
      args: [],
    );
  }

  /// `Sở hữu không giới hạn, đặt tên và Ký số bằng nhiều Chứng thư`
  String get signIntro {
    return Intl.message(
      'Sở hữu không giới hạn, đặt tên và Ký số bằng nhiều Chứng thư',
      name: 'signIntro',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi thiết bị, Kích hoạt lại Chứng thư trực tuyến`
  String get changeDeviceIntro {
    return Intl.message(
      'Thay đổi thiết bị, Kích hoạt lại Chứng thư trực tuyến',
      name: 'changeDeviceIntro',
      desc: '',
      args: [],
    );
  }

  /// `Ký số, Nhận file, Chia sẻ file ngay trên ứng dụng`
  String get shareIntro {
    return Intl.message(
      'Ký số, Nhận file, Chia sẻ file ngay trên ứng dụng',
      name: 'shareIntro',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập nhiều tài khoản trên một thiết bị`
  String get loginIntro {
    return Intl.message(
      'Đăng nhập nhiều tài khoản trên một thiết bị',
      name: 'loginIntro',
      desc: '',
      args: [],
    );
  }

  /// `Sử dụng giấy tờ tùy thân và xác thực khuôn mặt để đăng ký tài khoản`
  String get registerDetailIntro {
    return Intl.message(
      'Sử dụng giấy tờ tùy thân và xác thực khuôn mặt để đăng ký tài khoản',
      name: 'registerDetailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có thể chuyển đổi và sử dụng nhiều tài khoản trên một thiết bị`
  String get loginDetailIntro {
    return Intl.message(
      'Bạn có thể chuyển đổi và sử dụng nhiều tài khoản trên một thiết bị',
      name: 'loginDetailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có thể mua không giới hạn, đặt tên và lựa chọn Chứng thư khi Ký số`
  String get signDetailIntro {
    return Intl.message(
      'Bạn có thể mua không giới hạn, đặt tên và lựa chọn Chứng thư khi Ký số',
      name: 'signDetailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có thể Kích hoạt lại chứng thư trên thiết bị khác khi muốn đổi, bị mất thiết hoặc mất thông tin khóa chứng thư`
  String get changeDeviceDetailIntro {
    return Intl.message(
      'Bạn có thể Kích hoạt lại chứng thư trên thiết bị khác khi muốn đổi, bị mất thiết hoặc mất thông tin khóa chứng thư',
      name: 'changeDeviceDetailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có thể nhận file từ các ứng dụng khác để Tạo giao dịch và Chia sẻ lại file đã Ký số`
  String get shareDetailIntro {
    return Intl.message(
      'Bạn có thể nhận file từ các ứng dụng khác để Tạo giao dịch và Chia sẻ lại file đã Ký số',
      name: 'shareDetailIntro',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư`
  String get cert {
    return Intl.message(
      'Chứng thư',
      name: 'cert',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu hiện tại chưa chính xác`
  String get currentPasswordNotCorrect {
    return Intl.message(
      'Mật khẩu hiện tại chưa chính xác',
      name: 'currentPasswordNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu mới chưa chính xác`
  String get reEnterNewPasswordNotCorrect {
    return Intl.message(
      'Nhập lại mật khẩu mới chưa chính xác',
      name: 'reEnterNewPasswordNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống liên kết`
  String get linkSystem {
    return Intl.message(
      'Hệ thống liên kết',
      name: 'linkSystem',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách hệ thống liên kết`
  String get listLinkSystem {
    return Intl.message(
      'Danh sách hệ thống liên kết',
      name: 'listLinkSystem',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách các hệ thống được liên kết để thực hiện ký số với hình thức xác nhận tự động qua OTP gói Smart CA tích hợp`
  String get desListLinkSystem {
    return Intl.message(
      'Danh sách các hệ thống được liên kết để thực hiện ký số với hình thức xác nhận tự động qua OTP gói Smart CA tích hợp',
      name: 'desListLinkSystem',
      desc: '',
      args: [],
    );
  }

  /// `Chờ cấu hình`
  String get waitingConfig {
    return Intl.message(
      'Chờ cấu hình',
      name: 'waitingConfig',
      desc: '',
      args: [],
    );
  }

  /// `Đang liên kết`
  String get linking {
    return Intl.message(
      'Đang liên kết',
      name: 'linking',
      desc: '',
      args: [],
    );
  }

  /// `Tạm dừng`
  String get pause {
    return Intl.message(
      'Tạm dừng',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Cấu hình`
  String get config {
    return Intl.message(
      'Cấu hình',
      name: 'config',
      desc: '',
      args: [],
    );
  }

  /// `Cấu hình ký tự động`
  String get configAutomaticCharacters {
    return Intl.message(
      'Cấu hình ký tự động',
      name: 'configAutomaticCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Theo thời gian cài đặt`
  String get accordingToInstallationTime {
    return Intl.message(
      'Theo thời gian cài đặt',
      name: 'accordingToInstallationTime',
      desc: '',
      args: [],
    );
  }

  /// `Khi hết thời hạn quý khách thực hiện cấu hình lại để tiếp tục sử dụng`
  String get whenTheTermExpires {
    return Intl.message(
      'Khi hết thời hạn quý khách thực hiện cấu hình lại để tiếp tục sử dụng',
      name: 'whenTheTermExpires',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian đến ngày`
  String get timeToDate {
    return Intl.message(
      'Thời gian đến ngày',
      name: 'timeToDate',
      desc: '',
      args: [],
    );
  }

  /// `Theo nhu cầu sử dụng`
  String get accordingToUsageNeeds {
    return Intl.message(
      'Theo nhu cầu sử dụng',
      name: 'accordingToUsageNeeds',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống sẽ thực hiện ký số tự động khi quý khách chọn mở. Tắt tính năng khi không còn sử dụng.`
  String get theSystemWillAutomaticallySign {
    return Intl.message(
      'Hệ thống sẽ thực hiện ký số tự động khi quý khách chọn mở. Tắt tính năng khi không còn sử dụng.',
      name: 'theSystemWillAutomaticallySign',
      desc: '',
      args: [],
    );
  }

  /// `Mở`
  String get turnOn {
    return Intl.message(
      'Mở',
      name: 'turnOn',
      desc: '',
      args: [],
    );
  }

  /// `Tắt`
  String get turnOff {
    return Intl.message(
      'Tắt',
      name: 'turnOff',
      desc: '',
      args: [],
    );
  }

  /// `Xoá hệ thống liên kết`
  String get deleteLinkSystem {
    return Intl.message(
      'Xoá hệ thống liên kết',
      name: 'deleteLinkSystem',
      desc: '',
      args: [],
    );
  }

  /// `Quý khách có đồng ý xóa hệ thống liên kết ký số tự động đối với: '{anything}'?`
  String agreeRemoveLinkSystem(Object anything) {
    return Intl.message(
      'Quý khách có đồng ý xóa hệ thống liên kết ký số tự động đối với: \'$anything\'?',
      name: 'agreeRemoveLinkSystem',
      desc: '',
      args: [anything],
    );
  }

  /// `Nếu xóa, quý khách vui lòng thực hiện liên kết trên hệ thống '{anything}' để liên kết lại.`
  String ifDeletePleaseMake(Object anything) {
    return Intl.message(
      'Nếu xóa, quý khách vui lòng thực hiện liên kết trên hệ thống \'$anything\' để liên kết lại.',
      name: 'ifDeletePleaseMake',
      desc: '',
      args: [anything],
    );
  }

  /// `Hình nền`
  String get hinh_nen {
    return Intl.message(
      'Hình nền',
      name: 'hinh_nen',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có hệ thống nào được liên kết.\nVui lòng thực hiện theo hướng dẫn `
  String get noSystemsLinkYet {
    return Intl.message(
      'Chưa có hệ thống nào được liên kết.\nVui lòng thực hiện theo hướng dẫn ',
      name: 'noSystemsLinkYet',
      desc: '',
      args: [],
    );
  }

  /// ` để thực hiện liên kết hệ thống`
  String get toPerformSystemLinking {
    return Intl.message(
      ' để thực hiện liên kết hệ thống',
      name: 'toPerformSystemLinking',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu huỷ liên kết thành công`
  String get requestUnlinkSuccess {
    return Intl.message(
      'Yêu cầu huỷ liên kết thành công',
      name: 'requestUnlinkSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu liên kết thành công`
  String get requestLinkSuccess {
    return Intl.message(
      'Yêu cầu liên kết thành công',
      name: 'requestLinkSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản không có Chứng thư số sử dụng gói Tích hợp.`
  String get notUseeSeal {
    return Intl.message(
      'Tài khoản không có Chứng thư số sử dụng gói Tích hợp.',
      name: 'notUseeSeal',
      desc: '',
      args: [],
    );
  }

  /// `Không có chứng thư số đang hoạt động`
  String get no_exist_cert_valid {
    return Intl.message(
      'Không có chứng thư số đang hoạt động',
      name: 'no_exist_cert_valid',
      desc: '',
      args: [],
    );
  }

  /// `Chọn chứng thư số cần thay đổi thông tin!`
  String get select_cert_to_change_info {
    return Intl.message(
      'Chọn chứng thư số cần thay đổi thông tin!',
      name: 'select_cert_to_change_info',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi thông tin`
  String get change_info {
    return Intl.message(
      'Thay đổi thông tin',
      name: 'change_info',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ Thay đổi thông tin chứng thư số cho Doanh nghiệp`
  String get notice_support_business_customer_change_info {
    return Intl.message(
      'Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ Thay đổi thông tin chứng thư số cho Doanh nghiệp',
      name: 'notice_support_business_customer_change_info',
      desc: '',
      args: [],
    );
  }

  /// `Chờ duyệt yêu cầu thay đổi\nthông tin chứng thư số`
  String get waitingForAcceptChangeInfoTitle {
    return Intl.message(
      'Chờ duyệt yêu cầu thay đổi\nthông tin chứng thư số',
      name: 'waitingForAcceptChangeInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chứng thư số cá nhân trong doanh nghiệp chưa hỗ trợ {action} online. Yêu cầu của quý khách sẽ được gửi đến nhân viên hỗ trợ.  Hoặc Quý khách có thể liên hệ trực tiếp Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ.`
  String notice_cert_action_for_business_account(Object action) {
    return Intl.message(
      'Chứng thư số cá nhân trong doanh nghiệp chưa hỗ trợ $action online. Yêu cầu của quý khách sẽ được gửi đến nhân viên hỗ trợ.  Hoặc Quý khách có thể liên hệ trực tiếp Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ.',
      name: 'notice_cert_action_for_business_account',
      desc: '',
      args: [action],
    );
  }

  /// `Gửi`
  String get send {
    return Intl.message(
      'Gửi',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi thông tin chứng thư`
  String get changeInfoCTS {
    return Intl.message(
      'Thay đổi thông tin chứng thư',
      name: 'changeInfoCTS',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập họ tên.`
  String get please_input_full_name {
    return Intl.message(
      'Vui lòng nhập họ tên.',
      name: 'please_input_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Họ tên mới không được trùng với họ tên cũ.`
  String get please_input_different_name {
    return Intl.message(
      'Họ tên mới không được trùng với họ tên cũ.',
      name: 'please_input_different_name',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật thông tin tài khoản thành công`
  String get update_info_success {
    return Intl.message(
      'Cập nhật thông tin tài khoản thành công',
      name: 'update_info_success',
      desc: '',
      args: [],
    );
  }

  /// `Về trang chủ`
  String get goHomeTC {
    return Intl.message(
      'Về trang chủ',
      name: 'goHomeTC',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật email, số điện thoại`
  String get update_email_phone {
    return Intl.message(
      'Cập nhật email, số điện thoại',
      name: 'update_email_phone',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số điện thoại hoặc email khác!`
  String get please_choose_email_phone_other {
    return Intl.message(
      'Vui lòng nhập số điện thoại hoặc email khác!',
      name: 'please_choose_email_phone_other',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật địa chỉ`
  String get update_info_title {
    return Intl.message(
      'Cập nhật địa chỉ',
      name: 'update_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng thay đổi thông tin địa chỉ!`
  String get not_info_change {
    return Intl.message(
      'Vui lòng thay đổi thông tin địa chỉ!',
      name: 'not_info_change',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
