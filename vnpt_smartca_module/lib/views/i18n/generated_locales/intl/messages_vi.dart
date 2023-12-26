// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(anything) =>
      "Quý khách có đồng ý xóa hệ thống liên kết ký số tự động đối với: \'${anything}\'?";

  static String m1(anything) => "${anything}";

  static String m2(transactionCount, message) =>
      "Hủy thành công ${transactionCount} giao dịch \n ${message}";

  static String m3(number) => "CCCD/HC/MST: ${number}";

  static String m4(anything) => "Danh sách tài liệu ${anything}";

  static String m5(hotline) =>
      "Rất tiếc, chúng tôi không thể xác minh giấy tờ của Bạn. Vui lòng liên hệ Tổng đài ${hotline} (nhánh 1) để được hỗ trợ xác minh thông tin tại quầy!";

  static String m6(anything) => "Vui lòng nhập đủ ${anything} ký tự";

  static String m7(anything) => "Nhập ${anything}";

  static String m8(number) => "Hết hạn sau ${number} ngày";

  static String m9(number) => "${number} tháng";

  static String m10(anything) =>
      "Nếu xóa, quý khách vui lòng thực hiện liên kết trên hệ thống \'${anything}\' để liên kết lại.";

  static String m11(anything) => "Vui lòng nhập ${anything}";

  static String m12(numberPackages) => "Danh sách gói (${numberPackages})";

  static String m13(anything) => "Vui lòng nhập tối đa ${anything} ký tự";

  static String m14(anything) => "Vui lòng nhập tối thiểu ${anything} ký tự";

  static String m15(number) =>
      "Tài khoản ${number} của bạn đã kích hoạt. Vui lòng Đăng nhập để thực hiện kích hoạt CTS";

  static String m16(number) =>
      "Tài khoản ${number} không đúng với thông tin đăng ký.\n Vui lòng kiểm tra và nhập lại đúng số giấy tờ!";

  static String m17(step) => "Bước ${step}";

  static String m18(action) =>
      "Chứng thư số cá nhân trong doanh nghiệp chưa hỗ trợ ${action} online. Yêu cầu của quý khách sẽ được gửi đến nhân viên hỗ trợ.  Hoặc Quý khách có thể liên hệ trực tiếp Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ.";

  static String m19(number) => "Có ${number} chứng thư số đang chờ kích hoạt!";

  static String m20(number) =>
      "Đã tồn tại tài khoản “${number}”, bạn có muốn mua thêm chứng thư số không? \nĐăng nhập để mua thêm chứng thư số!";

  static String m21(number) =>
      "Tài khoản “${number}” đang chờ kích hoạt, vui lòng thực hiện kích hoạt!";

  static String m22(hotline) =>
      "Để đăng ký tài khoản vui lòng liên hệ số hotline ${hotline} nhánh 1 (miễn phí)!";

  static String m23(action) =>
      "Tiếp theo, Bạn cần ${action} và nộp hồ sơ để sử dụng chứng thư số, vui lòng kiểm tra email/sms để nhận thông tin kích hoạt từ VNPT SmartCA!";

  static String m24(purpose) => "Vui lòng sử dụng sinh trắc học để ${purpose}";

  static String m25(numberPackages) => "Kết quả (${numberPackages})";

  static String m26(anything) => "Nhập ${anything} để tiếp tục";

  static String m27(transactionCount, message) =>
      "Ký thành công ${transactionCount} giao dịch \n ${message}";

  static String m28(serial) =>
      "Đã tồn tại yêu cầu thay đổi thiết bị với serial ${serial}.  Bạn có muốn tiếp tục?";

  static String m29(number) => "Tổng lượt ký: (${number})";

  static String m30(total) => "Tổng số: ${total} kết quả";

  static String m31(total) => "(${total} văn bản)";

  static String m32(numberCertificate) => "Chứng thư số ${numberCertificate}";

  static String m33(number) => "${number} lượt";

  static String m34(version) => "VNPT SmartCA phiên bản ${version}";

  static String m35(number) => "${number} VNĐ";

  static String m36(number) =>
      "Bạn còn ${number} lượt ký chưa sử dụng, nếu gia hạn số lượt ký sẽ hết hiệu lực. Bạn có muốn tiếp tục Gia hạn không?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Activated": MessageLookupByLibrary.simpleMessage("Kích hoạt"),
        "Continue": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "KAKNotFound": MessageLookupByLibrary.simpleMessage(
            "Chứng thư chưa được đăng ký trên thiết bị. Bạn có muốn đăng ký chứng thư số trên thiết bị này không?"),
        "Notice": MessageLookupByLibrary.simpleMessage("Thông báo"),
        "Retake": MessageLookupByLibrary.simpleMessage("Chụp lại"),
        "acceptance": MessageLookupByLibrary.simpleMessage("Nghiệm thu"),
        "acceptanceTranTypeDesc":
            MessageLookupByLibrary.simpleMessage("Ký BBNT"),
        "accordingToInstallationTime":
            MessageLookupByLibrary.simpleMessage("Theo thời gian cài đặt"),
        "accordingToUsageNeeds":
            MessageLookupByLibrary.simpleMessage("Theo nhu cầu sử dụng"),
        "account": MessageLookupByLibrary.simpleMessage("Tài khoản"),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Thông tin tài khoản"),
        "accountRegisteredSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Tài khoản đã được đăng ký thành công. \nVui lòng Đăng nhập để tiếp tục!"),
        "accountType": MessageLookupByLibrary.simpleMessage("Loại tài khoản"),
        "activate": MessageLookupByLibrary.simpleMessage("Kích hoạt"),
        "activateAccount":
            MessageLookupByLibrary.simpleMessage("Kích hoạt tài khoản"),
        "activateBiometricDesc": MessageLookupByLibrary.simpleMessage(
            "Sử dụng sinh trắc học để tăng cường tính bảo mật, bạn có đồng ý?"),
        "activateButton":
            MessageLookupByLibrary.simpleMessage("Ký biên bản nghiệm thu"),
        "activateCode": MessageLookupByLibrary.simpleMessage("Mã kích hoạt"),
        "activateKeyPair":
            MessageLookupByLibrary.simpleMessage("Kích hoạt cặp khóa"),
        "activateSuccessDesc": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số của bạn đã được kích hoạt thành công."),
        "activateSuccessTitle":
            MessageLookupByLibrary.simpleMessage("Kích hoạt thành công"),
        "activateTransactionNotSignAcceptanceMinutes":
            MessageLookupByLibrary.simpleMessage(
                "Tài khoản chưa ký biên bản nghiệm thu"),
        "activateTransactionNotSignKeypair":
            MessageLookupByLibrary.simpleMessage(
                "Tài khoản chưa được kích hoạt cặp khóa"),
        "activated": MessageLookupByLibrary.simpleMessage("Đã kích hoạt"),
        "activationTutorial":
            MessageLookupByLibrary.simpleMessage("Hướng dẫn kích hoạt"),
        "active": MessageLookupByLibrary.simpleMessage("Đang hoạt động"),
        "activeAccount":
            MessageLookupByLibrary.simpleMessage("Kích hoạt tài khoản"),
        "activeBiometricAuthentication": MessageLookupByLibrary.simpleMessage(
            "Kích hoạt xác thực sinh trắc học"),
        "activeCer":
            MessageLookupByLibrary.simpleMessage("Kích hoạt chứng thư số"),
        "activeCodeSent": MessageLookupByLibrary.simpleMessage(
            "Mã kích hoạt đã được gửi về email của bạn"),
        "activeNow": MessageLookupByLibrary.simpleMessage("Kích hoạt ngay"),
        "active_bio":
            MessageLookupByLibrary.simpleMessage("Sử dụng sinh trắc học"),
        "activing": MessageLookupByLibrary.simpleMessage("Đang hoạt động"),
        "activingCert":
            MessageLookupByLibrary.simpleMessage("Đang kích hoạt chứng thư..."),
        "activingKey": MessageLookupByLibrary.simpleMessage(
            "Đang xử lý, vui lòng đợi trong giây lát..."),
        "addAccount":
            MessageLookupByLibrary.simpleMessage("Thêm tài khoản khác"),
        "addDocument": MessageLookupByLibrary.simpleMessage("Thêm tài liệu"),
        "address": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
        "addressDetail":
            MessageLookupByLibrary.simpleMessage("Địa chỉ chi tiết"),
        "addressFullLabel": MessageLookupByLibrary.simpleMessage(
            "Tỉnh/Thành phố, Quận/Huyện, Phường/Xã"),
        "addressInfo": MessageLookupByLibrary.simpleMessage("Địa chỉ liên hệ"),
        "addressOnDocuments":
            MessageLookupByLibrary.simpleMessage("Địa chỉ trên giấy tờ"),
        "addressOption":
            MessageLookupByLibrary.simpleMessage("Tuỳ chọn địa chỉ"),
        "affiliateAppName": MessageLookupByLibrary.simpleMessage("Ứng dụng"),
        "affiliateApplication":
            MessageLookupByLibrary.simpleMessage("Ứng dụng"),
        "agree": MessageLookupByLibrary.simpleMessage("Đồng ý"),
        "agreeRemoveLinkSystem": m0,
        "alertApproval": MessageLookupByLibrary.simpleMessage(
            "Xác nhận thông tin của bạn gặp sự cố đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ"),
        "alertDelRegDevice": MessageLookupByLibrary.simpleMessage(
            "- Chỉ dùng khi thay đổi sang tài khoản khác trên thiết bị này\n- Thông tin của tài sẽ bị xóa, Bạn sẽ quay trở lại màn hình kích hoạt tài khoản!"),
        "all": MessageLookupByLibrary.simpleMessage("Tất cả"),
        "anything": m1,
        "apply": MessageLookupByLibrary.simpleMessage("Áp dụng"),
        "authentication": MessageLookupByLibrary.simpleMessage("Xác thực"),
        "back": MessageLookupByLibrary.simpleMessage("Quay lại"),
        "backLighting":
            MessageLookupByLibrary.simpleMessage("Không chụp quá lóa sáng"),
        "beingVerified":
            MessageLookupByLibrary.simpleMessage("Đang xác minh thông tin"),
        "bioHint": MessageLookupByLibrary.simpleMessage("Xác thực danh tính"),
        "bioNotRecognized":
            MessageLookupByLibrary.simpleMessage("Nhận dạng không thành công"),
        "bioRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu xác thực sinh trắc học"),
        "bioSignInTitle":
            MessageLookupByLibrary.simpleMessage("Yêu cầu xác thực"),
        "bio_protect_pin": MessageLookupByLibrary.simpleMessage(
            "Để bảo vệ mã PIN của bạn vui lòng sử dụng thiết bị có hỗ trợ sinh trắc học và kích hoạt tính năng này"),
        "biometricAuthDesc": MessageLookupByLibrary.simpleMessage(
            "Bạn có muốn dùng sinh trắc học để Đăng nhập?"),
        "biometricAuthentication": MessageLookupByLibrary.simpleMessage(
            "Đăng nhập bằng Sinh trắc học"),
        "biometricDialogButton":
            MessageLookupByLibrary.simpleMessage("Xác thực bằng sinh trắc học"),
        "biometricDialogTitle":
            MessageLookupByLibrary.simpleMessage("Yêu cầu xác thực"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Xác thực thành công"),
        "biometrics": MessageLookupByLibrary.simpleMessage("Sinh trắc học"),
        "biometricsGoToSettingsDesc": MessageLookupByLibrary.simpleMessage(
            "Xác thực sinh trắc học chưa được thiết lập trên thiết bị. Vui lòng bật Touch ID hoặc Face ID trên điện thoại của bạn."),
        "blurryPhotos":
            MessageLookupByLibrary.simpleMessage("Không chụp ảnh quá mờ"),
        "btnPayment": MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "bulletDot": MessageLookupByLibrary.simpleMessage("•"),
        "business": MessageLookupByLibrary.simpleMessage("Doanh nghiệp"),
        "businessOrganization":
            MessageLookupByLibrary.simpleMessage("Tổ chức Doanh nghiệp"),
        "businessRegistrationCertificate":
            MessageLookupByLibrary.simpleMessage("Giấy đăng ký kinh doanh"),
        "but_ve": MessageLookupByLibrary.simpleMessage("Vẽ"),
        "buyCTS": MessageLookupByLibrary.simpleMessage("Mua\nchứng thư"),
        "buyNow": MessageLookupByLibrary.simpleMessage("Mua ngay"),
        "buySignatures": MessageLookupByLibrary.simpleMessage("Mua\nlượt ký"),
        "buy_signature": MessageLookupByLibrary.simpleMessage("Mua lượt ký"),
        "bySignatures": MessageLookupByLibrary.simpleMessage("Theo lượt ký"),
        "calAuthDataFail":
            MessageLookupByLibrary.simpleMessage("Tính toán xác thực lỗi."),
        "canLoading":
            MessageLookupByLibrary.simpleMessage("Thả xuống để tải thêm"),
        "can_giua": MessageLookupByLibrary.simpleMessage("Căn giữa"),
        "can_le": MessageLookupByLibrary.simpleMessage("Căn lề"),
        "can_not_extend_cert":
            MessageLookupByLibrary.simpleMessage("Bạn không thể gia hạn!"),
        "can_not_extend_cert_description": MessageLookupByLibrary.simpleMessage(
            "Lý do Không tồn tại chứng thư số ở trạng thái Đang hoạt động hoặc Hết hạn."),
        "can_phai": MessageLookupByLibrary.simpleMessage("Căn phải"),
        "can_trai": MessageLookupByLibrary.simpleMessage("Căn trái"),
        "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
        "cancelOrderConfirm": MessageLookupByLibrary.simpleMessage(
            "Bạn chắc chắn muốn hủy đơn hàng này?"),
        "cancelTransaction":
            MessageLookupByLibrary.simpleMessage("Hủy giao dịch"),
        "cancelTransactionDone":
            MessageLookupByLibrary.simpleMessage("Đã hủy bỏ giao dịch"),
        "cancel_order": MessageLookupByLibrary.simpleMessage("Hủy đơn hàng"),
        "cancel_tranaction_success": m2,
        "canceled": MessageLookupByLibrary.simpleMessage("Hủy bỏ"),
        "cannotGetDeviceInfo": MessageLookupByLibrary.simpleMessage(
            "Không thể lấy thông tin thiết bị."),
        "cannotSignKeyChallenge":
            MessageLookupByLibrary.simpleMessage("Không thể ký khóa."),
        "cant_not_certificate_active_in_device":
            MessageLookupByLibrary.simpleMessage(
                "Không có chứng thư được kích hoạt trên thiết bị này. Vui lòng thực hiện Đổi thiết bị"),
        "cant_not_signature_document": MessageLookupByLibrary.simpleMessage(
            "Không thể thực hiện ký số vì chứng thư số đang được sử dụng bởi thiết bị khác"),
        "cert": MessageLookupByLibrary.simpleMessage("Chứng thư"),
        "certBusinessRegistration": MessageLookupByLibrary.simpleMessage(
            "Giấy chứng nhận đăng ký kinh doanh bản gốc"),
        "certDetail":
            MessageLookupByLibrary.simpleMessage("Chi tiết chứng thư số"),
        "certIntro": MessageLookupByLibrary.simpleMessage(
            "Mua chứng thư, Mua lượt ký, Gia hạn, Thay đổi thông tin Chứng thư số trực tuyến"),
        "certOrderIsExistingNotice": MessageLookupByLibrary.simpleMessage(
            "Tồn tại yêu cầu đăng ký chứng thư số trước đó, Bạn có muốn tiếp tục hay đăng ký mới?"),
        "certPackNoteContent": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số chưa bao gồm lượt ký. Số lượt ký sẽ theo gói lượt ký mua riêng."),
        "certPackNoteLabel": MessageLookupByLibrary.simpleMessage("Lưu ý"),
        "certRequester": MessageLookupByLibrary.simpleMessage(
            "Đối chiếu khuôn mặt với ảnh CMND/CCCD"),
        "certValid": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số đã được kích hoạt"),
        "certificate": MessageLookupByLibrary.simpleMessage("Chứng thư số"),
        "certificate_get_list_error": MessageLookupByLibrary.simpleMessage(
            "Không lấy được thông tin chứng thư số"),
        "certificate_package_get_districts_error":
            MessageLookupByLibrary.simpleMessage(
                "Lỗi: Không lấy được thông tin Quận/Huyện"),
        "certificate_package_get_list_error":
            MessageLookupByLibrary.simpleMessage(
                "Lỗi: Không lấy được thông tin gói Chứng thư số"),
        "certificate_package_get_province_error":
            MessageLookupByLibrary.simpleMessage(
                "Lỗi: Không lấy được thông tin Tỉnh/Thành phố"),
        "certificate_package_get_wards_error":
            MessageLookupByLibrary.simpleMessage(
                "Lỗi: Không lấy được thông tin Phường xã"),
        "certificate_package_item_amount_title":
            MessageLookupByLibrary.simpleMessage("Thành tiền"),
        "certificate_package_item_price_title":
            MessageLookupByLibrary.simpleMessage("Phí dịch vụ"),
        "certificate_package_item_timevalidity":
            MessageLookupByLibrary.simpleMessage("Thời gian sử dụng"),
        "certificate_package_item_unit_price_title":
            MessageLookupByLibrary.simpleMessage("Đơn giá"),
        "certificate_package_list_empty":
            MessageLookupByLibrary.simpleMessage("Không có dữ liệu hiển thị"),
        "certificate_package_list_option_sign_limit":
            MessageLookupByLibrary.simpleMessage("Chứng thư số theo lượt ký"),
        "certificate_package_list_option_sign_no_limit":
            MessageLookupByLibrary.simpleMessage(
                "Chứng thư số không giới hạn lượt ký"),
        "certificate_package_list_title":
            MessageLookupByLibrary.simpleMessage("Chọn gói chứng thư số"),
        "certificate_package_list_title_empty":
            MessageLookupByLibrary.simpleMessage(
                "Không có gói Chứng thư nào được chọn"),
        "certificate_package_no_selected_error":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng chọn Chứng thư số trước khi khai báo thông tin!"),
        "certificate_package_notify_order_desc_success":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng chuẩn bị giấy tờ CCCD/CMND/Hộ chiếu để thực hiện nộp hồ sơ cấp chứng thư số!"),
        "certificate_package_notify_order_success":
            MessageLookupByLibrary.simpleMessage(
                "Đăng ký cấp chứng thư số thành công"),
        "certificate_package_page_confirm_order_title":
            MessageLookupByLibrary.simpleMessage("Xác nhận đơn hàng"),
        "certificate_package_page_order_title":
            MessageLookupByLibrary.simpleMessage("Thông tin gói dịch vụ"),
        "certificate_package_page_register_title":
            MessageLookupByLibrary.simpleMessage("Khai báo thông tin"),
        "certificate_package_progress_order":
            MessageLookupByLibrary.simpleMessage("Đang xử lý đơn hàng..."),
        "certificate_package_progress_order_success":
            MessageLookupByLibrary.simpleMessage("Khởi tạo dịch vụ thành công"),
        "certificate_package_register_account":
            MessageLookupByLibrary.simpleMessage("Đăng ký tài khoản"),
        "certificate_package_register_first":
            MessageLookupByLibrary.simpleMessage("Chưa có tài khoản? "),
        "certificate_package_register_second":
            MessageLookupByLibrary.simpleMessage("Đăng ký chứng thư số"),
        "certificate_package_save_order_error":
            MessageLookupByLibrary.simpleMessage(
                "Lỗi: Không lưu được đơn hàng"),
        "certificate_package_sign_type_limit":
            MessageLookupByLibrary.simpleMessage(
                "Số lượt ký sẽ theo gói lượt ký khách hàng mua"),
        "certificate_package_sign_type_no_limit":
            MessageLookupByLibrary.simpleMessage("Số lượt ký không giới hạn"),
        "certificate_package_user_form_info_item_fullname_hint_text":
            MessageLookupByLibrary.simpleMessage("Nhập đầy đủ Họ tên"),
        "certificate_package_user_form_info_item_fullname_label_text":
            MessageLookupByLibrary.simpleMessage("Họ tên"),
        "certificate_package_user_form_info_item_hint_search_text":
            MessageLookupByLibrary.simpleMessage("Nhập từ khóa tìm kiếm"),
        "certificate_package_user_form_info_item_identitycard_number_hint_text":
            MessageLookupByLibrary.simpleMessage("Nhập chính xác số CCCD/CMND"),
        "certificate_package_user_form_info_item_identitycard_number_label_text":
            MessageLookupByLibrary.simpleMessage("Số CCCD/CMND"),
        "certificate_package_user_form_info_item_identitycard_type_label_text":
            MessageLookupByLibrary.simpleMessage("Loại giấy tờ chứng thực"),
        "certificate_package_user_form_info_item_issuedDate_label_text":
            MessageLookupByLibrary.simpleMessage("Ngày cấp"),
        "certificate_package_user_form_info_item_issuedPlace_hint_text":
            MessageLookupByLibrary.simpleMessage("Nhập nơi cấp"),
        "certificate_package_user_form_info_item_issuedPlace_label_text":
            MessageLookupByLibrary.simpleMessage("Nơi cấp"),
        "certificate_package_user_form_info_item_nationlitys_label_text":
            MessageLookupByLibrary.simpleMessage("Quốc tịch"),
        "certificate_package_user_form_info_item_text_group_first":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng nhập chính xác các thông tin: "),
        "certificate_package_user_form_info_item_text_group_second":
            MessageLookupByLibrary.simpleMessage("Số CCCD/CMND"),
        "certificate_package_user_form_info_item_text_group_three":
            MessageLookupByLibrary.simpleMessage(" đúng với giấy tờ"),
        "certificate_package_user_form_info_item_text_group_title":
            MessageLookupByLibrary.simpleMessage(
                "Thông tin người sở hữu chứng thư số"),
        "certificate_package_validate_emailr_error":
            MessageLookupByLibrary.simpleMessage("Email không đúng định dạng"),
        "certificate_package_validate_input_error":
            MessageLookupByLibrary.simpleMessage(
                "Thông tin không được bỏ trống"),
        "certificate_package_validate_input_isnumeric_only_error":
            MessageLookupByLibrary.simpleMessage(
                "Thông tin chỉ nhập số, không nhập ký tự"),
        "certificate_package_validate_input_special_error":
            MessageLookupByLibrary.simpleMessage(
                "Thông tin không được chứa ký tự đặc biệt"),
        "certificate_package_validate_phone_error":
            MessageLookupByLibrary.simpleMessage(
                "Số điện thoại không đúng định dạng"),
        "certificate_packageuser_form_contact_certificate_info_item_email_hint_text":
            MessageLookupByLibrary.simpleMessage("Nhập email"),
        "certificate_packageuser_form_contact_certificate_info_item_email_label_text":
            MessageLookupByLibrary.simpleMessage("Email"),
        "certificate_packageuser_form_contact_certificate_info_item_phone_hint_text":
            MessageLookupByLibrary.simpleMessage("Nhập số điện thoại"),
        "certificate_packageuser_form_contact_certificate_info_item_phone_label_text":
            MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "certificate_packageuser_form_contact_certificate_info_item_text_group":
            MessageLookupByLibrary.simpleMessage(
                "Thông tin liên hệ sử dụng chứng thư số"),
        "certificate_packageuser_form_contact_certificate_info_item_text_group_desc":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng kiểm tra kỹ số điện thoại, email chính xác để nhận thông tin kích hoạt dịch vụ."),
        "certificate_packageuser_form_contact_info_item_address_hint_text":
            MessageLookupByLibrary.simpleMessage("Nhập số nhà, đường, phố"),
        "certificate_packageuser_form_contact_info_item_address_label_text":
            MessageLookupByLibrary.simpleMessage("Địa chỉ chi tiết"),
        "certificate_packageuser_form_contact_info_item_districts_label_text":
            MessageLookupByLibrary.simpleMessage("Quận/Huyện"),
        "certificate_packageuser_form_contact_info_item_province_label_text":
            MessageLookupByLibrary.simpleMessage("Tỉnh/Thành phố"),
        "certificate_packageuser_form_contact_info_item_text_group_desc":
            MessageLookupByLibrary.simpleMessage(
                "Sử dụng địa chỉ thường trú hoặc nơi làm việc để nhận hóa đơn và được hỗ trợ nhanh nhất."),
        "certificate_packageuser_form_contact_info_item_text_group_title":
            MessageLookupByLibrary.simpleMessage("Địa chỉ liên hệ"),
        "certificate_packageuser_form_contact_info_item_wards_label_text":
            MessageLookupByLibrary.simpleMessage("Phường xã"),
        "certificate_serial":
            MessageLookupByLibrary.simpleMessage("Serial chứng thư số"),
        "changeDevice": MessageLookupByLibrary.simpleMessage("Đổi thiết bị"),
        "changeDeviceDescription": MessageLookupByLibrary.simpleMessage(
            "Chọn chứng thư số cần đổi thiết bị"),
        "changeDeviceDetailIntro": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể Kích hoạt lại chứng thư trên thiết bị khác khi muốn đổi, bị mất thiết hoặc mất thông tin khóa chứng thư"),
        "changeDeviceIntro": MessageLookupByLibrary.simpleMessage(
            "Thay đổi thiết bị, Kích hoạt lại Chứng thư trực tuyến"),
        "changeDeviceOrder":
            MessageLookupByLibrary.simpleMessage("Thay đổi thiết bị"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Đổi email"),
        "changeInfo":
            MessageLookupByLibrary.simpleMessage("Thay đổi\nthông tin"),
        "changeInfoCTS": MessageLookupByLibrary.simpleMessage(
            "Thay đổi thông tin chứng thư"),
        "changeNameDescription": MessageLookupByLibrary.simpleMessage(
            "Người dùng vui lòng đặt tên chứng thư số để phân biệt dễ dàng các chứng thư số khi người dùng sử dụng hai chứng thư số trở lên."),
        "changePIN": MessageLookupByLibrary.simpleMessage("Đổi PIN"),
        "changePassSuccess": MessageLookupByLibrary.simpleMessage(
            "Thay đổi mật khẩu thành công"),
        "changePassword": MessageLookupByLibrary.simpleMessage("Đổi mật khẩu"),
        "change_info":
            MessageLookupByLibrary.simpleMessage("Thay đổi thông tin"),
        "checkingInfor": MessageLookupByLibrary.simpleMessage(
            "Đang xử lý, vui lòng đợi trong giây lát.."),
        "chi_hien_thi_logo":
            MessageLookupByLibrary.simpleMessage("3. Chỉ hiển thị logo"),
        "chi_hien_thi_text":
            MessageLookupByLibrary.simpleMessage("1. Chỉ hiển thị text"),
        "chon_chu_ky": MessageLookupByLibrary.simpleMessage(
            "Chạm vị trí bất kỳ để chọn chữ ký"),
        "chon_tai_lieu": MessageLookupByLibrary.simpleMessage("Chọn tài liệu"),
        "chon_tep": MessageLookupByLibrary.simpleMessage("Chọn tệp"),
        "chooseDocumentToSign":
            MessageLookupByLibrary.simpleMessage("Chọn tài liệu ký số"),
        "chu_ky_ben_phai_logo_chu_ben_trai":
            MessageLookupByLibrary.simpleMessage(
                "Chữ ký bên phải, logo và chữ bên trái"),
        "chu_ky_ben_trai_logo_chu_ben_phai":
            MessageLookupByLibrary.simpleMessage(
                "Chữ ký bên trái, logo và chữ bên phải"),
        "chu_ky_giua": MessageLookupByLibrary.simpleMessage("Chữ ký ở giữa"),
        "chup_anh": MessageLookupByLibrary.simpleMessage("Chụp ảnh"),
        "citizenId": m3,
        "citizenIdFullLabel":
            MessageLookupByLibrary.simpleMessage("Số CCCD/Hộ chiếu/Mã số thuế"),
        "citizenIdLabel": MessageLookupByLibrary.simpleMessage("CCCD/HC/MST"),
        "citizenIdentification":
            MessageLookupByLibrary.simpleMessage("Căn cước công dân"),
        "clear": MessageLookupByLibrary.simpleMessage("Làm mới"),
        "close": MessageLookupByLibrary.simpleMessage("Đóng"),
        "codeValidIn": MessageLookupByLibrary.simpleMessage(
            "Mã kích hoạt hiệu lực trong "),
        "collapse": MessageLookupByLibrary.simpleMessage("Thu gọn"),
        "complete": MessageLookupByLibrary.simpleMessage("Hoàn thành"),
        "completed": MessageLookupByLibrary.simpleMessage("Hoàn thành"),
        "config": MessageLookupByLibrary.simpleMessage("Cấu hình"),
        "configAutomaticCharacters":
            MessageLookupByLibrary.simpleMessage("Cấu hình ký tự động"),
        "configSignatureTemplate":
            MessageLookupByLibrary.simpleMessage("Cấu hình mẫu chữ ký"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "confirmCancel": MessageLookupByLibrary.simpleMessage("Xác nhận hủy"),
        "confirmInfo": MessageLookupByLibrary.simpleMessage(
            "Thông tin đăng ký cấp Chứng thư"),
        "confirmInformation":
            MessageLookupByLibrary.simpleMessage("Xác nhận thông tin"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu mới"),
        "confirmPINDesc":
            MessageLookupByLibrary.simpleMessage("Nhập lại mã PIN để xác nhận"),
        "confirmPINTitle":
            MessageLookupByLibrary.simpleMessage("Xác nhận mã PIN"),
        "confirmPassIsEmpty": MessageLookupByLibrary.simpleMessage(
            "Trường xác nhận lại mật khẩu mới không được để trống"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu"),
        "confirmTransaction":
            MessageLookupByLibrary.simpleMessage("Xác nhận ký số"),
        "connectTimeout":
            MessageLookupByLibrary.simpleMessage("Thời gian kết nối quá lâu."),
        "contactCSKH": MessageLookupByLibrary.simpleMessage("Liên hệ CSKH:"),
        "contactCustomerCare":
            MessageLookupByLibrary.simpleMessage("Tổng đài CSKH"),
        "contactInfo":
            MessageLookupByLibrary.simpleMessage("Thông tin liên hệ"),
        "continueProcessing":
            MessageLookupByLibrary.simpleMessage("Xử lý tiếp"),
        "copied": MessageLookupByLibrary.simpleMessage("Đã sao chép."),
        "createAccount": MessageLookupByLibrary.simpleMessage("Tạo tài khoản"),
        "createPinTitle": MessageLookupByLibrary.simpleMessage("Tạo mã PIN"),
        "createTransaction":
            MessageLookupByLibrary.simpleMessage("Tạo giao dịch ký"),
        "create_order_no_data_selected": MessageLookupByLibrary.simpleMessage(
            "Không có gói lượt ký nào được chọn"),
        "create_ticket_extension_error_description":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) \nmiễn phí để được hỗ trợ!"),
        "create_ticket_extension_error_label":
            MessageLookupByLibrary.simpleMessage(
                "Tạo phiếu đề nghị gia hạn không thành công"),
        "creatingContract":
            MessageLookupByLibrary.simpleMessage("Đang tạo hợp đồng"),
        "creatingRequest": MessageLookupByLibrary.simpleMessage(
            "Đang tạo yêu cầu thay đổi thiết bị"),
        "creating_extend_ticket_description": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang khởi tạo phiếu đề nghị gia hạn, \nvui lòng đợi trong giây lát...."),
        "creating_extend_ticket_label": MessageLookupByLibrary.simpleMessage(
            "Đang tạo Phiếu đề nghị gia hạn dịch vụ"),
        "ctsPersonal":
            MessageLookupByLibrary.simpleMessage("Chứng thư số cá nhân"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Mật khẩu hiện tại"),
        "currentPasswordNotCorrect": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu hiện tại chưa chính xác"),
        "cycle": MessageLookupByLibrary.simpleMessage("Chu kỳ"),
        "danh_sach_chu_ky":
            MessageLookupByLibrary.simpleMessage("Danh sách chữ ký"),
        "dataNotFound":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy dữ liệu"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Ngày sinh"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage(
            "Bạn có chắc muốn xóa dữ liệu tài khoản này?"),
        "deleteLinkSystem":
            MessageLookupByLibrary.simpleMessage("Xoá hệ thống liên kết"),
        "desAdviceBusiness": MessageLookupByLibrary.simpleMessage(
            "Vui lòng cung cấp thông tin để nhân viên VNPT hỗ trợ thủ tục đăng ký chứng thư số cho Tổ chức Doanh nghiệp!"),
        "desCheckboxRequestBill": MessageLookupByLibrary.simpleMessage(
            "Tôi đã đọc và đồng ý với nội dung trên Phiếu đề nghị"),
        "desErrorEkyc": MessageLookupByLibrary.simpleMessage(
            "Rất tiếc, chúng tôi không thể xác minh thông tin của Bạn. Bạn chỉ có 03 lần thực hiện eKYC.\n\nVui lòng thực hiện đúng theo hướng dẫn để quá trình xác minh được chính xác.\nHoặc liên hệ nhân viên VNPT để được hỗ trợ xác minh thông tin tại quầy!"),
        "desErrorEkyc3times": MessageLookupByLibrary.simpleMessage(
            "Rất tiếc, chúng tôi không thể xác minh thông tin hồ sơ đăng ký online của Bạn. Vui lòng liên hệ nhân viên VNPT để được hỗ trợ xác minh thông tin tại quầy!"),
        "desListLinkSystem": MessageLookupByLibrary.simpleMessage(
            "Danh sách các hệ thống được liên kết để thực hiện ký số với hình thức xác nhận tự động qua OTP gói Smart CA tích hợp"),
        "desRequestSentSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Nhân viên kinh doanh VNPT sẽ liên hệ với bạn. Vui lòng kiểm tra email hoặc điện thoại để được tư vấn hỗ trợ!"),
        "desSuccessfulAccountRegistration": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn đăng ký chứng thư số để sử dụng dịch vụ ký số từ xa VNPT SmartCA!"),
        "detail": MessageLookupByLibrary.simpleMessage("Chi tiết"),
        "detailAddress":
            MessageLookupByLibrary.simpleMessage("Địa chỉ chi tiết"),
        "detailDocSignature":
            MessageLookupByLibrary.simpleMessage("Chi tiết tài liệu ký số"),
        "deviceId": MessageLookupByLibrary.simpleMessage("Mã thiết bị"),
        "deviceIdloggedIn":
            MessageLookupByLibrary.simpleMessage("Mã thiết bị đang đăng nhập"),
        "deviceUsingThisCert": MessageLookupByLibrary.simpleMessage(
            "Thiết bị kích hoạt chứng thư"),
        "digitalCertificate":
            MessageLookupByLibrary.simpleMessage("Chứng thư số"),
        "digitalSignature": MessageLookupByLibrary.simpleMessage("Ký số"),
        "digitalSignatureDocument":
            MessageLookupByLibrary.simpleMessage("Tài liệu ký số"),
        "dinh_danh_file_ho_tro":
            MessageLookupByLibrary.simpleMessage("Định dạng file được hỗ trợ"),
        "district": MessageLookupByLibrary.simpleMessage("Quận/Huyện"),
        "docSignatureHistory":
            MessageLookupByLibrary.simpleMessage("Lịch sử tài liệu ký số"),
        "documentList": m4,
        "documentPreview": MessageLookupByLibrary.simpleMessage("Xem tài liệu"),
        "document_exits": MessageLookupByLibrary.simpleMessage(
            "Tài liệu đã được thêm, Bạn có muốn tiếp tục?"),
        "drawYourSignature":
            MessageLookupByLibrary.simpleMessage("Vẽ chữ ký của bạn"),
        "dung_luong_vuot_qua_15mb": MessageLookupByLibrary.simpleMessage(
            "Dung lượng file tối đa là 15MB"),
        "editInformation":
            MessageLookupByLibrary.simpleMessage("Sửa thông tin"),
        "ekycErrorContactHotline": m5,
        "ekycFail": MessageLookupByLibrary.simpleMessage(
            "Xác thực EKYC không thành công"),
        "electronicSignature":
            MessageLookupByLibrary.simpleMessage("Ký điện tử"),
        "email": MessageLookupByLibrary.simpleMessage("Địa chỉ email"),
        "emailContact": MessageLookupByLibrary.simpleMessage("Email liên hệ"),
        "emailOnly": MessageLookupByLibrary.simpleMessage("Email"),
        "emailReceiveNotification":
            MessageLookupByLibrary.simpleMessage("Email nhận thông báo"),
        "emptyData": MessageLookupByLibrary.simpleMessage("Không có dữ liệu"),
        "emptyDataFiltered": MessageLookupByLibrary.simpleMessage(
            "Không có gói nào phù hợp\nvới điều kiện lọc"),
        "emptyDescTransaction": MessageLookupByLibrary.simpleMessage(
            "Chưa có giao dịch cần xác nhận ký số."),
        "emptyOrderData": MessageLookupByLibrary.simpleMessage(
            "Không có đơn hàng nào\nphù hợp với điều kiện lọc"),
        "empty_description": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn gói lượt ký để tiếp tục"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enoughLength": m6,
        "enterAccountInformation":
            MessageLookupByLibrary.simpleMessage("Nhập thông tin tài khoản"),
        "enterActivateCode":
            MessageLookupByLibrary.simpleMessage("Nhập mã kích hoạt"),
        "enterAnything": m7,
        "enterCurrentPassword":
            MessageLookupByLibrary.simpleMessage("Nhập mật khẩu hiện tại"),
        "enterIdNumber": MessageLookupByLibrary.simpleMessage(
            "Nhập số định danh đã đăng ký Chứng thư số"),
        "enterNewPassword":
            MessageLookupByLibrary.simpleMessage("Nhập mật khẩu mới"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Nhập mật khẩu"),
        "enterPhoneNumberForRegister": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập đúng số điện thoại đã đăng ký. Quý khách kiểm tra email để biết thông tin số điện thoại."),
        "enterPinCode": MessageLookupByLibrary.simpleMessage("Nhập mã PIN"),
        "enterTextToSearchOrder":
            MessageLookupByLibrary.simpleMessage("Nhập mã hoặc tên đơn hàng"),
        "enterThePackageNameToSearch":
            MessageLookupByLibrary.simpleMessage("Nhập tên gói cần tìm kiếm"),
        "err61000": MessageLookupByLibrary.simpleMessage(
            "Tạo khóa gán thông tin xác thực không thành công!"),
        "esealType": MessageLookupByLibrary.simpleMessage("Gói tích hợp"),
        "exist_order": MessageLookupByLibrary.simpleMessage(
            "Tồn tại đơn hàng thay đổi thông tin/đổi thiết bị/gia hạn cho chứng thư số này, Nhấn vào Xem chi tiết để xem thêm thông tin!"),
        "expire_in_day": m8,
        "expired": MessageLookupByLibrary.simpleMessage("Hết thời hạn"),
        "expired_alter_message": MessageLookupByLibrary.simpleMessage(
            "CTS của khách hàng đã hết thời hạn sử dụng. Vui lòng thực hiện đăng ký cấp mới chứng thư số để tiếp tục sử dụng dịch vụ mua lượt ký."),
        "extend": MessageLookupByLibrary.simpleMessage("Gia hạn"),
        "extend_now": MessageLookupByLibrary.simpleMessage("Gia hạn ngay"),
        "faceIDDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Vui lòng sử dụng FaceID để xác nhận"),
        "faq": MessageLookupByLibrary.simpleMessage("Câu hỏi thường gặp"),
        "featureDevelopment": MessageLookupByLibrary.simpleMessage(
            "Tính năng đang được phát triển"),
        "female": MessageLookupByLibrary.simpleMessage("Nữ"),
        "fileName": MessageLookupByLibrary.simpleMessage("Tên file"),
        "filterByMonth": m9,
        "fingerprintDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Vui lòng sử dụng dấu vân tay để xác nhận"),
        "finishTime":
            MessageLookupByLibrary.simpleMessage("Thời gian kết thúc"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "forgotPasswordScreen":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu"),
        "free": MessageLookupByLibrary.simpleMessage("Miễn phí"),
        "fromDate": MessageLookupByLibrary.simpleMessage("Từ ngày"),
        "fullDocument":
            MessageLookupByLibrary.simpleMessage("CCCD/CMND/Hộ chiếu"),
        "fullName": MessageLookupByLibrary.simpleMessage("Họ tên"),
        "fullPolicyProtection": MessageLookupByLibrary.simpleMessage(
            "Chính sách bảo vệ dữ liệu cá nhân của khách hàng (sau đây gọi tắt là “Chính Sách”) nhằm mục đích thông báo với Khách Hàng những Dữ Liệu Cá Nhân được TỔNG CÔNG TY DỊCH VỤ VIỄN THÔNG (“VNPT-VINAPHONE”) xử lý, mục đích xử lý, cách thức xử lý, thời gian lưu trữ, chia sẻ Dữ Liệu Cá Nhân, và các quyền của Khách Hàng đối với Dữ Liệu Cá Nhân của mình theo quy định của pháp luật Việt Nam về bảo vệ dữ liệu cá nhân. Chính Sách này đồng thời đưa ra các khuyến nghị cho Khách Hàng để nâng cao nhận thức về bảo vệ dữ liệu cá nhân tránh những thiệt hại không mong muốn xảy ra trong quá trình VNPT-Vinaphone thực hiện xử lý Dữ Liệu Cá Nhân của Khách Hàng. \nChính Sách này được áp dụng cho toàn bộ các nền tảng (App, Web…), trang thông tin điện tử, kênh giao diện, phương tiện, công cụ trên các website/ứng dụng của VNPT-Vinaphone bao gồm cả việc tư vấn và ký kết hợp đồng cung cấp dịch vụ trực tiếp tại các điểm cung cấp dịch vụ viễn thông của VNPT-Vinaphone. \nChính Sách này bao gồm các nội dung sau:\nĐiều 1. Điều khoản định nghĩa  \nĐiều 2. Xử lý dữ liệu cá nhân\nĐiều 3. Mục đích xử lý dữ liệu cá nhân \nĐiều 4. Cách thức xử lý dữ liệu cá nhân \nĐiều 5. Thời gian bắt đầu, thời gian kết thúc xử lý dữ liệu cá nhân \nĐiều 6. Chia sẻ dữ liệu cá nhân\nĐiều 7. Lưu trữ dữ liệu cá nhân \nĐiều 8. Kiểm soát dữ liệu cá nhân \nĐiều 9. Bảo vệ dữ liệu cá nhân\nĐiều 10. Hậu quả, thiệt hại không mong muốn có khả năng xảy ra \nĐiều 11. Sử dụng Cookies \nĐiều 12. Quảng cáo trên Internet và bên thứ ba\nĐiều 13. Xử lý dữ liệu cá nhân không cần sự đồng ý của chủ thể dữ liệu\nĐiều 14. Thông tin liên lạc \nĐiều 15. Điều chỉnh, sửa đổi \nBằng việc tích vào ô “Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone”, Khách Hàng xác nhận rằng đã đọc, hiểu, và chấp thuận toàn bộ các điều khoản và điều kiện quy định tại Chính Sách này. Chính Sách này là một phần các điều khoản và điều kiện cung cấp dịch vụ và là một phụ lục không tách rời của Hợp đồng dịch vụ của từng sản phẩm, dịch vụ mà Khách Hàng đã xác lập với VNPT-Vinaphone.  \nĐiều 1. \tĐIỀU KHOẢN ĐỊNH NGHĨA\nTrong phạm vi Chính Sách này, trừ khi ngữ cảnh yêu cầu khác đi, các thuật ngữ dưới đây được hiểu và giải thích như sau: \n1.1.\tVNPT-Vinaphone có nghĩa là TỔNG CÔNG TY DỊCH VỤ VIỄN THÔNG \n1.2.\tKhách Hàng có nghĩa là \n•\tCá nhân hoặc người đại diện hợp pháp của cá nhân sử dụng và/hoặc quan tâm tới các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone; \n•\tCá nhân hoặc người đại diện hợp pháp của cá nhân đã truy cập và/hoặc đăng ký tài khoản tại các website và/hoặc ứng dụng thuộc quyền sở hữu của VNPT-Vinaphone.  \n1.3.\tSản Phẩm, Dịch Vụ Của VNPT-Vinaphone có nghĩa là \n•\tSản phẩm, dịch vụ do VNPT-Vinaphone trực tiếp nghiên cứu, phát triển và cung cấp cho Khách Hàng;\n•\tSản phẩm, dịch vụ của Tập đoàn Bưu chính Viễn thông hoặc các sản phẩm, dịch vụ của các đơn vị trực thuộc Tập đoàn Bưu chính Viễn thông mà VNPT-Vinaphone là bên đại diện thực hiện các quyền và nghĩa vụ của bên cung cấp dịch vụ;\n•\tSản phẩm, dịch vụ do VNPT-Vinaphone hợp tác với (các) bên thứ ba để cung cấp cho Khách Hàng. \nĐiều 2. \tXỬ LÝ DỮ LIỆU CÁ NHÂN \n2.1\tVNPT-Vinaphone tiến hành xử lý Dữ Liệu Cá Nhân của Khách Hàng trong từng trường hợp cụ thể, bao gồm, nhưng không giới hạn bởi: \n•\tKhi Khách Hàng hoặc người đại diện hợp pháp của Khách Hàng liên hệ với VNPT-Vinaphone để yêu cầu tư vấn Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone hoặc bày tỏ sự quan tâm tới các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone; \n•\tKhi Khách Hàng sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n•\tKhi Khách Hàng truy cập và/hoặc đăng ký tài khoản tại các website và/hoặc ứng dụng thuộc quyền sở hữu của VNPT-Vinaphone;\n•\tKhi Khách Hàng đồng thuận cung cấp Dữ Liệu Cá Nhân cho VNPT-Vinaphone qua các nguồn công khai, bao gồm nhưng không giới hạn bởi: cuộc họp, sự kiện, hội thảo, hội nghị, các mạng xã hội, hay chương trình đối thoại, thảo luận do VNPT-Vinaphone tổ chức, tài trợ hoặc tham dự và/hoặc từ các tệp lưu trữ (cookies) ghi nhận được trên trang website của VNPT-Vinaphone;\n•\tKhi Khách Hàng cho phép một bên thứ ba không phải là VNPT-Vinaphone thực hiện chia sẻ Dữ Liệu Cá Nhân của Khách hàng với VNPT-Vinaphone;\n•\tKhi Khách Hàng là khách hàng của một tổ chức, doanh nghiệp được VNPT-Vinaphone thực hiện góp vốn, mua cổ phần; \n•\tKhi có yêu cầu của các cơ quan nhà nước có thẩm quyền. \n2.2\tDữ Liệu Cá Nhân của Khách Hàng mà VNPT- Vinaphone tiến hành xử lý (sau đây gọi tắt là “Dữ Liệu Cá Nhân”) bao gồm nhưng không giới hạn và có thể thay đổi tùy thuộc và sản phẩm hoặc dịch vụ, tương tác của Khách Hàng với VNPT-Vinaphone: \n2.2.1.\tDữ liệu cá nhân cơ bản\na) Họ, chữ đệm và tên khai sinh, tên gọi khác (nếu có);\nb) Ngày, tháng, năm sinh; ngày, tháng, năm chết hoặc mất tích;\nc) Giới tính;\nd) Nơi sinh, nơi đăng ký khai sinh, nơi thường trú, nơi tạm trú, nơi ở hiện tại, quê quán, địa chỉ liên hệ;\nđ) Quốc tịch;\ne) Hình ảnh của cá nhân;\ng) Số điện thoại, số chứng minh nhân dân, số định danh cá nhân, số hộ chiếu, số giấy phép lái xe, số biển số xe, số mã số thuế cá nhân, số bảo hiểm xã hội, số thẻ bảo hiểm y tế;\nh) Tình trạng hôn nhân;\ni) Thông tin về mối quan hệ gia đình (cha mẹ, con cái);\nk) Thông tin về tài khoản số của cá nhân; dữ liệu cá nhân phản ánh hoạt động, lịch sử hoạt động trên không gian mạng;\nl) Điểm tín nhiệm viễn thông của Khách hàng: được thể hiện dưới dạng điểm số, là kết quả của quá trình VNPT-Vinaphone xử lý, phân tích dữ liệu của Khách Hàng sử dụng dịch vụ viễn thông, nhằm đánh giá, phân tích, dự đoán hoạt động như: thói quen, sở thích, mức độ tin cậy, hành vi, địa điểm, xu hướng, năng lực và các trường hợp khác, hỗ trợ cho việc cung cấp các sản phẩm, dịch vụ viễn thông của VNPT-Vinaphone cho Khách Hàng một cách tốt nhất. \n2.2.2.\tDữ liệu cá nhân nhạy cảm \na) Dữ liệu về tội phạm, hành vi phạm tội được thu thập, lưu trữ bởi các cơ quan thực thi pháp luật;\nb) Thông tin khách hàng của tổ chức tín dụng, chi nhánh ngân hàng nước ngoài, tổ chức cung ứng dịch vụ trung gian thanh toán, các tổ chức được phép khác, gồm: thông tin định danh khách hàng theo quy định của pháp luật, thông tin về tài khoản, thông tin về tiền gửi, thông tin về tài sản gửi, thông tin về giao dịch, thông tin về tổ chức, cá nhân là bên bảo đảm tại tổ chức tín dụng, chi nhánh ngân hàng, tổ chức cung ứng dịch vụ trung gian thanh toán;\nc) Dữ liệu về vị trí của cá nhân được xác định qua dịch vụ định vị.\n2.2.3.\tDữ liệu cá nhân khác không thuộc nhóm dữ liệu cá nhân cơ bản và dữ liệu cá nhân nhạy cảm quy định tại Điều 2.2.1 và Điều 2.2.2. \n2.3.\tVNPT-Vinaphone sẽ thông báo cho Khách Hàng các Dữ Liệu Cá Nhân bắt buộc phải cung cấp và/hoặc tùy chọn cung cấp tại thời điểm thu thập Dữ Liệu Cá Nhân của Khách Hàng. Nếu các Dữ Liệu Cá Nhân bắt buộc không được cung cấp theo yêu cầu, Khách Hàng sẽ không thể sử dụng một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone và/hoặc VNPT-Vinaphone có thể từ chối cung cấp Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng mà không phải chịu bất kì một khoản bồi thường và/hoặc phạt vi phạm nào. \n2.4.\tTại từng thời điểm, Khách Hàng có thể tự nguyện cung cấp cho VNPT-Vinaphone các Dữ Liệu Cá Nhân nằm ngoài yêu cầu của VNPT-Vinaphone. Khi Khách Hàng cung cấp Dữ Liệu Cá Nhân cho VNPT-Vinaphone với bất cứ lý do gì, đồng nghĩa với việc Khách Hàng đã đồng ý cho phép VNPT-Vinaphone xử lý Dữ Liệu Cá Nhân đó với Mục Đích được nêu trong Chính Sách này hoặc với mục đích được nêu tại thời điểm Khách Hàng cung cấp những Dữ Liệu Cá Nhân đó. Ngoài ra, khi chủ động cung cấp thông tin nằm ngoài yêu cầu của VNPT-Vinaphone, Khách Hàng vui lòng không cung cấp Dữ Liệu Cá Nhân nhạy cảm theo quy định của pháp luật tại từng thời điểm. VNPT-Vinaphone sẽ không thực hiện xử lý và không chịu bất kì trách nhiệm pháp lý nào đối với các Dữ Liệu Cá Nhân nhạy cảm do Khách Hàng tự nguyện cung cấp nằm ngoài yêu cầu của VNPT-Vinaphone. \nĐiều 3. \tMỤC ĐÍCH XỬ LÝ DỮ LIỆU CÁ NHÂN \nVNPT - Vinaphone có thể xử lý Dữ Liệu Cá Nhân của Khách Hàng cho một hoặc một vài mục đích được liệt kê sau đây (“Mục Đích”) bao gồm, nhưng không giới hạn bởi các Mục Đích sau: \n3.1.\tXác minh tính chính xác, đầy đủ của các thông tin được Khách Hàng cung cấp; xác định hoặc xác thực danh tính của Khách Hàng và thực hiện quy trình xác thực Khách Hàng; Xử lý việc đăng ký sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.2.\tThẩm định hồ sơ và khả năng đủ điều kiện của Khách Hàng đối với việc sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone. VNPT-Vinaphone có thể sử dụng các phương pháp chấm điểm, gán ngưỡng cước nóng, kiểm tra lịch sử Khách Hàng sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone để đánh giá và quản trị rủi ro tín dụng, đảm bảo khả năng thanh toán đối với các nghĩa vụ thanh toán và các nghĩa vụ khác có liên quan trong suốt quá trình cung cấp Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng;\n3.3.\tQuản lý và đánh giá các hoạt động kinh doanh bao gồm thiết kế, cải tiến và nâng cao chất lượng các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone hoặc thực hiện các hoạt động truyền thông tiếp thị; Thực hiện nghiên cứu thị trường, khảo sát và phân tích dữ liệu liên quan đến Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.4.\tLiên hệ với Khách Hàng nhằm trao đổi thông tin, giải quyết yêu cầu, khiếu nại, giao các hóa đơn, các sao kê, các báo cáo hoặc các tài liệu khác liên quan tới Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone thông qua các kênh khác nhau (ví dụ: email, chat) và để trả lời yêu cầu của Khách Hàng. Điều này bao gồm việc liên hệ với Khách Hàng (hoặc các bên cần thiết khác) để thông báo cho Khách Hàng về thông tin liên quan đến việc sử dụng Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone;\n3.5.\tQuảng cáo, tiếp thị dựa trên sở thích, thói quen sử dụng dịch vụ của Khách Hàng: VNPT-Vinaphone có thể sử dụng Dữ Liệu Cá Nhân để quảng cáo, tiếp thị với Khách Hàng về các Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone, chương trình khuyến mại, nghiên cứu, khảo sát, tin tức, thông tin cập nhật, các sự kiện, cuộc thi có thưởng, trao các phần thưởng có liên quan, các quảng cáo và nội dung có liên quan về Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone, sản phẩm, dịch vụ của các đơn vị thuộc hệ sinh thái của Tập đoàn Bưu chính Viễn thông Việt Nam hoặc của các đối tác hợp tác với VNPT-Vinaphone hoặc hợp tác với các đơn vị trực thuộc Tập đoàn Bưu chính Viễn thông Việt Nam. Trường hợp Khách Hàng không muốn nhận email, tin nhắn và/hoặc bản tin định kỳ với mục đích quảng cáo, tiếp thị của VNPT-Vinaphone với tần suất tùy thuộc vào chính sách của VNPT-Vinaphone theo từng thời kỳ và phù hợp với quy định pháp luật, Khách Hàng có thể tích vào ô “Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone” hoặc liên hệ với VNPT-Vinaphone theo các thông tin liên lạc quy định tại Chính Sách này để được hỗ trợ;\n3.6.\tLập các báo cáo tài chính, báo cáo hoạt động hoặc các loại báo cáo liên quan khác mà pháp luật quy định;\n3.7.\tTuân thủ các nghĩa vụ pháp lý theo quy định của pháp luật;\n3.8.\tNgăn chặn gian lận hoặc giảm thiểu mối đe doạ đối với tính mạng, sức khỏe của người khác và lợi ích công cộng: VNPT-Vinaphone có thể sử dụng thông tin cá nhân của Khách Hàng để ngăn chặn và phát hiện gian lận và lạm dụng nhằm bảo vệ Khách Hàng, VNPT-Vinaphone và các chủ thể liên quan;\n3.9.\tQuản trị nội bộ;\n3.10.\tCác mục đích khác có liên quan đến những mục đích được nêu trên.\nĐiều 4. \tCÁCH THỨC XỬ LÝ DỮ LIỆU CÁ NHÂN\nVNPT-Vinaphone áp dụng một hoặc nhiều hoạt động tác động tới Dữ Liệu Cá Nhân như: thu thập, ghi, phân tích, xác nhận, lưu trữ, chỉnh sửa, công khai, kết hợp, truy cập, truy xuất, thu hồi, mã hóa, giải mã, sao chép, chia sẻ, truyền đưa, cung cấp, chuyển giao, xóa, hủy dữ liệu cá nhân hoặc các hành động khác có liên quan. \nĐiều 5. \tTHỜI GIAN BẮT ĐẦU, THỜI GIAN KẾT THÚC XỬ LÝ DỮ LIỆU \n5.1.\tThời gian bắt đầu xử lý dữ liệu\nKể từ thời điểm Khách Hàng chấp thuận với Chính sách này. \n5.2.\tThời gian kết thúc xử lý dữ liệu \nTrừ trường hợp pháp luật Việt Nam có quy định khác hoặc Khách Hàng có yêu cầu chấm dứt việc xử lý Dữ Liệu Cá Nhân của Khách Hàng, VNPT-Vinaphone chấm dứt việc xử lý Dữ Liệu Cá Nhân khi đã hoàn thành Mục Đích quy định tại Chính Sách này. \nĐiều 6. \tCHIA SẺ DỮ LIỆU CÁ NHÂN \n6.1.\tĐể thực hiện các Mục Đích quy định tại Chính Sách này, VNPT-Vinaphone có thể chia sẻ Dữ Liệu Cá Nhân của Khách Hàng với:\n6.1.1.\tCác công ty con, đơn vị trực thuộc của VNPT-Vinaphone, công ty mẹ là Tập đoàn Bưu Chính Viễn thông Việt Nam, các đơn vị trực thuộc, liên kết của Tập đoàn Bưu Chính Viễn thông Việt Nam: Một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone do Tập đoàn Bưu chính Viễn thông Việt Nam, các đơn vị trực thuộc, liên kết của Tập đoàn hợp tác với VNPT-Vinaphone cung cấp, do đó, việc chia sẻ Dữ Liệu Cá Nhân với các chủ thể này là cần thiết và chỉ nhằm mục đích cung cấp dịch vụ cho Khách Hàng;\n6.1.2.\tBên thứ ba cung cấp dịch vụ: VNPT-Vinaphone sử dụng và/hoặc hợp tác với các công ty và cá nhân khác để thực hiện một số công việc và chương trình như chương trình khuyến mại dành cho Khách Hàng, nghiên cứu thị trường, phân tích và phát triển sản phẩm, tư vấn chiến lược, cung cấp dịch vụ thu cước. Các Bên thứ ba cung cấp dịch vụ này có quyền truy cập, thu thập, sử dụng và xử lý Dữ Liệu Cá Nhân cần thiết để thực hiện các chức năng của họ, bao gồm nhưng không giới hạn hoạt động quảng cáo, giới thiệu, cung cấp các sản phẩm/dịch vụ khác thuộc hệ sinh thái của Tập đoàn Bưu chính Viễn thông Việt Nam hoặc của các đối tác hợp tác với Tập đoàn Bưu chính Viễn thông Việt Nam hoặc hợp tác với các đơn vị trực thuộc, liên kết của Tập đoàn Bưu chính Viễn thông Việt Nam. Các bên thứ ba cung cấp dịch vụ này phải tuân thủ pháp luật về bảo vệ Dữ Liệu Cá Nhân với tư cách là Bên Xử lý Dữ Liệu;\n6.1.3.\tTái cấu trúc doanh nghiệp: Trong quá trình phát triển kinh doanh, VNPT-Vinaphone có thể bán hoặc mua các doanh nghiệp hoặc tái cấu trúc doanh nghiệp phù hợp với quy định của pháp luật và nhu cầu sản xuất kinh doanh. Trong các giao dịch như vậy, Dữ Liệu Cá Nhân là một trong những tài sản kinh doanh được chuyển nhượng nhưng bên nhận chuyển nhượng vẫn phải tuân theo các quy định của Chính Sách này;\n6.1.4.\tBảo vệ quyền và lợi ích hợp pháp của VNPT-Vinaphone và các chủ thể khác: VNPT-Vinaphone được phép tiết lộ Dữ Liệu Cá Nhân khi VNPT-Vinaphone có căn cứ cho rằng việc tiết lộ này được pháp luật yêu cầu, theo yêu cầu của cơ quan quản lý nhà nước, để thực thi hoặc áp dụng các điều khoản và thỏa thuận khác của VNPT-Vinaphone hoặc để bảo vệ quyền, tài sản hoặc an ninh của VNPT-Vinaphone, khách hàng của VNPT-Vinaphone, hoặc bất kỳ chủ thể nào khác. Các công việc nêu trên có thể bao gồm việc trao đổi thông tin với các công ty và tổ chức khác để ngăn chặn và phát hiện gian lận và giảm rủi ro tài sản và tín dụng, hoặc tiết lộ một số loại thông tin nhất định trong trường hợp VNPT-Vinaphone nhận được yêu cầu ràng buộc về mặt pháp lý từ các cơ quan nhà nước có thẩm quyền;\n6.1.5.\tTùy theo sự lựa chọn của Khách Hàng: Ngoài các trường hợp nêu trên, Dữ Liệu Cá Nhân có thể được chia sẻ với bên thứ ba nhằm mục đích theo quy định tại Điều 3.5 Chính Sách này và Khách Hàng sẽ có quyền không chấp thuận việc chia sẻ thông tin theo quy định tại Điều 8.4 Chính Sách này. \n6.2.\tVNPT-Vinaphone không thực hiện chia sẻ Dữ Liệu Cá Nhân vì mục đích lợi nhuận. \nĐiều 7. \tLƯU TRỮ DỮ LIỆU CÁ NHÂN \n7.1.\tDữ Liệu Cá Nhân của Khách Hàng do VNPT-Vinaphone lưu trữ sẽ được bảo mật. VNPT-Vinaphone, trong khả năng của mình, sẽ nỗ lực thực hiện các biện pháp hợp lý để bảo vệ Dữ Liệu Cá Nhân của Khách Hàng.\n7.2.\tĐịa điểm lưu trữ Dữ Liệu Cá nhân\nTrong phạm vi pháp luật cho phép, VNPT-Vinaphone có thể lưu trữ Dữ Liệu Cá Nhân của Khách Hàng tại Việt Nam và ở nước ngoài, kể cả trên giải pháp lưu trữ điện toán đám mây. VNPT-Vinaphone áp dụng các tiêu chuẩn về bảo mật dữ liệu phù hợp với quy định pháp luật hiện hành.\n7.3.\tThời gian lưu trữ Dữ Liệu Cá Nhân\nVNPT-Vinaphone chỉ thực hiện lưu trữ Dữ Liệu Cá Nhân của Khách Hàng trong khoảng thời gian cần thiết và hợp lý để hoàn thành các Mục Đích. Trường hợp pháp luật hiện hành có quy định về thời hạn lưu trữ Dữ Liệu Cá Nhân kể cả sau khi đã hoàn thành Mục Đích nêu trong Chính Sách này, VNPT-Vinaphone có nghĩa vụ tuân thủ quy định của pháp luật. \nĐiều 8. \tKIỂM SOÁT DỮ LIỆU CÁ NHÂN \n8.1.\tQuyền được biết và Quyền đồng ý\nBằng Chính Sách này, VNPT-Vinaphone thông báo cho Khách Hàng được biết về hoạt động xử lý Dữ Liệu Cá Nhân của Khách Hàng trước khi thực hiện xử lý Dữ Liệu Cá Nhân. Đồng thời, Khách Hàng có quyền đồng ý hoặc không đồng ý với các điều khoản và điều kiện của Chính Sách này bằng cách tích hoặc không tích vào ô “Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone”.\n8.2.\tQuyền truy cập và yêu cầu cung cấp Dữ Liệu Cá Nhân \nKhách Hàng có quyền truy cập vào các ứng dụng/website của VNPT-Vinaphone và/hoặc liên hệ trực tiếp với VNPT-Vinaphone để kiểm tra, trích xuất các Dữ Liệu Cá Nhân mà Khách Hàng đã cung cấp cho VNPT-Vinaphone phục vụ các Mục Đích quy định tại Chính Sách này. Trường hợp Khách Hàng không thể tự truy cập, trích xuất hoặc gặp khó khăn trong việc truy cập, trích xuất các Dữ Liệu Cá Nhân, Khách Hàng có thể liên hệ với VNPT-Vinaphone để được hỗ trợ.\n8.3.\tQuyền chỉnh sửa\nKhách Hàng có quyền chỉnh sửa các Dữ Liệu Cá Nhân của mình với điều kiện và việc chỉnh sửa này không vi phạm các quy định của pháp luật. Trường hợp Khách Hàng không thể tự chỉnh sửa hoặc gặp khó khăn trong việc chỉnh sửa các Dữ Liệu Cá Nhân, Khách Hàng có thể liên hệ với VNPT-Vinaphone để được hỗ trợ.\n8.4.\tQuyền phản đối, hạn chế, rút lại sự đồng ý xử lý dữ liệu\nTrường hợp Khách Hàng không muốn nhận nội dung tiếp thị quảng cáo, khuyến mại từ VNPT-Vinaphone và muốn rút lại sự chấp thuận trước đó (nếu có) và/hoặc phản đối việc tiếp tục sử dụng thông tin cá nhân của mình cho mục đích trên, vui lòng đánh dấu vào ô “Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone” tại thời điểm VNPT-Vinaphone thu thập dữ liệu cá nhân, hoặc gửi từ chối dịch vụ quảng cáo theo cú pháp được hướng dẫn (hoặc cách thức khác theo quy định tại hợp đồng liên quan với Khách Hàng) hoặc liên hệ với VNPT-Vinaphone theo các thông tin được cung cấp tại Chính Sách này. Nếu Khách Hàng không muốn nhận thông báo từ ứng dụng của VNPT-Vinaphone, vui lòng điều chỉnh cài đặt thông báo trong ứng dụng hoặc thiết bị của mình. \n8.5.\tQuyền xóa Dữ Liệu Cá Nhân \nKhách Hàng có quyền yêu cầu VNPT-Vinaphone thực hiện xóa Dữ Liệu Cá Nhân của Khách Hàng với điều kiện là yêu cầu của Khách Hàng phải phù hợp với quy định của pháp luật về cung cấp các sản phẩm, dịch vụ viễn thông và công nghệ thông tin. Tuy nhiên, việc yêu cầu xóa Dữ Liệu Cá Nhân có thể dẫn tới việc VNPT-Vinaphone không thể cung cấp được một số Sản Phẩm, Dịch Vụ Của VNPT-Vinaphone cho Khách Hàng, điều này đồng nghĩa với việc VNPT-Vinaphone có thể đơn phương chấm dứt hợp đồng mà không cần phải bồi thường cho Khách Hàng do các điều kiện để thực hiện hợp đồng đã thay đổi. Do đó, VNPT-Vinaphone khuyến nghị Khách Hàng cân nhắc kĩ lưỡng trước khi yêu cầu VNPT-Vinaphone thực hiện xóa Dữ Liệu Cá Nhân. \n8.6.\tQuyền khiếu nại \nKhách Hàng có quyền khiếu nại trực tiếp với VNPT-Vinaphone hoặc với cơ quan nhà nước có thẩm quyền trong trường hợp Khách Hàng cho rằng VNPT-Vinaphone vi phạm các quy định của pháp luật liên quan tới bảo vệ Dữ Liệu Cá Nhân. \nĐiều 9. \tBẢO VỆ DỮ LIỆU CÁ NHÂN \n9.1.\tNghĩa vụ của VNPT-Vinaphone\nVNPT-Vinaphone nỗ lực đảm bảo Dữ Liệu Cá Nhân của Khách Hàng được bảo vệ khỏi các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân. VNPT-Vinaphone duy trì cam kết bảo mật Dữ Liệu Cá Nhân này bằng cách áp dụng những biện pháp vật lý, điện tử và quản lý để bảo vệ Dữ Liệu Cá Nhân, bao gồm: \n•\tCác máy chủ trang thông tin điện tử chính thức của VNPT-Vinaphone được bảo vệ bởi “bức tường lửa” và hệ thống của VNPT-Vinaphone luôn được kiểm tra để phòng tránh các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân;\n•\tVNPT-Vinaphone sẽ thực hiện tất cả các bước hợp lý để đảm bảo rằng Dữ Liệu Cá Nhân của Khách Hàng, Dữ Liệu Cá Nhân do Đối Tác Kiểm Soát Dữ Liệu Cá Nhân cung cấp không bị lưu giữ lâu hơn mức cần thiết và rằng VNPT-Vinaphone sẽ luôn tuân thủ những yêu cầu của pháp luật liên quan đến việc lưu trữ Dữ Liệu Cá Nhân. \n9.2.\tNghĩa vụ của Khách Hàng \nKhách Hàng có trách nhiệm bảo vệ Dữ Liệu Cá Nhân của mình như sau: \n•\tChủ động thực hiện các biện pháp giúp ngăn chặn việc truy cập trái phép vào mật khẩu, quản lý và sử dụng tài khoản, thiết bị di động của mình (bao gồm nhưng không giới hạn bởi điện thoại thông minh, máy tính, máy tính bảng, laptop) bằng cách đăng xuất tài khoản sau khi sử dụng, đặt một mật khẩu mạnh và khó đoán và giữ bí mật thông tin đăng nhập cũng như mật khẩu của mình. VNPT-Vinaphone được loại trừ trách nhiệm với Khách Hàng trong trường hợp Khách hàng bị lộ/mất, bị đánh cắp hoặc xâm phạm mật khẩu, hoặc bất kỳ hoạt động nào trên tài khoản của Khách Hàng sử dụng mật khẩu trái phép hoặc mất/thất lạc thiết bị di động dẫn đến người không có thẩm quyền tự ý sử dụng dịch vụ hoặc hệ thống bị xâm phạm bất hợp pháp bởi bên thứ ba mặc dù VNPT-Vinaphone đã thực hiện đầy đủ các biện pháp để bảo vệ hệ thống;\n•\tKhách hàng có trách nhiệm cập nhập các văn bản điều chỉnh Chính Sách này (nếu có) trên các kênh thông tin chính thống của VNPT-Vinaphone;\n•\tKhi đã chấp thuận toàn bộ điều khoản và điều kiện của của Chính Sách này, Khách Hàng có trách nhiệm cung cấp Dữ Liệu Cá Nhân chính xác, đầy đủ theo yêu cầu của VNPT-Vinaphone và thực hiện các trách nhiệm thông báo cho VNPT-Vinaphone ngay khi phát hiện có hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá nhân. Khách Hàng có thể chủ động cung cấp Dữ Liệu Cá Nhân nằm ngoài yêu cầu của VNPT-Vinaphone với điều kiện Khách Hàng phải tuân thủ quy định tại Điều 2.4 Chính Sách này;\n•\tKhách Hàng có trách nhiệm tôn trọng Dữ Liệu Cá Nhân của chủ thể khác và thực hiện quy định của pháp luật về bảo vệ Dữ Liệu Cá Nhân, tham gia phòng, chống các hành vi vi phạm quy định về bảo vệ Dữ Liệu Cá Nhân.\nĐiều 10. \tHẬU QUẢ, THIỆT HẠI KHÔNG MONG MUỐN CÓ KHẢ NĂNG XẢY RA\n10.1.\tVNPT-Vinaphone sử dụng nhiều công nghệ bảo mật thông tin khác nhau nhằm bảo vệ Dữ Liệu Cá Nhân của Khách Hàng không bị truy lục, sử dụng hoặc chia sẻ ngoài ý muốn. Tuy nhiên, không một dữ liệu nào có thể được bảo mật 100%. Do vậy, VNPT-Vinaphone cam kết sẽ bảo mật một cách tối đa Dữ Liệu Cá Nhân của Khách Hàng. Một số hậu quả, thiệt hại không mong muốn có thể xảy ra bao gồm nhưng không giới hạn: \n•\tLỗi phần cứng, phần mềm trong quá trình xử lý Dữ Liệu Cá Nhân làm mất Dữ Liệu Cá Nhân của Khách Hàng; \n•\tLỗ hổng bảo mật nằm ngoài khả năng kiểm soát của VNPT-Vinaphone, hệ thống bị hacker tấn công gây lộ lọt Dữ Liệu Cá Nhân của Khách Hàng; \n•\tKhách Hàng tự làm lộ lọt Dữ Liệu Cá Nhân của Khách Hàng do: bất cẩn hoặc bị lừa đảo; truy cập các website/tải các ứng dụng có chứa phần mềm độc hại.\n10.2.\tVNPT-Vinaphone khuyến cáo Khách Hàng thực hiện nghiêm ngặt các trách nhiệm bảo vệ Dữ Liệu Cá Nhân theo quy định tại Điều 9.2 Chính Sách này và theo quy định của pháp luật. \n10.3.\tTrong trường hợp máy chủ lưu trữ dữ liệu bị hacker tấn công dẫn đến mất mát Dữ Liệu Cá Nhân của Khách Hàng, VNPT-Vinaphone sẽ có trách nhiệm thông báo vụ việc cho cơ quan chức năng điều tra xử lý kịp thời và thông báo cho Khách Hàng được biết. \nĐiều 11. \tSỬ DỤNG COOKIES \n11.1.\tCookies có thể được sử dụng trên website của VNPT-Vinaphone. “Cookies” là các tệp văn bản nhỏ được lưu trên ổ cứng máy tính của Khách Hàng nhằm giúp tùy biến trải nghiệm website cho người dùng. VNPT-Vinaphone có chính sách sử dụng cookies nhằm khiến việc điều hướng trang web dễ dàng hơn và tạo điều kiện thuận lợi cho quá trình đăng nhập. Dữ liệu thống kê trang web được xử lý bởi các bên thứ ba, và do đó, địa chỉ IP của Khách Hàng sẽ được chuyển tới bên thứ ba chỉ với mục đích báo cáo thống kê.\n11.2.\tKhi VNPT-Vinaphone thu thập thông tin qua trang web của VNPT-Vinaphone, VNPT-Vinaphone tự động thu thập những thông tin không mang tính cá nhân liên quan tới việc sử dụng trang web nhưng không xác định danh tính người dùng bao gồm nhưng kh¬ông giới hạn như: địa chỉ IP của máy tính cá nhân, địa chỉ IP của nhà cung cấp dịch vụ Internet, ngày giờ truy cập trang web, hệ điều hành, các mục đã truy cập trên trang web, nội dung tải về từ trang web và địa chỉ trang web đã trực tiếp dẫn quý khách tới trang web của VNPT-Vinaphone. VNPT-Vinaphone có thể dùng những thông tin không mang tính cá nhân này để phục vụ cho những báo cáo thống kê về lưu lượng người truy cập trang web và hành vi sử dụng trang web. Các thông tin phân tích này đều không có khả năng xác định danh tính của Khách Hàng.\n11.3.\tTrường hợp Khách hàng không muốn sử dụng cookies, đa số các trình duyệt web đều cho phép người dùng từ chối cookies bằng cách thay đổi cài đặt riêng tư trên trình duyệt. Việc từ chối cookies hầu như không gây ảnh hưởng tới việc điều hướng trang web. Tuy nhiên một số chức năng của trang web có thể bị ảnh hưởng. Sau khi hoàn thành việc truy cập trang web, Khách Hàng vẫn có thể xóa cookies khỏi hệ thống nếu muốn.\nĐiều 12. \tQUẢNG CÁO TRÊN INTERNET VÀ BÊN THỨ BA\nCác ứng dụng/website của VNPT-Vinaphone có thể bao gồm quảng cáo của bên thứ ba và liên kết tới các trang website và ứng dụng khác. Các đối tác quảng cáo bên thứ ba có thể thu thập thông tin về Khách Hàng khi Khách Hàng tương tác với nội dung, quảng cáo hoặc dịch vụ của họ. Mọi quyền truy cập và sử dụng các liên kết hoặc trang website của bên thứ ba không bị điều chỉnh bởi Chính Sách này, mà thay vào đó được điều chỉnh bởi chính sách quyền riêng tư của các bên thứ ba đó. VNPT-Vinaphone không chịu trách nhiệm về các quy định về thông tin của các bên thứ ba. \nĐiều 13. \tXỬ LÝ DỮ LIỆU CÁ NHÂN KHÔNG CẦN SỰ ĐỒNG Ý CỦA CHỦ THỂ DỮ LIỆU\nVNPT-Vinaphone có thể tiến hành xử lý Dữ Liệu Cá Nhân mà không cần sự đồng ý của Chủ Thể Dữ Liệu trong các trường hợp sau: \n13.1.\tTrong trường hợp khẩn cấp, cần xử lý ngay Dữ Liệu Cá Nhân có liên quan để bảo vệ tính mạng, sức khỏe của chủ thể dữ liệu hoặc người khác;\n13.2.\tViệc công khai dữ liệu cá nhân theo quy định của luật;\n13.3.\tViệc xử lý dữ liệu của cơ quan nhà nước có thẩm quyền trong trường hợp tình trạng khẩn cấp về quốc phòng, an ninh quốc gia, trật tự an toàn xã hội, thảm họa lớn, dịch bệnh nguy hiểm; khi có nguy cơ đe dọa an ninh, quốc phòng nhưng chưa đến mức ban bố tình trạng khẩn cấp; phòng, chống bạo loạn, khủng bố, phòng, chống tội phạm và vi phạm pháp luật theo quy định của luật;\n13.4.\tĐể thực hiện nghĩa vụ theo hợp đồng của chủ thể dữ liệu với cơ quan, tổ chức, cá nhân có liên quan theo quy định của luật;\n13.5.\tPhục vụ hoạt động của cơ quan nhà nước đã được quy định theo luật chuyên ngành.\nĐiều 14. \tTHÔNG TIN LIÊN LẠC\nTrường hợp Khách Hàng có bất kỳ câu hỏi nào về Chính Sách này hoặc muốn thực hiện các quyền của Khách Hàng liên quan tới Dữ Liệu Cá Nhân, vui lòng liên hệ với VNPT-Vinaphone theo các phương thức và thông tin dưới đây: \n•\tLiên hệ tới tổng đài theo thông tin tại các website/ứng dụng chính thức của VNPT-Vinaphone tại từng thời điểm. \n•\tGửi công văn tới trụ sở chính của VNPT-Vinaphone tại Toà nhà Vinaphone, đường Xuân Tảo, Phường Xuân La, Quận Tây Hồ, Hà Nội.\n•\tLiên hệ trực tiếp tại các điểm giao dịch của VNPT-Vinaphone trên phạm vi toàn quốc. \n•\tCác cách thức liên hệ khác như Livechat, liên hệ qua fanpage chính thức của VNPT-Vinaphone, email chăm sóc khách hàng được cung cấp cho khách hàng tại mọi thời điểm. \nĐiều 15. \tĐIỀU CHỈNH VÀ SỬA ĐỔI\nVNPT-Vinaphone có thể điều chỉnh Chính Sách này vào bất kỳ thời điểm nào đồng thời đăng tải công khai Chính Sách được điều chỉnh trên các kênh thông tin chính thống của VNPT-Vinaphone. Việc Khách Hàng tiếp tục sử dụng Sản Phẩm, Dịch vụ Của VNPT-Vinaphone và không có bất kì khiếu nại nào đối với Chính Sách được điều chỉnh được hiểu rằng Khách Hàng đã chấp thuận Chính Sách được điều chỉnh đó của VNPT-Vinaphone.\n"),
        "gender": MessageLookupByLibrary.simpleMessage("Giới tính"),
        "generateCerKey":
            MessageLookupByLibrary.simpleMessage("Khởi tạo cặp khóa"),
        "getAdvice": MessageLookupByLibrary.simpleMessage("Nhận tư vấn"),
        "getAuthenticationFailed": MessageLookupByLibrary.simpleMessage(
            "Lấy thông tin đăng nhập thất bại."),
        "gettingCert": MessageLookupByLibrary.simpleMessage(
            "Đang lấy thông tin chứng thư..."),
        "giao_dich": MessageLookupByLibrary.simpleMessage("giao dịch"),
        "goHome": MessageLookupByLibrary.simpleMessage("Về trang chính"),
        "goHomeTC": MessageLookupByLibrary.simpleMessage("Về trang chủ"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Đi tới Cài đặt"),
        "handlingInstructions":
            MessageLookupByLibrary.simpleMessage("Xem hướng dẫn xử lý"),
        "hashSign": MessageLookupByLibrary.simpleMessage("Ký hash"),
        "hashTranTypeDesc": MessageLookupByLibrary.simpleMessage("Ký hash"),
        "haveNotYetTransaction":
            MessageLookupByLibrary.simpleMessage("Chưa có giao dịch"),
        "here": MessageLookupByLibrary.simpleMessage("tại đây"),
        "hideCTSInListScreen": MessageLookupByLibrary.simpleMessage(
            "Ẩn chứng thư số khỏi màn hình danh sách"),
        "hien_thi_text_hinh_nen": MessageLookupByLibrary.simpleMessage(
            "5. Hiển thị text và hình nền"),
        "hien_thi_text_logo_ben_trai": MessageLookupByLibrary.simpleMessage(
            "2. Hiển thị text và logo bên trái"),
        "hien_thi_text_logo_ben_trai_chu": MessageLookupByLibrary.simpleMessage(
            "6. Hiển thị text, logo bên trái và chữ ký"),
        "hien_thi_text_logo_tren": MessageLookupByLibrary.simpleMessage(
            "4. Hiển thị text và logo phía trên"),
        "hinh_nen": MessageLookupByLibrary.simpleMessage("Hình nền"),
        "history": MessageLookupByLibrary.simpleMessage("Lịch sử"),
        "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "hotline": MessageLookupByLibrary.simpleMessage("Hotline"),
        "huy_tat_ca": MessageLookupByLibrary.simpleMessage("Hủy tất cả"),
        "iAgreeTerms": MessageLookupByLibrary.simpleMessage(
            "Tôi đồng ý với các điều khoản chính sách bảo vệ dữ liệu cá nhân của VNPT Vinaphone "),
        "iAgreeWith": MessageLookupByLibrary.simpleMessage("Tôi đồng ý với "),
        "iDontWantReceive": MessageLookupByLibrary.simpleMessage(
            "Tôi không muốn nhận bất kỳ liên lạc hoặc thông báo nào với mục đích quảng cáo, tiếp thị từ VNPT-Vinaphone."),
        "iOSLockOut": MessageLookupByLibrary.simpleMessage(
            "Xác thực sinh trắc học bị vô hiệu hóa. Vui lòng Khóa và Mở khóa màn hình của bạn."),
        "iReadAndAgree": MessageLookupByLibrary.simpleMessage(
            "Tôi đã đọc và chấp thuận Chính sách bảo vệ dữ liệu cá nhân của VNPT-Vinaphone."),
        "iUnderstand": MessageLookupByLibrary.simpleMessage("Tôi đã hiểu"),
        "idEkyc": MessageLookupByLibrary.simpleMessage(
            "Giấy CMND/Thẻ CCCD bản gốc, còn hiệu lực, không scan/photocopy"),
        "idNumber": MessageLookupByLibrary.simpleMessage("Số giấy tờ"),
        "idRepreEkyc": MessageLookupByLibrary.simpleMessage(
            "Giấy CMND / Thẻ CCCD bản gốc, còn hiệu lực của Người đại diện pháp luật"),
        "identification": MessageLookupByLibrary.simpleMessage("CCCD/CMND"),
        "identificationCardType":
            MessageLookupByLibrary.simpleMessage("Loại giấy tờ chứng thực"),
        "identificationNumber":
            MessageLookupByLibrary.simpleMessage("Số CMND/CCCD"),
        "idleLoading":
            MessageLookupByLibrary.simpleMessage("Kéo lên để tải thêm"),
        "ifDeletePleaseMake": m10,
        "importantInfo":
            MessageLookupByLibrary.simpleMessage("Họ tên, Số CMND/CCCD"),
        "inProgress": MessageLookupByLibrary.simpleMessage("Đang xử lý"),
        "included10VAT":
            MessageLookupByLibrary.simpleMessage("Đã bao gồm 10% VAT"),
        "individualBusinessHouseholds":
            MessageLookupByLibrary.simpleMessage("Hộ kinh doanh cá thể"),
        "individualsUnderBusinessOrganizations":
            MessageLookupByLibrary.simpleMessage(
                "Cá nhân thuộc Tổ chức\nDoanh nghiệp"),
        "infoBuySignature":
            MessageLookupByLibrary.simpleMessage("Thông tin mua gói lượt ký"),
        "informationOnRegistrationOfDigitalCertificates":
            MessageLookupByLibrary.simpleMessage(
                "Thông tin đăng ký chứng thư số"),
        "informationRegistration":
            MessageLookupByLibrary.simpleMessage("Thông tin đăng ký"),
        "information_buy_packages":
            MessageLookupByLibrary.simpleMessage("Thông tin mua gói lượt ký"),
        "initialTime":
            MessageLookupByLibrary.simpleMessage("Thời gian khởi tạo"),
        "initializePIN":
            MessageLookupByLibrary.simpleMessage("Khởi tạo mã PIN"),
        "initializePINTitle": MessageLookupByLibrary.simpleMessage(
            "Mã PIN cá nhân được sử dụng để bảo vệ chữ ký số của bạn."),
        "initializingKeyPair":
            MessageLookupByLibrary.simpleMessage("Đang khởi tạo cặp khoá"),
        "initializingKeyPairDescription": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang khởi tạo cặp khóa.\nVui lòng đợi trong giây lát..."),
        "initializingTheService":
            MessageLookupByLibrary.simpleMessage("Đang khởi tạo dịch vụ"),
        "inputNameDoc":
            MessageLookupByLibrary.simpleMessage("Nhập tên văn bản"),
        "inputOTP": MessageLookupByLibrary.simpleMessage("Nhập mã xác thực"),
        "inputOTPTitle": MessageLookupByLibrary.simpleMessage(
            "Mã xác thực đã được gửi về\nsố điện thoại"),
        "inputOTPVerify":
            MessageLookupByLibrary.simpleMessage("Nhập OTP để xác thực"),
        "inputReferralCode":
            MessageLookupByLibrary.simpleMessage("Nhập mã giới thiệu"),
        "inputRequired": m11,
        "introEkycTitle": MessageLookupByLibrary.simpleMessage(
            "Tài khoản của Quý khách cần xác minh thông tin đăng ký, vui lòng chuẩn bị:"),
        "introPinCode": MessageLookupByLibrary.simpleMessage(
            "Mã PIN sử dụng xác thực giao dịch ký số và bảo vệ cặp khóa chứng thư số của bạn!"),
        "invalidPIN":
            MessageLookupByLibrary.simpleMessage("Mã PIN không hợp lệ."),
        "invalidParameter":
            MessageLookupByLibrary.simpleMessage("Tham số không đúng."),
        "invalidToken":
            MessageLookupByLibrary.simpleMessage("Token không hợp lệ."),
        "invoiceInformation":
            MessageLookupByLibrary.simpleMessage("Thông tin xuất hoá đơn"),
        "issueDate": MessageLookupByLibrary.simpleMessage("Ngày cấp"),
        "issuer": MessageLookupByLibrary.simpleMessage("Nhà phát hành"),
        "keyCerEmpty": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số không tồn tại đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ"),
        "keyCerExpired": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số đã hết hạn đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ"),
        "keyCerRevoked": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số đã thu hồi đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ"),
        "keyCerSuspended": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số đang tạm dừng đề nghị bạn liên hệ với tổng đài 18001260 để được tư vẫn hỗ trợ"),
        "kieu_hien_thi": MessageLookupByLibrary.simpleMessage("Kiểu hiển thị"),
        "ky_boi": MessageLookupByLibrary.simpleMessage("Ký bởi"),
        "ky_nang_cao": MessageLookupByLibrary.simpleMessage("Ký nâng cao"),
        "ky_tat_ca": MessageLookupByLibrary.simpleMessage("Ký tất cả"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "linkSystem": MessageLookupByLibrary.simpleMessage("Hệ thống liên kết"),
        "link_view_service_pack_order_history_page":
            MessageLookupByLibrary.simpleMessage("Xem lịch sử mua gói lượt ký"),
        "linking": MessageLookupByLibrary.simpleMessage("Đang liên kết"),
        "listFileEmpty":
            MessageLookupByLibrary.simpleMessage("Không có file để xem trước"),
        "listLinkSystem":
            MessageLookupByLibrary.simpleMessage("Danh sách hệ thống liên kết"),
        "listOfDocumentToBeSigned":
            MessageLookupByLibrary.simpleMessage("Danh sách tài liệu cần ký"),
        "listPacks": m12,
        "listTransactions":
            MessageLookupByLibrary.simpleMessage("Giao dịch chờ Ký"),
        "list_document_sign_empty": MessageLookupByLibrary.simpleMessage(
            "Không có thông tin giao dịch ký"),
        "list_document_sign_limited": MessageLookupByLibrary.simpleMessage(
            "Mỗi giao dịch ký số chỉ thực hiện tối đa 10 file"),
        "listsigned": MessageLookupByLibrary.simpleMessage("Danh sách đã ký"),
        "loading": MessageLookupByLibrary.simpleMessage("Đang tải..."),
        "loadingCert": MessageLookupByLibrary.simpleMessage(
            "Đang lấy thông tin chứng thư"),
        "loginDetailIntro": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể chuyển đổi và sử dụng nhiều tài khoản trên một thiết bị"),
        "loginIntro": MessageLookupByLibrary.simpleMessage(
            "Đăng nhập nhiều tài khoản trên một thiết bị"),
        "luot": MessageLookupByLibrary.simpleMessage("lượt"),
        "makePaymentAgain":
            MessageLookupByLibrary.simpleMessage("Thực hiện lại thanh toán"),
        "male": MessageLookupByLibrary.simpleMessage("Nam"),
        "maxLength": m13,
        "maxSizeUpload":
            MessageLookupByLibrary.simpleMessage("Kích thước tối đa: 15MB"),
        "maybeLater": MessageLookupByLibrary.simpleMessage("Để sau"),
        "minLength": m14,
        "missingCorner":
            MessageLookupByLibrary.simpleMessage("Không chụp mất góc"),
        "money": MessageLookupByLibrary.simpleMessage("Thành tiền"),
        "month_text": MessageLookupByLibrary.simpleMessage("Tháng"),
        "msgAccountActived": m15,
        "msgAccountNotFound": m16,
        "nameBusiness": MessageLookupByLibrary.simpleMessage(
            "Tên Cơ quan/Tổ chức/Doanh nghiệp"),
        "nameBusinessPersonal":
            MessageLookupByLibrary.simpleMessage("Tên Cơ quan/Tổ chức/Cá nhân"),
        "nameContact":
            MessageLookupByLibrary.simpleMessage("Họ tên người liên hệ"),
        "nameDoc": MessageLookupByLibrary.simpleMessage("Tên văn bản"),
        "nameFor": MessageLookupByLibrary.simpleMessage("Đặt tên"),
        "nameForCTS":
            MessageLookupByLibrary.simpleMessage("Đặt tên chứng thư số"),
        "nationality": MessageLookupByLibrary.simpleMessage("Quốc tịch"),
        "newCertOrder":
            MessageLookupByLibrary.simpleMessage("Cấp mới chứng thư số"),
        "newFeatures": MessageLookupByLibrary.simpleMessage("Tính năng mới"),
        "newImplement": MessageLookupByLibrary.simpleMessage("Thực hiện mới"),
        "newPassIsEmpty": MessageLookupByLibrary.simpleMessage(
            "Trường mật khẩu mới không được để trống"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu mới"),
        "newRegistration": MessageLookupByLibrary.simpleMessage("Đăng ký mới"),
        "next": MessageLookupByLibrary.simpleMessage("Tiếp theo"),
        "nextAssignKey": MessageLookupByLibrary.simpleMessage(
            "Tiếp theo: Kích hoạt cặp khóa"),
        "nextSignBbnt": MessageLookupByLibrary.simpleMessage(
            "Tiếp theo: Ký biên bản nghiệm thu"),
        "nextStepPin":
            MessageLookupByLibrary.simpleMessage("Tiếp theo: Tạo mã PIN"),
        "ngay_ky": MessageLookupByLibrary.simpleMessage("Ngày ký"),
        "nha_noi_dung_chu_ky":
            MessageLookupByLibrary.simpleMessage("Nhập nội dung"),
        "nhap_ten": MessageLookupByLibrary.simpleMessage("Nhập tên"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Chưa có tài khoản"),
        "noInternet":
            MessageLookupByLibrary.simpleMessage("Không có kết nối mạng."),
        "noStep": m17,
        "noSystemsLinkYet": MessageLookupByLibrary.simpleMessage(
            "Chưa có hệ thống nào được liên kết.\nVui lòng thực hiện theo hướng dẫn "),
        "no_exist_cert_valid": MessageLookupByLibrary.simpleMessage(
            "Không có chứng thư số đang hoạt động"),
        "notAuthenticated": MessageLookupByLibrary.simpleMessage(
            "Chưa xác thực đăng nhập tài khoản."),
        "notFoundUid": MessageLookupByLibrary.simpleMessage(
            "Không tìm thấy thông tin người dùng"),
        "notPhysicalDevice": MessageLookupByLibrary.simpleMessage(
            "Bạn đang chạy ứng dụng trên thiết bị ảo. Vui lòng cài đặt ứng dụng trên thiết bị thật."),
        "notSecureDevice": MessageLookupByLibrary.simpleMessage(
            "Thiết bị của bạn không đủ an toàn để khởi chạy ứng dụng."),
        "notSupportBiometrics": MessageLookupByLibrary.simpleMessage(
            "Thiết bị không hỗ trợ sinh trắc học"),
        "notSupportExt": MessageLookupByLibrary.simpleMessage(
            "Hiện tại ứng dụng chưa hỗ trợ xem trước định dạng "),
        "notSupportViewFile": MessageLookupByLibrary.simpleMessage(
            "Tài liệu Hết hạn/Hủy xác nhận không được hỗ trợ xem lại"),
        "notUseeSeal": MessageLookupByLibrary.simpleMessage(
            "Tài khoản không có Chứng thư số sử dụng gói Tích hợp."),
        "not_info_change": MessageLookupByLibrary.simpleMessage(
            "Vui lòng thay đổi thông tin địa chỉ!"),
        "noteEkyc":
            MessageLookupByLibrary.simpleMessage("Lưu ý chụp ảnh giấy tờ:"),
        "noteIdentifier": MessageLookupByLibrary.simpleMessage(
            "Lưu ý: Số giấy tờ này sử dụng làm Tên đăng nhập!"),
        "noteInformationAddress": MessageLookupByLibrary.simpleMessage(
            "Lưu ý: Thông tin địa chỉ sẽ hiển thị trên chứng thư số. Trường hợp thay đổi vui lòng chọn lại"),
        "notePhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Lưu ý: Số điện thoại này sử dụng để nhận mã xác thực giao dịch!"),
        "noticeOfInvoice":
            MessageLookupByLibrary.simpleMessage("Thông tin xuất hóa đơn"),
        "noticeWhenPasswordChange": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu đã thay đổi. Vui lòng đăng nhập lại."),
        "notice_cert_action_for_business_account": m18,
        "notice_support_business_customer_change_info":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ Thay đổi thông tin chứng thư số cho Doanh nghiệp"),
        "notifActiveCerOtherDevice": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số không được đăng ký trên thiết bị này. Vui lòng sử dụng thiết bị đã đăng ký để tiếp tục kích hoạt chứng thư số. Trường hợp mất hoặc đổi thiết bị, click Xác nhận để kích hoạt chứng thư số trên thiết bị mới!"),
        "notify_extend_personal_sign_success":
            MessageLookupByLibrary.simpleMessage(
                "Khởi tạo gói lượt ký thành công!"),
        "numberOfSignatures":
            MessageLookupByLibrary.simpleMessage("Số lượt ký"),
        "numberOfUnusedTurns":
            MessageLookupByLibrary.simpleMessage("Số lượt ký chưa sử dụng"),
        "numberWaitingActiveCer": m19,
        "oldPassIsEmpty": MessageLookupByLibrary.simpleMessage(
            " Trường mật khẩu cũ không được để trống"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu cũ"),
        "oldPasswordWrong":
            MessageLookupByLibrary.simpleMessage("Sai mật khẩu cũ."),
        "orSelectScanQRCodeToAutomaticallyEnterInformation":
            MessageLookupByLibrary.simpleMessage(
                "Hoặc chọn Quét mã QR để tự động nhập thông tin!"),
        "orderAPPROVE_REQUEST_CERT_ERROR": MessageLookupByLibrary.simpleMessage(
            "Duyệt yêu cầu không thành công"),
        "orderAPPROVE_REQUEST_CERT_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ duyệt cấp chứng thư số"),
        "orderCANCELED": MessageLookupByLibrary.simpleMessage("Đã hủy"),
        "orderCONTRACT_CREATE_ERROR": MessageLookupByLibrary.simpleMessage(
            "Tạo hợp đồng không thành công"),
        "orderCONTRACT_CREATE_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ sinh hợp đồng"),
        "orderCONTRACT_SIGN_ERROR": MessageLookupByLibrary.simpleMessage(
            "Ký hợp đồng không thành công"),
        "orderCONTRACT_SIGN_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ ký hợp đồng"),
        "orderCode": MessageLookupByLibrary.simpleMessage("Mã đơn hàng"),
        "orderDONE": MessageLookupByLibrary.simpleMessage("Hoàn thành"),
        "orderDate": MessageLookupByLibrary.simpleMessage("Ngày tạo"),
        "orderDetailCert":
            MessageLookupByLibrary.simpleMessage("Thông tin gói chứng thư số"),
        "orderEKYC_ERROR": MessageLookupByLibrary.simpleMessage(
            "Xác thực eKYC không thành công"),
        "orderEKYC_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ xác thực eKYC"),
        "orderKEY_ASSIGN_ERROR": MessageLookupByLibrary.simpleMessage(
            "Khởi tạo cặp khóa không thành công"),
        "orderKEY_ASSIGN_WATING":
            MessageLookupByLibrary.simpleMessage("Chờ khởi tạo cặp khóa"),
        "orderList": MessageLookupByLibrary.simpleMessage("Danh sách đơn hàng"),
        "orderNoteContent": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên hệ Tổng đài (18001260) nhánh 1 nếu đơn hàng ở các trạng thái:"),
        "orderNoteContentState1": MessageLookupByLibrary.simpleMessage(
            "Tạo hợp đồng không thành công."),
        "orderNoteContentState2": MessageLookupByLibrary.simpleMessage(
            "Ký hợp đồng không thành công."),
        "orderNoteContentState3": MessageLookupByLibrary.simpleMessage(
            "Tạo yêu cầu không thành công."),
        "orderNoteContentState4": MessageLookupByLibrary.simpleMessage(
            "Đồng bộ hồ sơ không thành công."),
        "orderONEBSS_SUBMIT_ERROR": MessageLookupByLibrary.simpleMessage(
            "Đồng bộ hồ sơ không thành công"),
        "orderONEBSS_SUBMIT_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ submit sang OneBSS"),
        "orderOTP_ERROR": MessageLookupByLibrary.simpleMessage(
            "Xác thực OTP không thành công"),
        "orderOTP_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ xác thực bằng OTP"),
        "orderPAYMENT_ERROR":
            MessageLookupByLibrary.simpleMessage("Thanh toán không thành công"),
        "orderPAYMENT_WAITING":
            MessageLookupByLibrary.simpleMessage("Chờ thanh toán online"),
        "orderREJECT_REQUEST_CERT":
            MessageLookupByLibrary.simpleMessage("Từ chối yêu cầu"),
        "orderREQUESTCERT_ERROR": MessageLookupByLibrary.simpleMessage(
            "Tạo yêu cầu gia hạn không thành công"),
        "orderREQUESTCERT_WATING": MessageLookupByLibrary.simpleMessage(
            "Chờ sinh yêu cầu tạo chứng thư số"),
        "order_canceled": MessageLookupByLibrary.simpleMessage("Đã hủy"),
        "order_free": MessageLookupByLibrary.simpleMessage("Miễn phí"),
        "order_history_page_title":
            MessageLookupByLibrary.simpleMessage("Lịch sử mua gói lượt ký"),
        "order_new": MessageLookupByLibrary.simpleMessage("Chờ khởi tạo"),
        "order_paid": MessageLookupByLibrary.simpleMessage("Chờ khởi tạo"),
        "order_success": MessageLookupByLibrary.simpleMessage("Mua thành công"),
        "other": MessageLookupByLibrary.simpleMessage("Khác"),
        "otpExpiredTime":
            MessageLookupByLibrary.simpleMessage("Mã xác thực sẽ hết hạn sau"),
        "otpSendToPhone": MessageLookupByLibrary.simpleMessage(
            "OTP đã được gửi về số điện thoại"),
        "package": MessageLookupByLibrary.simpleMessage("Gói"),
        "package_information":
            MessageLookupByLibrary.simpleMessage("Thông tin gói cước"),
        "page_servive_pack_order_desc": MessageLookupByLibrary.simpleMessage(
            "Quý khách mua gói lượt ký thành công."),
        "page_servive_pack_order_title":
            MessageLookupByLibrary.simpleMessage("Thanh toán đơn hàng"),
        "partnerNotRegister": MessageLookupByLibrary.simpleMessage(
            "Tài khoản của bạn chưa có trên hệ thống. Vui lòng đăng ký tích hợp để sử dụng SDK."),
        "passport": MessageLookupByLibrary.simpleMessage("Hộ chiếu"),
        "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "passwordDuplicate": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu mới trùng với mật khẩu cũ."),
        "passwordNotMatch":
            MessageLookupByLibrary.simpleMessage("Mật khẩu không khớp"),
        "pause": MessageLookupByLibrary.simpleMessage("Tạm dừng"),
        "pay": MessageLookupByLibrary.simpleMessage("Thanh toán"),
        "paymentDone": MessageLookupByLibrary.simpleMessage("Đã thanh toán"),
        "paymentFailed":
            MessageLookupByLibrary.simpleMessage("Thanh toán thất bại"),
        "paymentSuccess":
            MessageLookupByLibrary.simpleMessage("Thanh toán thành công"),
        "paymentWaiting":
            MessageLookupByLibrary.simpleMessage("Chưa thanh toán"),
        "personal": MessageLookupByLibrary.simpleMessage("Cá nhân"),
        "personalDataProtectionPolicy": MessageLookupByLibrary.simpleMessage(
            "Chính sách bảo vệ dữ liệu cá nhân"),
        "personalInBusiness":
            MessageLookupByLibrary.simpleMessage("Cá nhân trong doanh nghiệp"),
        "phone": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "phoneContact":
            MessageLookupByLibrary.simpleMessage("Số điện thoại liên hệ"),
        "phoneNumberIncorrect": MessageLookupByLibrary.simpleMessage(
            "Số điện thoại không chính xác"),
        "phoneNumberVerification":
            MessageLookupByLibrary.simpleMessage("Xác thực số điện thoại"),
        "pinCode": MessageLookupByLibrary.simpleMessage("Mã PIN"),
        "pinCodeJustInclude": MessageLookupByLibrary.simpleMessage(
            "Mã PIN chỉ bao gồm ký tự số, không bao gồm khoảng trắng và ký tự chữ, ký tự đặc biệt."),
        "pinCodeNotInclude": MessageLookupByLibrary.simpleMessage(
            "Mã PIN không bao gồm các số liên tiếp nhau hoặc các số trùng nhau."),
        "pinDialogButton": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "pinDialogConfirmCancel": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập mã PIN để hủy giao dịch"),
        "pinDialogConfirmSignDigitalTitle":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập mã PIN"),
        "pinDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Nhập mã PIN để kích hoạt cặp khoá ký số"),
        "pinValidateNotMatch":
            MessageLookupByLibrary.simpleMessage("Mã PIN không khớp"),
        "pinValidateSequence": MessageLookupByLibrary.simpleMessage(
            "Mã PIN không được là dãy số liên tiếp."),
        "pinValidateSixDigit": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập mã PIN gồm 6 số."),
        "pinValidateTheSame": MessageLookupByLibrary.simpleMessage(
            "Mã PIN không được chứa dãy số giống nhau."),
        "placeOfIssue": MessageLookupByLibrary.simpleMessage("Nơi cấp"),
        "pleaseAddYourSignature":
            MessageLookupByLibrary.simpleMessage("Hãy bổ sung chữ ký của bạn"),
        "pleaseCheckTheCorrectInformation":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng kiểm tra chính xác các thông tin: "),
        "pleaseChooseDateValid": MessageLookupByLibrary.simpleMessage(
            "Ngày bắt đầu phải sớm hơn ngày kết thúc!"),
        "pleaseChooseEndDate": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn ngày kết thúc!"),
        "pleaseChooseRegisterCert": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn đăng ký chứng thư số để sử dụng dịch vụ ký số từ xa VNPT SmartCA"),
        "pleaseChooseStartDate":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn ngày bắt đầu!"),
        "pleaseDrawSign":
            MessageLookupByLibrary.simpleMessage("Vui lòng vẽ Chữ ký của bạn"),
        "pleaseMakePaymentAgain": MessageLookupByLibrary.simpleMessage(
            "Quý khách vui lòng thực hiện lại thanh toán.\nXin cảm ơn!"),
        "pleaseSelectDataInList": MessageLookupByLibrary.simpleMessage(
            "Vui lòng chọn dữ liệu từ danh sách"),
        "pleaseTryAgainInAFewMinutes": MessageLookupByLibrary.simpleMessage(
            "Vui lòng thử lại sau ít phút"),
        "pleaseUserTheOfficialEmailAndPhoneNumber":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng sử dụng thông tin email và số điện thoại chính chủ để bảo mật thông tin dịch vụ!"),
        "please_choose_email_phone_other": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập số điện thoại hoặc email khác!"),
        "please_input_different_name": MessageLookupByLibrary.simpleMessage(
            "Họ tên mới không được trùng với họ tên cũ."),
        "please_input_full_name":
            MessageLookupByLibrary.simpleMessage("Vui lòng nhập họ tên."),
        "prepareFullDocument": MessageLookupByLibrary.simpleMessage(
            "Quý khách vui lòng chuẩn bị đầy đủ giấy tờ trước khi bắt đầu!"),
        "price": MessageLookupByLibrary.simpleMessage("Đơn giá"),
        "processingGenKey": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang khởi tạo cặp khóa.\nVui lòng đợi trong giây lát..."),
        "processingPackageSignature": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang khởi tạo dịch vụ gói lượt ký.\nVui lòng đợi thêm giây lát!"),
        "processingRequest":
            MessageLookupByLibrary.simpleMessage("Đang xử lý yêu cầu"),
        "processingRequestChangeDevice": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang xử lý yêu cầu thay đổi thiết bị. \nVui lòng đợi trong giây lát..."),
        "processingRequestDescription": MessageLookupByLibrary.simpleMessage(
            "Đơn hàng của bạn đang được xử lý.\nVui lòng đợi trong giây lát..."),
        "product_money": MessageLookupByLibrary.simpleMessage("Thành tiền:"),
        "product_name": MessageLookupByLibrary.simpleMessage("Tên gói:"),
        "product_price": MessageLookupByLibrary.simpleMessage("Đơn giá:"),
        "product_quantity": MessageLookupByLibrary.simpleMessage("Số lượng:"),
        "progressProcessing": MessageLookupByLibrary.simpleMessage(
            "Đang xử lý, vui lòng đợi trong giây lát..."),
        "province": MessageLookupByLibrary.simpleMessage("Tỉnh/TP"),
        "provinceCity": MessageLookupByLibrary.simpleMessage("Tỉnh/Thành phố"),
        "qrCodeInvalid":
            MessageLookupByLibrary.simpleMessage("Mã QR không hợp lệ"),
        "qrCodeInvalidDescription": MessageLookupByLibrary.simpleMessage(
            "Vui lòng sử dụng mã QR trên Căn cước công dân để lấy thông tin!"),
        "qrCodeIsRegistered": m20,
        "qrCodeIsWaitingActive": m21,
        "quantity": MessageLookupByLibrary.simpleMessage("Số lượng"),
        "reEnterNewPassword":
            MessageLookupByLibrary.simpleMessage("Nhập lại mật khẩu mới"),
        "reEnterNewPasswordNotCorrect": MessageLookupByLibrary.simpleMessage(
            "Nhập lại mật khẩu mới chưa chính xác"),
        "reEnterPassword":
            MessageLookupByLibrary.simpleMessage("Nhập lại mật khẩu"),
        "rePinValidateSixDigit": MessageLookupByLibrary.simpleMessage(
            "Vui lòng nhập xác nhận mã PIN gồm 6 số."),
        "re_create_service_order":
            MessageLookupByLibrary.simpleMessage("Khởi tạo lại gói lượt ký"),
        "reactivateAccount":
            MessageLookupByLibrary.simpleMessage("Kích hoạt lại tài khoản?"),
        "reactivation_notified": MessageLookupByLibrary.simpleMessage(
            "Sử dụng kích hoạt lại tài khoản khi:\n - Tài khoản đã kích hoạt trước đó\n - Muốn thay đổi thiết bị, mất thiết bị, quên mã PIN hoặc mất thông tin khóa xác thực."),
        "reactiveFail": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu thay đổi không thành công"),
        "recall": MessageLookupByLibrary.simpleMessage("Thu hồi"),
        "recentTransactions":
            MessageLookupByLibrary.simpleMessage("Giao dịch gần đây"),
        "reciveOTP":
            MessageLookupByLibrary.simpleMessage("Bạn chưa nhận được mã? "),
        "referralCode": MessageLookupByLibrary.simpleMessage("Mã giới thiệu"),
        "refreshTokenFailed": MessageLookupByLibrary.simpleMessage(
            "Có lỗi trong quá trình làm mới token."),
        "registerAccountContactHotline": m22,
        "registerCert":
            MessageLookupByLibrary.simpleMessage("Đăng ký chứng thư số"),
        "registerDetailIntro": MessageLookupByLibrary.simpleMessage(
            "Sử dụng giấy tờ tùy thân và xác thực khuôn mặt để đăng ký tài khoản"),
        "registerIntro": MessageLookupByLibrary.simpleMessage(
            "Đăng ký tài khoản trực tuyến sử dụng eKYC"),
        "registerServiceSuccess":
            MessageLookupByLibrary.simpleMessage("Đăng ký dịch vụ thành công!"),
        "registerServiceSuccessGuideNextStep": m23,
        "registrationCardType":
            MessageLookupByLibrary.simpleMessage("Loại giấy tờ đăng ký"),
        "reject": MessageLookupByLibrary.simpleMessage("Từ chối"),
        "remainTimeToSign":
            MessageLookupByLibrary.simpleMessage("Thời gian ký còn lại"),
        "remaining_to_sign_equal_zero": MessageLookupByLibrary.simpleMessage(
            "Quý khách đang có 0 lượt ký; Vui lòng mua Lượt ký trên app SmartCA để tiếp tục sử dụng dịch vụ"),
        "renewCertOrder":
            MessageLookupByLibrary.simpleMessage("Gia hạn chứng thư số"),
        "requestAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu chấp nhận các điều khoản chính sách bảo vệ dữ liệu cá nhân"),
        "requestAgreeBill": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu đồng ý với nội dung trên Phiếu đề nghị"),
        "requestBiometricDesc": m24,
        "requestLinkSuccess":
            MessageLookupByLibrary.simpleMessage("Yêu cầu liên kết thành công"),
        "requestOrderType":
            MessageLookupByLibrary.simpleMessage("Loại yêu cầu"),
        "requestSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Gửi yêu cầu thành công"),
        "requestTime":
            MessageLookupByLibrary.simpleMessage("Thời gian yêu cầu"),
        "requestUnlinkSuccess": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu huỷ liên kết thành công"),
        "resendOTP": MessageLookupByLibrary.simpleMessage("Gửi lại mã OTP"),
        "resendOTPLater":
            MessageLookupByLibrary.simpleMessage("Gửi lại mã otp sau"),
        "result": MessageLookupByLibrary.simpleMessage("Kết quả"),
        "resultPacks": m25,
        "retry": MessageLookupByLibrary.simpleMessage("Thử lại"),
        "revoked": MessageLookupByLibrary.simpleMessage("Đã thu hồi"),
        "revoked_alter_message": MessageLookupByLibrary.simpleMessage(
            "CTS của khách hàng đã bị thu hồi. Vui lòng đăng ký chứng thư mới để thực hiện mua lượt ký."),
        "scanQR": MessageLookupByLibrary.simpleMessage("Quét QR"),
        "scanQRCode": MessageLookupByLibrary.simpleMessage("Quét mã QR"),
        "scanQRDescription": MessageLookupByLibrary.simpleMessage(
            "Vui lòng quét QR Code trên Căn cước \ncông dân để lấy thông tin"),
        "scanQRGuide": MessageLookupByLibrary.simpleMessage(
            "Vui lòng để QR Code vào chính giữa\nkhung hình"),
        "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
        "searchAdvance":
            MessageLookupByLibrary.simpleMessage("Tìm kiếm nâng cao"),
        "searchFilters":
            MessageLookupByLibrary.simpleMessage("Bộ lọc tìm kiếm"),
        "second": MessageLookupByLibrary.simpleMessage("giây"),
        "selectAll": MessageLookupByLibrary.simpleMessage("Chọn tất cả"),
        "selectCertToSign": MessageLookupByLibrary.simpleMessage(
            "Lựa chọn chứng thư số để thực hiện mua lượt ký"),
        "selectCertificate":
            MessageLookupByLibrary.simpleMessage("Chọn chứng thư số"),
        "selectCertificatePack":
            MessageLookupByLibrary.simpleMessage("Chọn gói Chứng thư số"),
        "selectData": MessageLookupByLibrary.simpleMessage("Chọn dữ liệu"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Chọn ngày"),
        "selectObject": MessageLookupByLibrary.simpleMessage("Chọn đối tượng"),
        "select_cert_to_change_info": MessageLookupByLibrary.simpleMessage(
            "Chọn chứng thư số cần thay đổi thông tin!"),
        "select_cert_to_extend": MessageLookupByLibrary.simpleMessage(
            "Chọn chứng thư số cần gia hạn!"),
        "select_time_to_extend":
            MessageLookupByLibrary.simpleMessage("Chọn chu kỳ gia hạn"),
        "send": MessageLookupByLibrary.simpleMessage("Gửi"),
        "sendSupportRequest":
            MessageLookupByLibrary.simpleMessage("Gửi yêu cầu hỗ trợ"),
        "sentServiceRequestSuccess": MessageLookupByLibrary.simpleMessage(
            "Gửi yêu cầu cấp Chứng thư số thành công. Vui lòng kiểm tra email sau ít phút để kích hoạt dịch vụ."),
        "serial": MessageLookupByLibrary.simpleMessage("Số sê-ri"),
        "serialNumber": MessageLookupByLibrary.simpleMessage("Số serial"),
        "serviceCannotVerifyApp": MessageLookupByLibrary.simpleMessage(
            "Không thể xác thực ứng dụng."),
        "serviceCharge": MessageLookupByLibrary.simpleMessage("Phí dịch vụ"),
        "serviceExpireToken": MessageLookupByLibrary.simpleMessage(
            "Phiên đã hết hạn. Vui lòng đăng nhập lại."),
        "serviceGenerateKAKFail": MessageLookupByLibrary.simpleMessage(
            "Sinh khóa bảo vệ(KAK) không thành công."),
        "serviceGeneratingKAK":
            MessageLookupByLibrary.simpleMessage("Generating KAK"),
        "serviceInitialization":
            MessageLookupByLibrary.simpleMessage("Khởi tạo dịch vụ"),
        "serviceLockPINOverEnter": MessageLookupByLibrary.simpleMessage(
            "PIN của bạn đã bị khóa do nhập sai nhiều lần."),
        "serviceLostConnection": MessageLookupByLibrary.simpleMessage(
            "Lỗi kết nối. Vui lòng kiểm tra lại kết nối mạng."),
        "serviceNoAccessTokenFound":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy accessToken."),
        "serviceNotExistedTransactionHis": MessageLookupByLibrary.simpleMessage(
            "Không tồn tại lịch sử giao dịch."),
        "serviceNotExistedUserInfo": MessageLookupByLibrary.simpleMessage(
            "Không tồn tại thông tin người dùng."),
        "serviceNotFoundDevice":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy thiết bị."),
        "serviceNotFoundFCMToken": MessageLookupByLibrary.simpleMessage(
            "Không thể đăng ký nhận thông báo."),
        "serviceRejectFail": MessageLookupByLibrary.simpleMessage("Hủy bỏ lỗi"),
        "serviceRequestForm": MessageLookupByLibrary.simpleMessage(
            "Phiếu yêu cầu cung cấp dịch vụ"),
        "serviceSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Đã có lỗi xảy ra. Vui lòng thử lại sau."),
        "serviceVerifyAppFail":
            MessageLookupByLibrary.simpleMessage("Xác thực App lỗi."),
        "service_pack_create_order_failed":
            MessageLookupByLibrary.simpleMessage(
                "Lỗi: Đặt hàng không thành công."),
        "service_pack_get_failed": MessageLookupByLibrary.simpleMessage(
            "Lỗi: Không lấy được thông tin gói lượt ký."),
        "service_pack_order_status":
            MessageLookupByLibrary.simpleMessage("Trạng thái:"),
        "service_pack_payment_failed": MessageLookupByLibrary.simpleMessage(
            "Lỗi: Tích hợp thanh toán không thành công."),
        "service_pack_reject_message": MessageLookupByLibrary.simpleMessage(
            "Tài khoản của bạn không được mua lượt ký!"),
        "service_pack_signatures":
            MessageLookupByLibrary.simpleMessage("Lượt ký"),
        "service_pack_total_amount":
            MessageLookupByLibrary.simpleMessage("Tổng thanh toán"),
        "service_pack_total_signature":
            MessageLookupByLibrary.simpleMessage("Tổng lượt ký:"),
        "service_pack_vat_included":
            MessageLookupByLibrary.simpleMessage("(Đã bao gồm 10% VAT)"),
        "settings": MessageLookupByLibrary.simpleMessage("Cài đặt chung"),
        "setupPasswordAccount": MessageLookupByLibrary.simpleMessage(
            "Thiết lập mật khẩu cho tài khoản"),
        "setupPinCode": MessageLookupByLibrary.simpleMessage("Thiết lập PIN"),
        "shareDetailIntro": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể nhận file từ các ứng dụng khác để Tạo giao dịch và Chia sẻ lại file đã Ký số"),
        "shareIntro": MessageLookupByLibrary.simpleMessage(
            "Ký số, Nhận file, Chia sẻ file ngay trên ứng dụng"),
        "sign": MessageLookupByLibrary.simpleMessage("Ký tất cả"),
        "sign769TranTypeDesc":
            MessageLookupByLibrary.simpleMessage("Ký hash 769"),
        "signBbnt":
            MessageLookupByLibrary.simpleMessage("Ký biên bản nghiệm thu"),
        "signChangeRequest":
            MessageLookupByLibrary.simpleMessage("Ký phiếu yêu cầu thay đổi"),
        "signConfirm": MessageLookupByLibrary.simpleMessage("Ký xác nhận"),
        "signDetailIntro": MessageLookupByLibrary.simpleMessage(
            "Bạn có thể mua không giới hạn, đặt tên và lựa chọn Chứng thư khi Ký số"),
        "signError": MessageLookupByLibrary.simpleMessage("Ký lỗi"),
        "signErrorInvalid": MessageLookupByLibrary.simpleMessage(
            "Ký BBNT lỗi, chữ ký không hợp lệ"),
        "signFailed": MessageLookupByLibrary.simpleMessage("Ký thất bại"),
        "signIn": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "signInFieldWarning": m26,
        "signIntro": MessageLookupByLibrary.simpleMessage(
            "Sở hữu không giới hạn, đặt tên và Ký số bằng nhiều Chứng thư"),
        "signOut": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "signOutConfirm": MessageLookupByLibrary.simpleMessage(
            "Bạn có chắc chắn muốn đăng xuất khỏi thiết bị này không?"),
        "signTheProposalForm":
            MessageLookupByLibrary.simpleMessage("Ký phiếu đề nghị"),
        "signToQD769":
            MessageLookupByLibrary.simpleMessage("Ký số theo QĐ-769-BTTTT"),
        "signTranTypeDesc": MessageLookupByLibrary.simpleMessage("Ký tài liệu"),
        "signTransactionDone": MessageLookupByLibrary.simpleMessage(
            "Giao dịch của bạn đã được ký thành công"),
        "sign_ticket_extension_title":
            MessageLookupByLibrary.simpleMessage("Ký phiếu đề nghị gia hạn"),
        "sign_tranaction_success": m27,
        "signatureOption":
            MessageLookupByLibrary.simpleMessage("Tuỳ chọn lượt ký"),
        "signedSuccess":
            MessageLookupByLibrary.simpleMessage("Ký số thành công"),
        "signer": MessageLookupByLibrary.simpleMessage("Trình ký"),
        "signerTranTypeDesc": MessageLookupByLibrary.simpleMessage("Trình ký"),
        "signingInformation":
            MessageLookupByLibrary.simpleMessage("Thông tin lượt ký"),
        "size": MessageLookupByLibrary.simpleMessage("Kích thước"),
        "skip": MessageLookupByLibrary.simpleMessage("Bỏ qua"),
        "startVerifying":
            MessageLookupByLibrary.simpleMessage("Bắt đầu xác minh"),
        "status": MessageLookupByLibrary.simpleMessage("Trạng thái"),
        "streetName": MessageLookupByLibrary.simpleMessage("Thôn/Xóm"),
        "strongPasswordValid": MessageLookupByLibrary.simpleMessage(
            "Sử dụng 8-30 ký tự bao gồm chữ hoa, chữ thường, số, ký tự đặc biệt ~!@#\$%^&*_-+=`|(){}[]:;”<>,.?/"),
        "subject": MessageLookupByLibrary.simpleMessage("Chủ thể"),
        "subscriber_information":
            MessageLookupByLibrary.simpleMessage("Thông tin thuê bao"),
        "subscriber_name": MessageLookupByLibrary.simpleMessage("Tên thuê bao"),
        "successNotirce": MessageLookupByLibrary.simpleMessage("Thành công!"),
        "successfulAccountRegistration": MessageLookupByLibrary.simpleMessage(
            "Đăng ký tài khoản thành công"),
        "suggested_extension":
            MessageLookupByLibrary.simpleMessage("Gợi ý gia hạn"),
        "support": MessageLookupByLibrary.simpleMessage("Hỗ trợ"),
        "sureToQuitReactive": MessageLookupByLibrary.simpleMessage(
            "Bạn có muốn thoát quá trình kích hoạt lại tài khoản hay không?"),
        "suspended": MessageLookupByLibrary.simpleMessage("Đang tạm dừng"),
        "suspended_alter_message": MessageLookupByLibrary.simpleMessage(
            "CTS của khách hàng đang tạm dừng. Vui lòng liên hệ quản trị viên để được hỗ trợ."),
        "syncBBNTFailure": MessageLookupByLibrary.simpleMessage(
            "Đồng bộ biên bản nghiệm thu không thành công"),
        "systemVerifying": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang xác minh thông tin.\nVui lòng đợi trong giây lát..."),
        "tai_anh_chu_ky": MessageLookupByLibrary.simpleMessage("Tải lên"),
        "tai_hinh_nen":
            MessageLookupByLibrary.simpleMessage("Tải lên hình nền"),
        "tai_mau_dinh_kem":
            MessageLookupByLibrary.simpleMessage("Tải mẫu đính kèm"),
        "takePhotoBrightClear":
            MessageLookupByLibrary.simpleMessage("Chụp ảnh đủ sáng và rõ nét"),
        "taxCode": MessageLookupByLibrary.simpleMessage("MST"),
        "ten_chung_thu": MessageLookupByLibrary.simpleMessage("Tên chứng thư"),
        "termOfUseService":
            MessageLookupByLibrary.simpleMessage("điều khoản sử dụng dịch vụ"),
        "theFeatureAreImprovingPleaseTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "Tính năng đang phát triển\nVui lòng thử lại sau!"),
        "theSystemIsInitializingTheContract": MessageLookupByLibrary.simpleMessage(
            "Hệ thống đang khởi tạo hợp đồng\nVui lòng đợi trong giây lát..."),
        "theSystemIsInitializingTheServicePleaseWaitAMoment":
            MessageLookupByLibrary.simpleMessage(
                "Hệ thống đang khởi tạo dịch vụ,\nvui lòng đợi trong giây lát...."),
        "theSystemWillAutomaticallySign": MessageLookupByLibrary.simpleMessage(
            "Hệ thống sẽ thực hiện ký số tự động khi quý khách chọn mở. Tắt tính năng khi không còn sử dụng."),
        "them_chu_ky": MessageLookupByLibrary.simpleMessage("Thêm chữ ký"),
        "them_mau_chu_ky":
            MessageLookupByLibrary.simpleMessage("Thêm mẫu chữ ký"),
        "thereIsDeviceChangeRequest": m28,
        "time": MessageLookupByLibrary.simpleMessage("Thời gian"),
        "timeToDate":
            MessageLookupByLibrary.simpleMessage("Thời gian đến ngày"),
        "toDate": MessageLookupByLibrary.simpleMessage("Đến ngày"),
        "toPerformSystemLinking": MessageLookupByLibrary.simpleMessage(
            " để thực hiện liên kết hệ thống"),
        "to_chu_xac_thuc":
            MessageLookupByLibrary.simpleMessage("Tổ chức xác thực"),
        "tokenExpired":
            MessageLookupByLibrary.simpleMessage("Token đã hết hạn."),
        "totalNumberSignatures": m29,
        "totalRecord": m30,
        "totalResult": m31,
        "transExpired": MessageLookupByLibrary.simpleMessage(
            "Giao dịch đã hết hạn hoặc bị hủy không thể xem!"),
        "transPending": MessageLookupByLibrary.simpleMessage(
            "Giao dịch đang chờ ký không thể xem!"),
        "transactionBBNTNotFound": MessageLookupByLibrary.simpleMessage(
            "Không tồn tại biên bản nghiệm thu. Vui lòng kiểm tra và thử lại"),
        "transactionDate":
            MessageLookupByLibrary.simpleMessage("Ngày giao dịch"),
        "transactionDesc": MessageLookupByLibrary.simpleMessage("Mô tả"),
        "transactionDetail":
            MessageLookupByLibrary.simpleMessage("Thông tin giao dịch"),
        "transactionHistory":
            MessageLookupByLibrary.simpleMessage("Lịch sử giao dịch"),
        "transactionStatus": MessageLookupByLibrary.simpleMessage("Trạng thái"),
        "transactionType":
            MessageLookupByLibrary.simpleMessage("Loại giao dịch"),
        "transaction_request_group_title": m32,
        "transactionhistoryinfo":
            MessageLookupByLibrary.simpleMessage("Thông tin lịch sử giao dịch"),
        "transactions": MessageLookupByLibrary.simpleMessage("Xác nhận ký"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Vui lòng thử lại!"),
        "turn": m33,
        "turnOff": MessageLookupByLibrary.simpleMessage("Tắt"),
        "turnOn": MessageLookupByLibrary.simpleMessage("Mở"),
        "tutorialRegisterAccount":
            MessageLookupByLibrary.simpleMessage("Hướng dẫn đăng ký tài khoản"),
        "tuy_chon_vi_tri_ky":
            MessageLookupByLibrary.simpleMessage("Tùy chọn vị trí chữ ký"),
        "typeOfCertificate": MessageLookupByLibrary.simpleMessage("Loại CTS"),
        "unknown": MessageLookupByLibrary.simpleMessage("Không xác định"),
        "unlimitedNumberOfSignatures":
            MessageLookupByLibrary.simpleMessage("Không giới hạn lượt ký"),
        "unrecognized_json": MessageLookupByLibrary.simpleMessage(
            "Không nhận dạng được dữ liệu JSON"),
        "unuseds_ignatures":
            MessageLookupByLibrary.simpleMessage("Số lượt ký chưa sử dụng"),
        "update": MessageLookupByLibrary.simpleMessage("Cập nhật"),
        "updateHistory":
            MessageLookupByLibrary.simpleMessage("Lịch sử cập nhật"),
        "updateVersionMsg":
            MessageLookupByLibrary.simpleMessage("Đã có phiên bản mới"),
        "update_email_phone": MessageLookupByLibrary.simpleMessage(
            "Cập nhật email, số điện thoại"),
        "update_info_success": MessageLookupByLibrary.simpleMessage(
            "Cập nhật thông tin tài khoản thành công"),
        "update_info_title":
            MessageLookupByLibrary.simpleMessage("Cập nhật địa chỉ"),
        "useTheAddress": MessageLookupByLibrary.simpleMessage(
            "Sử dụng địa chỉ nới sinh sống hoặc làm việc để được hỗ trợ nhanh nhất"),
        "usedTime": MessageLookupByLibrary.simpleMessage("Thời gian sử dụng"),
        "userManual": MessageLookupByLibrary.simpleMessage("Hướng dẫn sử dụng"),
        "userName": MessageLookupByLibrary.simpleMessage("Tên đăng nhập"),
        "username": MessageLookupByLibrary.simpleMessage("Tên đăng nhập"),
        "usernamePlacehoder":
            MessageLookupByLibrary.simpleMessage("Nhập số CCCD/HC/Mã số thuế"),
        "validate10or13": MessageLookupByLibrary.simpleMessage("10 hoặc 13"),
        "validate_passport_error": MessageLookupByLibrary.simpleMessage(
            "Hộ chiếu không đúng định dạng"),
        "validity": MessageLookupByLibrary.simpleMessage("Hiệu lực"),
        "ve_chu_ky_tai_day":
            MessageLookupByLibrary.simpleMessage("Vẽ chữ ký tại đây"),
        "verifyFail":
            MessageLookupByLibrary.simpleMessage("Xác thực không thành công!"),
        "verifyFailDetail": MessageLookupByLibrary.simpleMessage(
            "Đã có lỗi xảy ra, vui lòng thử lại sau!"),
        "verifyInfo":
            MessageLookupByLibrary.simpleMessage("Xác minh thông tin"),
        "verifyInfoError": MessageLookupByLibrary.simpleMessage(
            "Xác minh thông tin không thành công!"),
        "verifyInfoErrorCauseContent": MessageLookupByLibrary.simpleMessage(
            "Ảnh chân dung không phải ảnh thật!"),
        "verifyInfoErrorCauseContent2":
            MessageLookupByLibrary.simpleMessage("Khuôn mặt không trùng khớp"),
        "verifyInfoErrorCauseGuide": MessageLookupByLibrary.simpleMessage(
            "Bạn chỉ có tối đa 03 lần thực hiện eKYC."),
        "verifyInfoErrorCauseLabel":
            MessageLookupByLibrary.simpleMessage("Lý do:"),
        "verifyInfoErrorDescription": MessageLookupByLibrary.simpleMessage(
            "Rất tiếc, chúng tôi không thể xác minh thông tin của bạn."),
        "verifyInfoErrorSolution": MessageLookupByLibrary.simpleMessage(
            "Vui lòng liên hệ Tổng đài 18001260 (nhánh 1) miễn phí để được hỗ trợ xác minh thông tin tại quầy!"),
        "verifyInfoErrorSolution2": MessageLookupByLibrary.simpleMessage(
            "Vui lòng thực hiện đúng theo hướng dẫn để quá trình xác minh được chính xác."),
        "verifyInformationAccount": MessageLookupByLibrary.simpleMessage(
            "Xác minh thông tin tài khoản"),
        "verifyTranTypeDesc":
            MessageLookupByLibrary.simpleMessage("Chờ xác nhận"),
        "version": MessageLookupByLibrary.simpleMessage("Phiên bản"),
        "versionNewest": MessageLookupByLibrary.simpleMessage(
            "Bạn đang sử dụng phiên bản mới nhất."),
        "versionNumber": m34,
        "vietnamese": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
        "viewFileHash": MessageLookupByLibrary.simpleMessage(
            "Không hỗ trợ xem tài liệu Ký hash!"),
        "viewMore": MessageLookupByLibrary.simpleMessage("Xem thêm"),
        "viewOrderDetail":
            MessageLookupByLibrary.simpleMessage("Xem chi tiết đơn hàng"),
        "viewTransactionInfo":
            MessageLookupByLibrary.simpleMessage("Xem thông tin giao dịch"),
        "view_detail": MessageLookupByLibrary.simpleMessage("Xem chi tiết"),
        "vnd": m35,
        "waitingActivate":
            MessageLookupByLibrary.simpleMessage("Chờ kích hoạt"),
        "waitingActiveCer": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số đang chờ kích hoạt!"),
        "waitingApprove": MessageLookupByLibrary.simpleMessage("Chờ duyệt"),
        "waitingCapCTS": MessageLookupByLibrary.simpleMessage(
            "Hồ sơ của quý khách sẽ được  duyệt trong vòng 30 phút (trong giờ hành chính).  Kết quả sẽ được thông báo qua ứng dụng VNPT SmartCA!"),
        "waitingConfig": MessageLookupByLibrary.simpleMessage("Chờ cấu hình"),
        "waitingForAcceptCertDescription": MessageLookupByLibrary.simpleMessage(
            "Hồ sơ của quý khách sẽ được duyệt trong\nvòng 30 phút (trong giờ hành chính).\nKết quả sẽ được thông báo qua email!"),
        "waitingForAcceptCertTitle": MessageLookupByLibrary.simpleMessage(
            "Chờ duyệt yêu cầu đăng ký\nchứng thư số!"),
        "waitingForAcceptChangeDeviceTitle":
            MessageLookupByLibrary.simpleMessage(
                "Chờ duyệt yêu cầu thay đổi\nthiết bị!"),
        "waitingForAcceptChangeInfoTitle": MessageLookupByLibrary.simpleMessage(
            "Chờ duyệt yêu cầu thay đổi\nthông tin chứng thư số"),
        "waitingForAcceptExtendTitle": MessageLookupByLibrary.simpleMessage(
            "Chờ duyệt yêu cầu gia hạn\nchứng thư số!"),
        "waitingForActivation":
            MessageLookupByLibrary.simpleMessage("Chờ kích hoạt"),
        "waitingForApproval": MessageLookupByLibrary.simpleMessage(
            "VNPT SmartCA đã tiếp nhận hồ sơ của quý khách, vui lòng chờ VNPT SmartCA thẩm định hồ sơ và cấp chứng thư số."),
        "waitingForApprovalTitle": MessageLookupByLibrary.simpleMessage(
            "Gửi hồ sơ đăng ký chứng thư số thành công!"),
        "waitingForSignerConfirm":
            MessageLookupByLibrary.simpleMessage("Chờ xác nhận"),
        "waitingGenerateCertificate":
            MessageLookupByLibrary.simpleMessage("Chờ cấp chứng thư số"),
        "waitingGenerateKeyPair":
            MessageLookupByLibrary.simpleMessage("Chờ sinh cặp khóa"),
        "waitingSignAcceptanceMinutes":
            MessageLookupByLibrary.simpleMessage("Chờ ký Biên bản nghiệm thu"),
        "waitingSyncBBNT": MessageLookupByLibrary.simpleMessage(
            "Chờ đồng bộ biên bản nghiệm thu"),
        "waitingUserActive":
            MessageLookupByLibrary.simpleMessage("Chờ người dùng kích hoạt"),
        "wards": MessageLookupByLibrary.simpleMessage("Phường/Xã"),
        "warning": MessageLookupByLibrary.simpleMessage("Cảnh báo"),
        "warning_number_sign": m36,
        "whatYouNeedTKnow":
            MessageLookupByLibrary.simpleMessage("Điều bạn cần biết"),
        "whenTheTermExpires": MessageLookupByLibrary.simpleMessage(
            "Khi hết thời hạn quý khách thực hiện cấu hình lại để tiếp tục sử dụng"),
        "youCanNotBuySignature": MessageLookupByLibrary.simpleMessage(
            "Bạn không thể mua lượt ký.\nLý do: Không tồn tại Chứng thư số theo Lượt ký ở trạng thái Đang hoạt động."),
        "youDontHaveCert":
            MessageLookupByLibrary.simpleMessage("Bạn chưa có chứng thư số"),
        "youKnowOne": MessageLookupByLibrary.simpleMessage(
            "Chứng thư số chưa bao gồm lượt ký. Số lượt ký sẽ theo gói lượt ký mua riêng"),
        "youKnowTwo": MessageLookupByLibrary.simpleMessage(
            "Ký số miễn phí khi thực hiện các giao dịch trên cổng dịch vụ công quốc gia."),
        "you_need_know": MessageLookupByLibrary.simpleMessage("Bạn cần biết")
      };
}
