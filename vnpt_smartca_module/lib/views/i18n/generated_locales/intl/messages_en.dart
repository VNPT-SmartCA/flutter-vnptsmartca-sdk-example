// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(anything) =>
      "Do you agree to remove the automatic digital signature link system for: \'${anything}\'?";

  static String m1(anything) => "${anything}";

  static String m2(transactionCount, message) =>
      "Hủy thành công ${transactionCount} giao dịch \n ${message}";

  static String m3(number) => "ID/Tax number: ${number}";

  static String m4(anything) => "Document list ${anything}";

  static String m5(hotline) =>
      "Sorry, we could not verify your documents. Please contact Call Center ${hotline} (branch 1) for assistance in verifying information at the counter!";

  static String m6(anything) => "Please enter ${anything} characters";

  static String m7(anything) => "Enter ${anything}";

  static String m8(number) => "Expires in ${number} days";

  static String m9(number) => "${number} month";

  static String m10(anything) =>
      "If deleted, please make the link on the system \'${anything}\' to link again.";

  static String m11(anything) => "Please enter ${anything}";

  static String m12(numberPackages) => "List Packages (${numberPackages})";

  static String m13(anything) => "Please enter up to ${anything} characters";

  static String m14(anything) => "Please enter at least ${anything} characters";

  static String m15(number) =>
      "Your ${number} account has been activated. Please Login to activate digital certificate";

  static String m16(number) =>
      "The account ${number} does not match the registration information.\n Please check and re-enter the correct document number!";

  static String m17(step) => "Step ${step}";

  static String m18(action) =>
      "Personal digital certificates in businesses do not yet support online ${action}. Your request will be sent to support staff. Or you can directly contact Hotline 18001260 (branch 1) free for support.";

  static String m19(number) =>
      "There are ${number} digital certificates awaiting activation!";

  static String m20(number) =>
      "Account “${number}“ already exists, do you want to buy more digital certificates? \nLogin to buy more digital certificates!";

  static String m21(number) =>
      "Account “${number}” is pending activation, please do activation!";

  static String m22(hotline) =>
      "o register an account, please contact hotline ${hotline} branch 1 (free)!";

  static String m23(action) =>
      "Next, you need ${action} and file to use digital certificate, please check your email/sms to receive activation information from VNPT SmartCA!";

  static String m24(purpose) => "Please use biometric to ${purpose}";

  static String m25(numberPackages) => "Result (${numberPackages})";

  static String m26(anything) => "Enter ${anything} to continue";

  static String m27(transactionCount, message) =>
      "Signed successfully ${transactionCount} transaction \n ${message}";

  static String m28(serial) =>
      "A request to change the device with serial ${serial} already exists. Do you want to continue?";

  static String m29(number) => "Total number of signatures: (${number})";

  static String m30(total) => "Total: ${total} results";

  static String m31(total) => "(${total} documents)";

  static String m32(numberCertificate) => "Certificate ${numberCertificate}";

  static String m33(number) => "${number} turn";

  static String m34(version) => "VNPT SmartCA version ${version}";

  static String m35(number) => "${number} VNĐ";

  static String m36(number) =>
      "You have ${number} of unused signatures. If you renew, the number of signatures will expire. Do you want to continue Renew?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Activated": MessageLookupByLibrary.simpleMessage("Activated"),
        "Continue": MessageLookupByLibrary.simpleMessage("continue"),
        "KAKNotFound": MessageLookupByLibrary.simpleMessage(
            "The certificate has not been registered on the device. Do you want to register a digital certificate on this device?"),
        "Notice": MessageLookupByLibrary.simpleMessage("Notify"),
        "Retake": MessageLookupByLibrary.simpleMessage("Retake"),
        "acceptance": MessageLookupByLibrary.simpleMessage("Acceptance"),
        "acceptanceTranTypeDesc":
            MessageLookupByLibrary.simpleMessage("Acceptance"),
        "accordingToInstallationTime": MessageLookupByLibrary.simpleMessage(
            "According to installation time"),
        "accordingToUsageNeeds":
            MessageLookupByLibrary.simpleMessage("According to usage needs"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "accountInformation":
            MessageLookupByLibrary.simpleMessage("Account Information"),
        "accountRegisteredSuccessfully": MessageLookupByLibrary.simpleMessage(
            "Account has been successfully registered.\nPlease Login to continue!"),
        "accountType": MessageLookupByLibrary.simpleMessage("Account type"),
        "activate": MessageLookupByLibrary.simpleMessage("Activate"),
        "activateAccount":
            MessageLookupByLibrary.simpleMessage("Activate account"),
        "activateBiometricDesc": MessageLookupByLibrary.simpleMessage(
            "Using biometrics to enhance security, do you agree?"),
        "activateButton":
            MessageLookupByLibrary.simpleMessage("Sign acceptance minutes"),
        "activateCode": MessageLookupByLibrary.simpleMessage("Activate code"),
        "activateKeyPair":
            MessageLookupByLibrary.simpleMessage("Activate keypair"),
        "activateSuccessDesc": MessageLookupByLibrary.simpleMessage(
            "Your digital certificate has been activated successfully."),
        "activateSuccessTitle":
            MessageLookupByLibrary.simpleMessage("Activate success"),
        "activateTransactionNotSignAcceptanceMinutes":
            MessageLookupByLibrary.simpleMessage(
                "The account has not signed the acceptance minutes"),
        "activateTransactionNotSignKeypair":
            MessageLookupByLibrary.simpleMessage(
                "The account has not been activated with a key pair"),
        "activated": MessageLookupByLibrary.simpleMessage("Activated"),
        "activationTutorial":
            MessageLookupByLibrary.simpleMessage("Activation tutorial"),
        "active": MessageLookupByLibrary.simpleMessage("Active"),
        "activeAccount": MessageLookupByLibrary.simpleMessage("Active account"),
        "activeBiometricAuthentication": MessageLookupByLibrary.simpleMessage(
            "Active biometric authentication"),
        "activeCer": MessageLookupByLibrary.simpleMessage(
            "Activate digital certificate"),
        "activeCodeSent": MessageLookupByLibrary.simpleMessage(
            "Active code has been sent to your email."),
        "activeNow": MessageLookupByLibrary.simpleMessage("Activate now"),
        "active_bio": MessageLookupByLibrary.simpleMessage("Turn on biometric"),
        "activing": MessageLookupByLibrary.simpleMessage("Active"),
        "activingCert":
            MessageLookupByLibrary.simpleMessage("Activating certificate..."),
        "activingKey":
            MessageLookupByLibrary.simpleMessage("Please wait a moment..."),
        "addAccount":
            MessageLookupByLibrary.simpleMessage("Add another account"),
        "addDocument": MessageLookupByLibrary.simpleMessage("Add document"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "addressDetail":
            MessageLookupByLibrary.simpleMessage("Detailed address"),
        "addressFullLabel": MessageLookupByLibrary.simpleMessage(
            "Province/City, District, Ward/Commune"),
        "addressInfo": MessageLookupByLibrary.simpleMessage("Address"),
        "addressOnDocuments":
            MessageLookupByLibrary.simpleMessage("Address on documents"),
        "addressOption": MessageLookupByLibrary.simpleMessage("Address option"),
        "affiliateAppName":
            MessageLookupByLibrary.simpleMessage("Linked App Name"),
        "affiliateApplication":
            MessageLookupByLibrary.simpleMessage("Linked app"),
        "agree": MessageLookupByLibrary.simpleMessage("Agree"),
        "agreeRemoveLinkSystem": m0,
        "alertApproval": MessageLookupByLibrary.simpleMessage(
            "Verify information have problem, please contact hotline 18001260 for advice and support"),
        "alertDelRegDevice": MessageLookupByLibrary.simpleMessage(
            "- Only use when you want to use another account on this device\n- Existing account data saved on your device will be deleted, you will return to Account Activation step!"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "anything": m1,
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "authentication":
            MessageLookupByLibrary.simpleMessage("Authentication"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "backLighting":
            MessageLookupByLibrary.simpleMessage("Avoid back lighting"),
        "beingVerified": MessageLookupByLibrary.simpleMessage(
            "Information is being verified"),
        "bioHint": MessageLookupByLibrary.simpleMessage("verify identity"),
        "bioNotRecognized":
            MessageLookupByLibrary.simpleMessage("Biometric not recognized!"),
        "bioRequiredTitle":
            MessageLookupByLibrary.simpleMessage("Biometric required title"),
        "bioSignInTitle":
            MessageLookupByLibrary.simpleMessage("Authentication required"),
        "bio_protect_pin": MessageLookupByLibrary.simpleMessage(
            "To protect your PIN, we recommend you to use device supported biometric"),
        "biometricAuthDesc": MessageLookupByLibrary.simpleMessage(
            "Do you want to use biometrics to Login?"),
        "biometricAuthentication": MessageLookupByLibrary.simpleMessage(
            "Use Biometric Authentication"),
        "biometricDialogButton":
            MessageLookupByLibrary.simpleMessage("Authentication by biometric"),
        "biometricDialogTitle":
            MessageLookupByLibrary.simpleMessage("Authentication required"),
        "biometricSuccess":
            MessageLookupByLibrary.simpleMessage("Biometric success"),
        "biometrics": MessageLookupByLibrary.simpleMessage("Biometrics"),
        "biometricsGoToSettingsDesc": MessageLookupByLibrary.simpleMessage(
            "Biometric authentication is not set up on your device. Please either enable Touch ID or Face ID on your phone."),
        "blurryPhotos":
            MessageLookupByLibrary.simpleMessage("Advoid too blurry photos"),
        "btnPayment": MessageLookupByLibrary.simpleMessage("Payment"),
        "bulletDot": MessageLookupByLibrary.simpleMessage("•"),
        "business": MessageLookupByLibrary.simpleMessage("Enterprise"),
        "businessOrganization":
            MessageLookupByLibrary.simpleMessage("Business Organization"),
        "businessRegistrationCertificate": MessageLookupByLibrary.simpleMessage(
            "Business registration certificate"),
        "but_ve": MessageLookupByLibrary.simpleMessage("Draw"),
        "buyCTS": MessageLookupByLibrary.simpleMessage("Buy\ncertificate"),
        "buyNow": MessageLookupByLibrary.simpleMessage("Buy now"),
        "buySignatures":
            MessageLookupByLibrary.simpleMessage("Buy\nSignatures"),
        "buy_signature": MessageLookupByLibrary.simpleMessage("Buy signatures"),
        "bySignatures": MessageLookupByLibrary.simpleMessage("By signatures"),
        "calAuthDataFail": MessageLookupByLibrary.simpleMessage(
            "Calculate authorize data failed"),
        "canLoading":
            MessageLookupByLibrary.simpleMessage("Release to load more"),
        "can_giua": MessageLookupByLibrary.simpleMessage("Center"),
        "can_le": MessageLookupByLibrary.simpleMessage("Alignment"),
        "can_not_extend_cert":
            MessageLookupByLibrary.simpleMessage("You cannot extend!"),
        "can_not_extend_cert_description": MessageLookupByLibrary.simpleMessage(
            "Reason No certificate exists in active or expired state."),
        "can_phai": MessageLookupByLibrary.simpleMessage("Align right"),
        "can_trai": MessageLookupByLibrary.simpleMessage("Left-aligned"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelOrderConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to cancel this order?"),
        "cancelTransaction":
            MessageLookupByLibrary.simpleMessage("Cancel transaction"),
        "cancelTransactionDone":
            MessageLookupByLibrary.simpleMessage("Transaction Canceled"),
        "cancel_order": MessageLookupByLibrary.simpleMessage("Cancel order"),
        "cancel_tranaction_success": m2,
        "canceled": MessageLookupByLibrary.simpleMessage("Canceled"),
        "cannotGetDeviceInfo":
            MessageLookupByLibrary.simpleMessage("Cannot get device info"),
        "cannotSignKeyChallenge":
            MessageLookupByLibrary.simpleMessage("Cannot sign key challenge"),
        "cant_not_certificate_active_in_device":
            MessageLookupByLibrary.simpleMessage(
                "There are no certificates enabled on this device. Please perform Device Change"),
        "cant_not_signature_document": MessageLookupByLibrary.simpleMessage(
            "Cannot perform digital signing because the digital certificate is being used by another device"),
        "cert": MessageLookupByLibrary.simpleMessage("Name of Cert"),
        "certBusinessRegistration": MessageLookupByLibrary.simpleMessage(
            "Certificate of business registration"),
        "certDetail":
            MessageLookupByLibrary.simpleMessage("Certificate details"),
        "certIntro": MessageLookupByLibrary.simpleMessage(
            "Buy certificates, Renew, Change digital certificate information online"),
        "certOrderIsExistingNotice": MessageLookupByLibrary.simpleMessage(
            "A previous requirement to register a digital certificate exists. Do you want to continue or register a new one?"),
        "certPackNoteContent": MessageLookupByLibrary.simpleMessage(
            "Digital certificates do not include signatures. The number of subscriptions will be according to the subscription package purchased separately."),
        "certPackNoteLabel": MessageLookupByLibrary.simpleMessage("Note"),
        "certRequester": MessageLookupByLibrary.simpleMessage(
            "Certificate requester needs to match the face"),
        "certificate": MessageLookupByLibrary.simpleMessage("Certificate"),
        "certificate_get_list_error": MessageLookupByLibrary.simpleMessage(
            "Can\'t get digital certificate information"),
        "certificate_package_get_districts_error":
            MessageLookupByLibrary.simpleMessage(
                "Error: Can\'t get District information"),
        "certificate_package_get_list_error":
            MessageLookupByLibrary.simpleMessage(
                "Error: Cannot get package information Digital certificate"),
        "certificate_package_get_province_error":
            MessageLookupByLibrary.simpleMessage(
                "Error: Can\'t get Province/City information"),
        "certificate_package_get_wards_error":
            MessageLookupByLibrary.simpleMessage(
                "Error: Can\'t get Ward information"),
        "certificate_package_item_amount_title":
            MessageLookupByLibrary.simpleMessage("Into money"),
        "certificate_package_item_price_title":
            MessageLookupByLibrary.simpleMessage("Service charge"),
        "certificate_package_item_timevalidity":
            MessageLookupByLibrary.simpleMessage("Used Time"),
        "certificate_package_item_unit_price_title":
            MessageLookupByLibrary.simpleMessage("Unit price"),
        "certificate_package_list_empty":
            MessageLookupByLibrary.simpleMessage("No data displayed"),
        "certificate_package_list_option_sign_limit":
            MessageLookupByLibrary.simpleMessage("Certificate by signing"),
        "certificate_package_list_option_sign_no_limit":
            MessageLookupByLibrary.simpleMessage(
                "Unlimited number of signatures"),
        "certificate_package_list_title":
            MessageLookupByLibrary.simpleMessage("Select certificate package"),
        "certificate_package_list_title_empty":
            MessageLookupByLibrary.simpleMessage(
                "There are no Certificate packages selected"),
        "certificate_package_no_selected_error":
            MessageLookupByLibrary.simpleMessage(
                "Please select Digital Certificate before declaring information!"),
        "certificate_package_notify_order_desc_success":
            MessageLookupByLibrary.simpleMessage(
                "Please prepare Citizen Identity/ID documents to apply for digital certificate!"),
        "certificate_package_notify_order_success":
            MessageLookupByLibrary.simpleMessage(
                "Registration for digital certificate is successful"),
        "certificate_package_page_confirm_order_title":
            MessageLookupByLibrary.simpleMessage("Order confirmation"),
        "certificate_package_page_order_title":
            MessageLookupByLibrary.simpleMessage("Service pack information"),
        "certificate_package_page_register_title":
            MessageLookupByLibrary.simpleMessage("Declare information"),
        "certificate_package_progress_order":
            MessageLookupByLibrary.simpleMessage("Order processing..."),
        "certificate_package_progress_order_success":
            MessageLookupByLibrary.simpleMessage(
                "Service initialization successful"),
        "certificate_package_register_account":
            MessageLookupByLibrary.simpleMessage("Sign up for account"),
        "certificate_package_register_first":
            MessageLookupByLibrary.simpleMessage("No account? "),
        "certificate_package_register_second":
            MessageLookupByLibrary.simpleMessage(
                "Register for digital certificate"),
        "certificate_package_save_order_error":
            MessageLookupByLibrary.simpleMessage("Error: Unable to save order"),
        "certificate_package_sign_type_limit": MessageLookupByLibrary.simpleMessage(
            "The number of signings will be according to the package of signings purchased by customers"),
        "certificate_package_sign_type_no_limit":
            MessageLookupByLibrary.simpleMessage(
                "Unlimited number of signatures"),
        "certificate_package_user_form_info_item_fullname_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter your full name"),
        "certificate_package_user_form_info_item_fullname_label_text":
            MessageLookupByLibrary.simpleMessage("Full name"),
        "certificate_package_user_form_info_item_hint_search_text":
            MessageLookupByLibrary.simpleMessage("Enter search keywords"),
        "certificate_package_user_form_info_item_identitycard_number_hint_text":
            MessageLookupByLibrary.simpleMessage(
                "Enter the correct Citizen Identity/ID number"),
        "certificate_package_user_form_info_item_identitycard_number_label_text":
            MessageLookupByLibrary.simpleMessage("Citizen Identity/ID number"),
        "certificate_package_user_form_info_item_identitycard_type_label_text":
            MessageLookupByLibrary.simpleMessage("Type of certificate"),
        "certificate_package_user_form_info_item_issuedDate_label_text":
            MessageLookupByLibrary.simpleMessage("Date Range"),
        "certificate_package_user_form_info_item_issuedPlace_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter the place of issue"),
        "certificate_package_user_form_info_item_issuedPlace_label_text":
            MessageLookupByLibrary.simpleMessage("Issued by"),
        "certificate_package_user_form_info_item_nationlitys_label_text":
            MessageLookupByLibrary.simpleMessage("Nationality"),
        "certificate_package_user_form_info_item_text_group_first":
            MessageLookupByLibrary.simpleMessage(
                "Please enter the correct information: "),
        "certificate_package_user_form_info_item_text_group_second":
            MessageLookupByLibrary.simpleMessage("Citizen Identity/ID number"),
        "certificate_package_user_form_info_item_text_group_three":
            MessageLookupByLibrary.simpleMessage(
                "show exactly with the documents"),
        "certificate_package_user_form_info_item_text_group_title":
            MessageLookupByLibrary.simpleMessage(
                "Information of the holder of the digital certificate"),
        "certificate_package_validate_emailr_error":
            MessageLookupByLibrary.simpleMessage("Email invalidate"),
        "certificate_package_validate_input_error":
            MessageLookupByLibrary.simpleMessage(
                "Information cannot be left blank"),
        "certificate_package_validate_input_isnumeric_only_error":
            MessageLookupByLibrary.simpleMessage(
                "Information only enter numbers, do not enter characters"),
        "certificate_package_validate_input_special_error":
            MessageLookupByLibrary.simpleMessage(
                "Information must not contain special characters"),
        "certificate_package_validate_phone_error":
            MessageLookupByLibrary.simpleMessage(
                "Phone number is not in the correct format"),
        "certificate_packageuser_form_contact_certificate_info_item_email_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter email"),
        "certificate_packageuser_form_contact_certificate_info_item_email_label_text":
            MessageLookupByLibrary.simpleMessage("Email"),
        "certificate_packageuser_form_contact_certificate_info_item_phone_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter your phone number"),
        "certificate_packageuser_form_contact_certificate_info_item_phone_label_text":
            MessageLookupByLibrary.simpleMessage("Phone number"),
        "certificate_packageuser_form_contact_certificate_info_item_text_group":
            MessageLookupByLibrary.simpleMessage(
                "Contact information using digital certificates"),
        "certificate_packageuser_form_contact_certificate_info_item_text_group_desc":
            MessageLookupByLibrary.simpleMessage(
                "Please double check the correct phone number, email to receive service activation information."),
        "certificate_packageuser_form_contact_info_item_address_hint_text":
            MessageLookupByLibrary.simpleMessage(
                "Enter house number, street, street"),
        "certificate_packageuser_form_contact_info_item_address_label_text":
            MessageLookupByLibrary.simpleMessage("Detail address"),
        "certificate_packageuser_form_contact_info_item_districts_label_text":
            MessageLookupByLibrary.simpleMessage("District"),
        "certificate_packageuser_form_contact_info_item_province_label_text":
            MessageLookupByLibrary.simpleMessage("Province/City"),
        "certificate_packageuser_form_contact_info_item_text_group_desc":
            MessageLookupByLibrary.simpleMessage(
                "Use your permanent or work address to get your bill and get the fastest support."),
        "certificate_packageuser_form_contact_info_item_text_group_title":
            MessageLookupByLibrary.simpleMessage("Address"),
        "certificate_packageuser_form_contact_info_item_wards_label_text":
            MessageLookupByLibrary.simpleMessage("Wards"),
        "certificate_serial":
            MessageLookupByLibrary.simpleMessage("Serial digital certificate"),
        "changeDevice": MessageLookupByLibrary.simpleMessage("Change device"),
        "changeDeviceDescription": MessageLookupByLibrary.simpleMessage(
            "Select the digital certificate to change the device"),
        "changeDeviceDetailIntro": MessageLookupByLibrary.simpleMessage(
            "You can reactivate the certificate on another device when you want to change, lose the device, or lose the certificate key information"),
        "changeDeviceIntro": MessageLookupByLibrary.simpleMessage(
            "Change Device, Reactivate Online Certificate"),
        "changeDeviceOrder":
            MessageLookupByLibrary.simpleMessage("Change device"),
        "changeEmail": MessageLookupByLibrary.simpleMessage("Change email"),
        "changeInfo": MessageLookupByLibrary.simpleMessage("Change\nInfo"),
        "changeInfoCTS": MessageLookupByLibrary.simpleMessage(
            "Change certificate information"),
        "changeNameDescription": MessageLookupByLibrary.simpleMessage(
            "Users please name digital certificates to easily distinguish digital certificates when users use two or more digital certificates."),
        "changePIN": MessageLookupByLibrary.simpleMessage("Change PIN"),
        "changePassSuccess":
            MessageLookupByLibrary.simpleMessage("Change password success!"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "change_info":
            MessageLookupByLibrary.simpleMessage("Change information"),
        "checkingInfor":
            MessageLookupByLibrary.simpleMessage("Please wait a moment..."),
        "chi_hien_thi_logo":
            MessageLookupByLibrary.simpleMessage("3. Show only the logo"),
        "chi_hien_thi_text":
            MessageLookupByLibrary.simpleMessage("1. Display only text"),
        "chon_chu_ky": MessageLookupByLibrary.simpleMessage(
            "Touch anywhere to select signature"),
        "chon_tai_lieu":
            MessageLookupByLibrary.simpleMessage("Select document"),
        "chon_tep": MessageLookupByLibrary.simpleMessage("Select file"),
        "chooseDocumentToSign":
            MessageLookupByLibrary.simpleMessage("Choose document"),
        "chu_ky_ben_phai_logo_chu_ben_trai":
            MessageLookupByLibrary.simpleMessage(
                "Signature on the right, logo and text on the left"),
        "chu_ky_ben_trai_logo_chu_ben_phai":
            MessageLookupByLibrary.simpleMessage(
                "Signature on the left, logo and text on the right"),
        "chu_ky_giua":
            MessageLookupByLibrary.simpleMessage("Signature in the middle"),
        "chup_anh": MessageLookupByLibrary.simpleMessage("Take a photo"),
        "citizenId": m3,
        "citizenIdFullLabel":
            MessageLookupByLibrary.simpleMessage("Id/Tax number"),
        "citizenIdLabel": MessageLookupByLibrary.simpleMessage("ID/Tax"),
        "citizenIdentification":
            MessageLookupByLibrary.simpleMessage("Citizen identification"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "codeValidIn": MessageLookupByLibrary.simpleMessage(
            "The activation code is valid in "),
        "collapse": MessageLookupByLibrary.simpleMessage("Collapse"),
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "completed": MessageLookupByLibrary.simpleMessage("Done"),
        "config": MessageLookupByLibrary.simpleMessage("Config"),
        "configAutomaticCharacters": MessageLookupByLibrary.simpleMessage(
            "Configure automatic characters"),
        "configSignatureTemplate":
            MessageLookupByLibrary.simpleMessage("Config Signature template"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmCancel": MessageLookupByLibrary.simpleMessage("Confirm cancel"),
        "confirmInfo": MessageLookupByLibrary.simpleMessage("Confirm Info"),
        "confirmInformation":
            MessageLookupByLibrary.simpleMessage("Confirm information"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm new password"),
        "confirmPINDesc":
            MessageLookupByLibrary.simpleMessage("Re-enter PIN to confirm"),
        "confirmPINTitle": MessageLookupByLibrary.simpleMessage("Confirm PIN"),
        "confirmPassIsEmpty": MessageLookupByLibrary.simpleMessage(
            "Field confirm new password is not empty"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "confirmTransaction":
            MessageLookupByLibrary.simpleMessage("Confirm Transaction"),
        "connectTimeout":
            MessageLookupByLibrary.simpleMessage("Connect Timeout."),
        "contactCSKH": MessageLookupByLibrary.simpleMessage("Contact:"),
        "contactCustomerCare":
            MessageLookupByLibrary.simpleMessage("Customer Service Center"),
        "contactInfo": MessageLookupByLibrary.simpleMessage("Contact info"),
        "continueProcessing": MessageLookupByLibrary.simpleMessage("Continue"),
        "copied": MessageLookupByLibrary.simpleMessage("Copied"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
        "createPinTitle":
            MessageLookupByLibrary.simpleMessage("Create PIN code"),
        "createTransaction":
            MessageLookupByLibrary.simpleMessage("Create transaction"),
        "create_order_no_data_selected": MessageLookupByLibrary.simpleMessage(
            "No service packages selected"),
        "create_ticket_extension_error_description":
            MessageLookupByLibrary.simpleMessage(
                "Please contact Hotline 18001260 (branch 1) \nfree for support!"),
        "create_ticket_extension_error_label":
            MessageLookupByLibrary.simpleMessage(
                "Creation of extension request failed"),
        "creatingContract":
            MessageLookupByLibrary.simpleMessage("Creating a contract"),
        "creatingRequest": MessageLookupByLibrary.simpleMessage(
            "Creating a device change request"),
        "creating_extend_ticket_description": MessageLookupByLibrary.simpleMessage(
            "The system is creating an extension request, \nplease wait a moment...."),
        "creating_extend_ticket_label": MessageLookupByLibrary.simpleMessage(
            "Creating Service Extension Request Form"),
        "ctsPersonal": MessageLookupByLibrary.simpleMessage(
            "Personal digital certificate"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Current password"),
        "currentPasswordNotCorrect": MessageLookupByLibrary.simpleMessage(
            "Current password is not correct"),
        "cycle": MessageLookupByLibrary.simpleMessage("Cycle"),
        "danh_sach_chu_ky":
            MessageLookupByLibrary.simpleMessage("List of signatures"),
        "dataNotFound": MessageLookupByLibrary.simpleMessage("Data not found"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this account?"),
        "deleteLinkSystem":
            MessageLookupByLibrary.simpleMessage("Delete the link system"),
        "desAdviceBusiness": MessageLookupByLibrary.simpleMessage(
            "Please provide information for VNPT staff to assist in the registration of digital certificates for Corporate Organizations!"),
        "desCheckboxRequestBill": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the content on the Application Form"),
        "desErrorEkyc": MessageLookupByLibrary.simpleMessage(
            "Sorry, we couldn\'t verify your information. You only have 3 eKYC attempts.\n\nPlease follow the instructions exactly for the verification process to be correct.\nOr Contact VNPT staff for assistance in verifying information at the counter!"),
        "desErrorEkyc3times": MessageLookupByLibrary.simpleMessage(
            "Sorry, we could not verify your online registration information. Please contact VNPT staff for assistance in verifying information at the counter!"),
        "desListLinkSystem": MessageLookupByLibrary.simpleMessage(
            "List of link systems to perform digital signatures with automatic confirmation via OTP of the integrated Smart CA package"),
        "desRequestSentSuccessfully": MessageLookupByLibrary.simpleMessage(
            "VNPT sales staff will contact you. Please check your email or phone for support advice!"),
        "desSuccessfulAccountRegistration": MessageLookupByLibrary.simpleMessage(
            "Please choose to register for a digital certificate to use the VNPT SmartCA remote digital signing service!"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "detailAddress": MessageLookupByLibrary.simpleMessage("Detail address"),
        "detailDocSignature":
            MessageLookupByLibrary.simpleMessage("Detail document"),
        "deviceId": MessageLookupByLibrary.simpleMessage("Device\'s ID"),
        "deviceIdloggedIn":
            MessageLookupByLibrary.simpleMessage("DeviceId being logged in"),
        "deviceUsingThisCert": MessageLookupByLibrary.simpleMessage("Device"),
        "digitalCertificate":
            MessageLookupByLibrary.simpleMessage("Digital certificate"),
        "digitalSignature": MessageLookupByLibrary.simpleMessage("Sign"),
        "digitalSignatureDocument":
            MessageLookupByLibrary.simpleMessage("History"),
        "dinh_danh_file_ho_tro":
            MessageLookupByLibrary.simpleMessage("Supported file formats"),
        "district": MessageLookupByLibrary.simpleMessage("District"),
        "docSignatureHistory":
            MessageLookupByLibrary.simpleMessage("History of documents"),
        "documentList": m4,
        "documentPreview":
            MessageLookupByLibrary.simpleMessage("Document preview"),
        "document_exits": MessageLookupByLibrary.simpleMessage(
            "The document already exists in the list"),
        "drawYourSignature":
            MessageLookupByLibrary.simpleMessage("Draw your signature"),
        "dung_luong_vuot_qua_15mb":
            MessageLookupByLibrary.simpleMessage("Maximum file size is 15MB"),
        "editInformation":
            MessageLookupByLibrary.simpleMessage("Edit information"),
        "ekycErrorContactHotline": m5,
        "ekycFail":
            MessageLookupByLibrary.simpleMessage("Can not verify via EKYC"),
        "electronicSignature":
            MessageLookupByLibrary.simpleMessage("Electronic signature"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailContact": MessageLookupByLibrary.simpleMessage("Contact email"),
        "emailOnly": MessageLookupByLibrary.simpleMessage("Email"),
        "emailReceiveNotification":
            MessageLookupByLibrary.simpleMessage("Email"),
        "emptyData": MessageLookupByLibrary.simpleMessage("No data found"),
        "emptyDataFiltered": MessageLookupByLibrary.simpleMessage(
            "No packages match\nthe filter condition"),
        "emptyDescTransaction": MessageLookupByLibrary.simpleMessage(
            "No transactions to confirm yet"),
        "emptyOrderData": MessageLookupByLibrary.simpleMessage(
            "There are no orders\nthat match the filter criteria"),
        "empty_description": MessageLookupByLibrary.simpleMessage(
            "Please select the service package to continue"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enoughLength": m6,
        "enterAccountInformation":
            MessageLookupByLibrary.simpleMessage("Enter account information"),
        "enterActivateCode":
            MessageLookupByLibrary.simpleMessage("Enter activate code"),
        "enterAnything": m7,
        "enterCurrentPassword":
            MessageLookupByLibrary.simpleMessage("Enter current password"),
        "enterIdNumber": MessageLookupByLibrary.simpleMessage(
            "Enter the registered identifier Number of Certificates"),
        "enterNewPassword":
            MessageLookupByLibrary.simpleMessage("Enter new password"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
        "enterPhoneNumberForRegister": MessageLookupByLibrary.simpleMessage(
            "Please enter the correct registered phone number. Please check your email for phone number information."),
        "enterPinCode": MessageLookupByLibrary.simpleMessage("Enter PIN code"),
        "enterTextToSearchOrder":
            MessageLookupByLibrary.simpleMessage("Enter order code or name"),
        "enterThePackageNameToSearch": MessageLookupByLibrary.simpleMessage(
            "Enter the package name to search"),
        "err61000": MessageLookupByLibrary.simpleMessage(
            "Credential assignment key failed!"),
        "esealType": MessageLookupByLibrary.simpleMessage("Integrated Package"),
        "exist_order": MessageLookupByLibrary.simpleMessage(
            "There exists an order to change information/change equipment/renew for this digital certificate. Click View details to see more information!"),
        "expire_in_day": m8,
        "expired": MessageLookupByLibrary.simpleMessage("Expired"),
        "expired_alter_message": MessageLookupByLibrary.simpleMessage(
            "The customer\'s digital certificate has expired. Please register for a new digital certificate to continue using the subscription service."),
        "extend": MessageLookupByLibrary.simpleMessage("Extend"),
        "extend_now": MessageLookupByLibrary.simpleMessage("Extend now"),
        "faceIDDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Please use your FaceID to confirm"),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "featureDevelopment":
            MessageLookupByLibrary.simpleMessage("Feature under development"),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "fileName": MessageLookupByLibrary.simpleMessage("File name"),
        "filterByMonth": m9,
        "fingerprintDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Please use your fingerprint to confirm"),
        "finishTime": MessageLookupByLibrary.simpleMessage("Finish time"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "forgotPasswordScreen":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "free": MessageLookupByLibrary.simpleMessage("Free"),
        "fromDate": MessageLookupByLibrary.simpleMessage("From date"),
        "fullDocument": MessageLookupByLibrary.simpleMessage("ID/Passport"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
        "fullPolicyProtection": MessageLookupByLibrary.simpleMessage(
            "Customer\'s personal data protection policy (hereinafter referred to as \"Policy\") aims to inform Customers about Personal Data collected by TELECOMMUNICATION SERVICES CORPORATION (\"VNPT-VINAPHONE\") processing, processing purposes, processing methods, storage period, sharing of Personal Data, and Customer\'s rights regarding his/her Personal Data in accordance with the provisions of Vietnamese law on protection personal data. This Policy also provides recommendations for Customers to raise awareness of personal data protection to avoid unwanted damages that occur during the process of VNPT-Vinaphone processing Customer Personal Data. Row.\nThis Policy applies to all platforms (App, Web...), electronic information pages, interface channels, means, tools on VNPT-Vinaphone websites/applications including consulting. and signed a contract to provide services directly at VNPT-Vinaphone telecommunications service points.\nThis Policy includes the following contents:\nArticle 1. Definition terms\nArticle 2. Processing of personal data\nArticle 3. Purpose of processing personal data\nArticle 4. How personal data is processed\nArticle 5. Start time and end time of processing personal data\nArticle 6. Sharing personal data\nArticle 7. Storage of personal data\nArticle 8. Control of personal data\nArticle 9. Protection of personal data\nArticle 10. Unwanted consequences and damage are likely to occur\nArticle 11. Use of Cookies\nArticle 12. Advertising on the Internet and third parties\nArticle 13. Processing of personal data without the consent of the data subject\nArticle 14. Contact information\nArticle 15. Adjustment and amendment\nBy checking the box \"I have read and accepted VNPT-Vinaphone\'s personal data protection policy\", Customer confirms that he has read, understood, and accepted all terms and conditions specified in This Policy. This Policy is part of the terms and conditions of service provision and is an integral appendix to the Service Contract of each product or service that the Customer has established with VNPT-Vinaphone.\nArticle 1. TERMS DEFINITION\nFor the purposes of this Policy, unless the context requires otherwise, the following terms are understood and interpreted as follows:\n1.1. VNPT-Vinaphone means TELECOMMUNICATIONS SERVICES CORPORATION\n1.2. Customer means\n• Individuals or legal representatives of individuals using and/or interested in VNPT-Vinaphone Products and Services;\n• The individual or the legal representative of the individual has accessed and/or registered an account at websites and/or applications owned by VNPT-Vinaphone.\n1.3. Products and Services of VNPT-Vinaphone means\n• Products and services directly researched, developed and provided by VNPT-Vinaphone to Customers;\n• Products and services of the Posts and Telecommunications Group or products and services of units under the Posts and Telecommunications Group in which VNPT-Vinaphone is the representative to exercise the rights and obligations of the supplier service level;\n• Products and services provided by VNPT-Vinaphone in cooperation with third party(s) to Customers.\nArticle 2. PROCESSING OF PERSONAL DATA\n2.1 VNPT-Vinaphone processes Customer Personal Data in each specific case, including, but not limited to:\n• When the Customer or the Customer\'s legal representative contacts VNPT-Vinaphone to request advice on VNPT-Vinaphone Products and Services or express interest in VNPT-Vinaphone Products and Services ;\n• When Customers use Products and Services of VNPT-Vinaphone;\n• When Customers access and/or register accounts at websites and/or applications owned by VNPT-Vinaphone;\n• When Customer agrees to provide Personal Data to VNPT-Vinaphone through public sources, including but not limited to: meetings, events, seminars, conferences, social networks, or programs dialogues and discussions organized, sponsored or attended by VNPT-Vinaphone and/or from stored files (cookies) recorded on the VNPT-Vinaphone website;\n• When Customer allows a third party other than VNPT-Vinaphone to share Customer Personal Data with VNPT-Vinaphone;\n• When the Customer is a customer of an organization or enterprise to which VNPT-Vinaphone contributes capital or purchases shares;\n• When requested by competent state agencies.\n2.2 Customer Personal Data that VNPT-Vinaphone processes (hereinafter referred to as “Personal Data”) includes but is not limited to and may change depending on the product or service, respectively. Customer\'s cooperation with VNPT-Vinaphone:\n2.2.1. Basic personal data\na) Surname, middle name, birth name, other names (if any);\nb) Date, month and year of birth; date, month, year of death or disappearance;\nc) Gender;\nd) Place of birth, place of birth registration, permanent residence, temporary residence, current residence, hometown, contact address;\nd) Nationality;\ne) Image of the individual;\ng) Phone number, ID card number, personal identification number, passport number, driver\'s license number, license plate number, personal tax code number, social insurance number, insurance card number medical;\nh) Marital status;\ni) Information about family relationships (parents, children);\nk) Information about individuals\' digital accounts; Personal data reflecting activities and history of activities in cyberspace;\nl) Customer\'s telecommunications credit score: expressed in the form of a score, is the result of the process of VNPT-Vinaphone processing and analyzing data of customers using telecommunications services, in order to evaluate and analyze Analyze and predict activities such as habits, preferences, trust levels, behavior, locations, trends, capacities and other situations, supporting the provision of telecommunications products and services. of VNPT-Vinaphone to Customers in the best way.\n2.2.2. Sensitive personal data\na) Data on crimes and criminal acts are collected and stored by law enforcement agencies;\nb) Customer information of credit institutions, foreign bank branches, payment intermediary service providers, and other licensed organizations, including: customer identification information according to the provisions of law law, account information, deposit information, deposited asset information, transaction information, information about organizations and individuals that are guarantors at credit institutions, bank branches, organizations providing intermediary payment services;\nc) Data about the individual\'s location determined through location services.\n2.2.3. Other personal data does not belong to the group of basic personal data and sensitive personal data specified in Article 2.2.1 and Article 2.2.2.\n2.3. VNPT-Vinaphone will notify the Customer of the Personal Data required to be provided and/or optionally provided at the time of collecting the Customer\'s Personal Data. If required Personal Data is not provided as requested, Customer will not be able to use some Products and Services of VNPT-Vinaphone and/or VNPT-Vinaphone may refuse to provide Products and Services. VNPT-Vinaphone Service to Customers without having to pay any compensation and/or penalty.\n2.4. From time to time, Customer may voluntarily provide VNPT-Vinaphone with Personal Data beyond VNPT-Vinaphone\'s request. When Customer provides Personal Data to VNPT-Vinaphone for any reason, it means that Customer has agreed to allow VNPT-Vinaphone to process that Personal Data for the Purposes stated in this Policy. or for the purpose stated at the time the Customer provided such Personal Data. In addition, when proactively providing information beyond VNPT-Vinaphone\'s requirements, Customers please do not provide sensitive Personal Data as prescribed by law from time to time. VNPT-Vinaphone will not process and assume no legal responsibility for sensitive Personal Data voluntarily provided by Customers beyond VNPT-Vinaphone\'s request.\nArticle 3. PURPOSE OF PROCESSING PERSONAL DATA\nVNPT - Vinaphone may process Customer Personal Data for one or more of the following listed purposes (“Purposes”) including, but not limited to the following Purposes:\n3.1. Verify the accuracy and completeness of the information provided by the Customer; determine or authenticate the Customer\'s identity and carry out the Customer authentication process; Handling registration to use VNPT-Vinaphone Products and Services;\n3.2. Evaluate Customer\'s profile and eligibility to use VNPT-Vinaphone Products and Services. VNPT-Vinaphone can use scoring methods, assign hot charge thresholds, check Customer history of using VNPT-Vinaphone Products and Services to evaluate and manage credit risks, ensuring the ability to make payment for payment obligations and other related obligations during the process of providing VNPT-Vinaphone Products and Services to Customers;\n3.3. Manage and evaluate business activities including designing, improving and enhancing the quality of VNPT-Vinaphone Products and Services or performing marketing communication activities; Carry out market research, surveys and data analysis related to VNPT-Vinaphone Products and Services;\n3.4. Contact Customers to exchange information, resolve requests, complaints, deliver invoices, statements, reports or other documents related to VNPT-Vinaphone Products and Services through different channels (e.g. email, chat) and to respond to Customer requests. This includes contacting the Customer (or other necessary parties) to notify the Customer of information related to the use of VNPT-Vinaphone Products and Services;\n3.5. Advertising and marketing based on Customers\' interests and service usage habits: VNPT-Vinaphone may use Personal Data to advertise and market to Customers about VNPT-Vinaphone\'s Products and Services. Vinaphone, promotions, research, surveys, news, updated information, events, contests with prizes, relevant prizes, advertisements and related content about the Products , Services of VNPT-Vinaphone, products and services of units belonging to the ecosystem of Vietnam Posts and Telecommunications Group or of partners cooperating with VNPT-Vinaphone or cooperating with units under the Vietnam Posts and Telecommunications Group. In case the Customer does not want to receive periodic emails, text messages and/or newsletters for advertising and marketing purposes from VNPT-Vinaphone, the frequency depends on VNPT-Vinaphone\'s policies from time to time and in accordance with the regulations. legal regulations, Customers can check the box \"I do not want to receive any communications or notices for advertising or marketing purposes from VNPT-Vinaphone\" or contact VNPT-Vinaphone according to the contact information. contact specified in this Policy for support;\n3.6. Prepare financial reports, activity reports or other related reports as prescribed by law;\n3.7. Comply with legal obligations as prescribed by law;\n3.8. Prevent fraud or minimize threats to the lives, health of others and public interests: VNPT-Vinaphone may use Customer\'s personal information to prevent and detect fraud and abuse. used to protect Customers, VNPT-Vinaphone and related entities;\n3.9. Internal administration;\n3.10. Other purposes related to those mentioned above.\nArticle 4. HOW PERSONAL DATA IS PROCESSED\nVNPT-Vinaphone applies one or more activities affecting Personal Data such as: collecting, recording, analyzing, confirming, storing, editing, disclosing, combining, accessing, retrieving, revoking , encrypt, decrypt, copy, share, transmit, provide, transfer, delete, destroy personal data or other related actions.\nArticle 5. START TIME AND END TIME OF DATA PROCESSING\n5.1. Time to start data processing\nFrom the moment the Customer accepts this Policy.\n5.2. End time of data processing\nUnless otherwise prescribed by Vietnamese law or the Customer requests to terminate the processing of Customer Personal Data, VNPT-Vinaphone terminates the processing of Personal Data when the prescribed Purpose has been completed. in this Policy.\nArticle 6. SHARING PERSONAL DATA\n6.1. To carry out the Purposes specified in this Policy, VNPT-Vinaphone may share Customer Personal Data with:\n6.1.1. Subsidiaries and affiliated units of VNPT-Vinaphone, parent company Vietnam Posts and Telecommunications Group, affiliated and affiliated units of Vietnam Posts and Telecommunications Group: Some Products, VNPT-Vinaphone Services are provided by Vietnam Posts and Telecommunications Group, its affiliated and affiliated units in cooperation with VNPT-Vinaphone, therefore, the sharing of Personal Data with other subjects This is necessary and solely for the purpose of providing services to the Customer;\n6.1.2. Third party service providers: VNPT-Vinaphone uses and/or cooperates with other companies and individuals to carry out a number of tasks and programs such as promotional programs for Customers, market research , product analysis and development, strategic consulting, and provision of freight collection services. The Third Parties providing this service have the right to access, collect, use and process Personal Data necessary to perform their functions, including but not limited to advertising and referral activities. , providing other products/services within the ecosystem of Vietnam Posts and Telecommunications Group or of partners cooperating with Vietnam Posts and Telecommunications Group or collaborating with affiliated and related units. of Vietnam Posts and Telecommunications Group. Third parties providing these services must comply with Personal Data protection laws as Data Processors;\n6.1.3. Enterprise restructuring: During the business development process, VNPT-Vinaphone may sell or buy businesses or restructure businesses in accordance with legal regulations and production and business needs. In such transactions, Personal Data is one of the transferred business assets but the transferee remains subject to the provisions of this Policy;\n6.1.4. Protecting the legitimate rights and interests of VNPT-Vinaphone and other subjects: VNPT-Vinaphone is allowed to disclose Personal Data when VNPT-Vinaphone has grounds to believe that this disclosure is required by law, upon request. required by a state regulatory agency, to enforce or apply other VNPT-Vinaphone terms and agreements or to protect the rights, property or security of VNPT-Vinaphone, VNPT-Vinaphone customers, or any other subject. The above tasks may include exchanging information with other companies and organizations to prevent and detect fraud and reduce property and credit risk, or disclosing certain types of information. in case VNPT-Vinaphone receives a legally binding request from competent state agencies;\n6.1.5. Depending on the Customer\'s choice: In addition to the above cases, Personal Data may be shared with third parties for the purposes specified in Article 3.5 of this Policy and the Customer will have the right to not consent. information sharing as prescribed in Article 8.4 of this Policy.\n6.2. VNPT-Vinaphone does not Practice sharing Personal Data for profit purposes.\nArticle 7. STORAGE OF PERSONAL DATA\n7.1. Customer Personal Data stored by VNPT-Vinaphone will be kept confidential. VNPT-Vinaphone, within its capabilities, will endeavor to take reasonable measures to protect Customer Personal Data.\n7.2. Location where Personal Data is stored\nTo the extent permitted by law, VNPT-Vinaphone may store Customer Personal Data in Vietnam and abroad, including on cloud computing storage solutions. VNPT-Vinaphone applies data security standards in accordance with current legal regulations.\n7.3. Personal Data storage period\nVNPT-Vinaphone only stores Customer Personal Data for a period of time necessary and reasonable to fulfill the Purposes. In case current law has regulations on the retention period of Personal Data even after completing the Purposes stated in this Policy, VNPT-Vinaphone is obliged to comply with the provisions of law.\nArticle 8. CONTROL OF PERSONAL DATA\n8.1. Right to Know and Right to Consent\nThrough this Policy, VNPT-Vinaphone notifies Customers about the processing of Customer\'s Personal Data before processing Personal Data. At the same time, Customers have the right to agree or disagree with the terms and conditions of this Policy by checking or unchecking the box \"I have read and accepted VNPT\'s personal data protection policy- Vinaphone”.\n8.2. Right to access and request Personal Data\nCustomers have the right to access VNPT-Vinaphone\'s applications/websites and/or contact VNPT-Vinaphone directly to check and extract Personal Data that Customers have provided for VNPT-Vinaphone to serve. the Purposes set forth in this Policy. In case the Customer cannot access, extract or has difficulty accessing or extracting Personal Data, the Customer can contact VNPT-Vinaphone for support.\n8.3. Editing rights\nCustomers have the right to edit their Personal Data provided that this correction does not violate the provisions of law. In case the Customer cannot edit or has difficulty editing Personal Data, the Customer can contact VNPT-Vinaphone for support.\n8.4. Right to object, restrict, withdraw consent to data processing\nIn case the Customer does not want to receive marketing, advertising and promotional content from VNPT-Vinaphone and wants to withdraw previous consent (if any) and/or object to the continued use of his/her personal information for For the above purposes, please check the box \"I do not want to receive any communications or notices for advertising or marketing purposes from VNPT-Vinaphone\" at the time VNPT-Vinaphone collects personal data, or Submit a refusal to advertising services according to the guided syntax (or other methods as specified in the relevant contract with the Customer) or contact VNPT-Vinaphone according to the information provided in this Policy. If Customers do not want to receive notifications from VNPT-Vinaphone\'s application, please adjust the notification settings in your application or device.\n8.5. Right to erasure of Personal Data\nThe Customer has the right to request VNPT-Vinaphone to delete the Customer\'s Personal Data provided that the Customer\'s request must comply with the provisions of law on providing telecommunications products and services and technology. information technology. However, requesting deletion of Personal Data may result in VNPT-Vinaphone being unable to provide some VNPT-Vinaphone Products and Services to Customers, which means that VNPT-Vinaphone may Unilaterally terminate the contract without having to compensate the Customer because the conditions for performing the contract have changed. Therefore, VNPT-Vinaphone recommends that Customers consider carefully before requesting VNPT-Vinaphone to delete Personal Data.\n8.6. Right to complain\nCustomers have the right to complain directly to VNPT-Vinaphone or to a competent state agency in case the Customer believes that VNPT-Vinaphone violates the provisions of law related to the protection of Personal Data.\nArticle 9. PROTECTION OF PERSONAL DATA\n9.1. Obligations of VNPT-Vinaphone\nVNPT-Vinaphone strives to ensure that Customer Personal Data is protected from violations of regulations on Personal Data protection. VNPT-Vinaphone maintains this commitment to protecting Personal Data by applying physical, electronic and managerial measures to protect Personal Data, including:\n• VNPT-Vinaphone\'s official website servers are protected by a \"firewall\" and VNPT-Vinaphone\'s system is always checked to prevent violations of data protection regulations. Individual;\n• VNPT-Vinaphone will take all reasonable steps to ensure that Customer Personal Data, Personal Data provided by Personal Data Controller Partners are not retained longer than necessary and that VNPT-Vinaphone will always comply with legal requirements related to the storage of Personal Data. 9.2. Customer Obligations\nCustomers are responsible for protecting their Personal Data as follows:\n• Proactively take measures to help prevent unauthorized access to passwords, account management and use, and mobile devices (including but not limited to smartphones, computers, tablet, laptop) by logging out of your account after use, setting a strong and difficult-to-guess password and keeping your login information and password secret. VNPT-Vinaphone is excluded from liability to the Customer in case the Customer\'s password is disclosed/lost, stolen or compromised, or any activity on the Customer\'s account uses an unauthorized or lost password. /lost mobile device leads to unauthorized people using the service arbitrarily or the system being illegally violated by a third party even though VNPT-Vinaphone has fully implemented measures to protect the system system;\n• Customers are responsible for updating documents adjusting this Policy (if any) on VNPT-Vinaphone\'s official information channels;\n• Once you have accepted all the terms and conditions of this Policy, the Customer is responsible for providing accurate and complete Personal Data as requested by VNPT-Vinaphone and carrying out the responsibilities of notifying the Company. VNPT-Vinaphone immediately upon discovering a violation of regulations on personal data protection. Customer may proactively provide Personal Data beyond VNPT-Vinaphone\'s request provided that Customer must comply with the provisions of Article 2.4 of this Policy;\n• Customers are responsible for respecting the Personal Data of other subjects and implementing legal regulations on personal data protection, participating in preventing and combating violations of regulations on personal data protection. Core.\nArticle 10. UNWANTED CONSEQUENCES AND DAMAGES ARE POSSIBLE TO OCCUR\n10.1. VNPT-Vinaphone uses many different information security technologies to protect Customer Personal Data from being retrieved, used or shared unintentionally. However, no data can be 100% secure. Therefore, VNPT-Vinaphone commits to maximum security of Customer Personal Data. Some unwanted consequences and damages that may occur include but are not limited to:\n• Hardware and software errors during the processing of Personal Data cause loss of Customer Personal Data;\n• The security hole is beyond the control of VNPT-Vinaphone, the system was attacked by hackers, causing the Customer\'s Personal Data to be exposed;\n• Customers self-disclose Customer Personal Data due to: carelessness or fraud; Visit websites/download applications containing malware.\n10.2. VNPT-Vinaphone recommends that Customers strictly implement their Personal Data protection responsibilities as prescribed in Article 9.2 of this Policy and according to the provisions of law.\n10.3. In case the data storage server is attacked by hackers leading to loss of Customer Personal Data, VNPT-Vinaphone will be responsible for reporting the incident to the investigating authorities for timely handling and notification. let Customers know.\nArticle 11. USE OF COOKIES\n11.1. Cookies may be used on VNPT-Vinaphone\'s website. “Cookies” are small text files stored on the Customer\'s computer hard drive to help customize the website experience for users. VNPT-Vinaphone has a cookie use policy to make website navigation easier and facilitate the login process. Website statistical data is processed by third parties, and therefore the Customer\'s IP address will be passed to third parties for statistical reporting purposes only.\n11.2. When VNPT-Vinaphone collects information through VNPT-Vinaphone\'s website, VNPT-Vinaphone automatically collects non-personal information related to the use of the website but does not identify users including but not limited to: not limited to: personal computer IP address, Internet service provider IP address, date and time of website access, operating system, items accessed on the website, downloaded content from the website and the website address directly led you to the website of VNPT-Vinaphone. VNPT-Vinaphone may use this non-personal information to serve statistical reports on website visitor traffic and website usage behavior. This analytical information is not capable of identifying the Customer\'s identity.\n11.3. In case the Customer does not want to use cookies, most web browsers allow users to refuse cookies by changing the privacy settings on the browser. Refusing cookies has virtually no effect on site navigation. However, some website functions may be affected. After completing the website visit, the Customer can still delete cookies from the system if desired.\nArticle 12. INTERNET AND THIRD PARTY ADVERTISING\nVNPT-Vinaphone\'s applications/websites may include third-party advertisements and links to other websites and applications. Third party advertising partners may Collect information about Customers when Customers interact with their content, advertising or services. Any access to and use of third party links or websites is not governed by this Policy, but instead is governed by the privacy policies of those third parties. VNPT-Vinaphone is not responsible for the information regulations of third parties.\nArticle 13. PROCESSING OF PERSONAL DATA WITHOUT THE CONSENT OF THE DATA SUBJECT\nVNPT-Vinaphone may process Personal Data without the Data Subject\'s consent in the following cases:\n13.1. In an emergency, it is necessary to immediately process relevant Personal Data to protect the life and health of the data subject or other people;\n13.2. Disclosure of personal data in accordance with the law;\n13.3. Data processing by competent state agencies in the event of an emergency regarding national defense, national security, social order and safety, major disasters, and dangerous epidemics; when there is a threat to security and national defense but not to the extent of declaring a state of emergency; prevent and combat riots, terrorism, prevent and combat crimes and violations of the law according to the provisions of law;\n13.4. To perform the data subject\'s contractual obligations with relevant agencies, organizations and individuals according to the provisions of law;\n13.5. Serving the activities of state agencies regulated by specialized laws.\nArticle 14. CONTACT INFORMATION\nIf Customers have any questions about this Policy or want to exercise their rights related to Personal Data, please contact VNPT-Vinaphone using the methods and information below:\n• Contact the switchboard according to information on the official websites/applications of VNPT-Vinaphone from time to time.\n• Send official dispatch to VNPT-Vinaphone headquarters at Vinaphone Building, Xuan Tao Street, Xuan La Ward, Tay Ho District, Hanoi.\n• Contact directly at VNPT-Vinaphone transaction points nationwide.\n• Other contact methods such as Livechat, contact via the official fanpage of VNPT-Vinaphone, customer care email are provided to customers at all times.\nArticle 15. ADJUSTMENT AND AMENDMENT\nVNPT-Vinaphone may adjust this Policy at any time and publicly post the adjusted Policy on VNPT-Vinaphone\'s official information channels. The Customer\'s continued use of VNPT-Vinaphone\'s Products and Services and no complaints regarding the adjusted Policy is understood to mean that the Customer has accepted that adjusted Policy of VNPT-Vinaphone."),
        "gender": MessageLookupByLibrary.simpleMessage("Gender"),
        "generateCerKey":
            MessageLookupByLibrary.simpleMessage("Initialize key"),
        "getAdvice": MessageLookupByLibrary.simpleMessage("Get advice"),
        "getAuthenticationFailed":
            MessageLookupByLibrary.simpleMessage("Get Authentication Failed."),
        "gettingCert":
            MessageLookupByLibrary.simpleMessage("Getting certificate..."),
        "giao_dich": MessageLookupByLibrary.simpleMessage("transaction"),
        "goHome": MessageLookupByLibrary.simpleMessage("Back to mainpage"),
        "goToSettingsButton":
            MessageLookupByLibrary.simpleMessage("Go to settings"),
        "handlingInstructions":
            MessageLookupByLibrary.simpleMessage("Handling instructions"),
        "hashSign": MessageLookupByLibrary.simpleMessage("Sign hash"),
        "hashTranTypeDesc": MessageLookupByLibrary.simpleMessage("Sign hash"),
        "haveNotYetTransaction":
            MessageLookupByLibrary.simpleMessage("Have not yet transaction"),
        "here": MessageLookupByLibrary.simpleMessage("here"),
        "hideCTSInListScreen": MessageLookupByLibrary.simpleMessage(
            "Hide this certificate from list"),
        "hien_thi_text_hinh_nen": MessageLookupByLibrary.simpleMessage(
            "5. Display text and background image"),
        "hien_thi_text_logo_ben_trai": MessageLookupByLibrary.simpleMessage(
            "2. Display text and logo on the left"),
        "hien_thi_text_logo_ben_trai_chu": MessageLookupByLibrary.simpleMessage(
            "6. Display text, left logo and signature"),
        "hien_thi_text_logo_tren": MessageLookupByLibrary.simpleMessage(
            "4. Display text and logo above"),
        "hinh_nen": MessageLookupByLibrary.simpleMessage("Background image"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "hotline": MessageLookupByLibrary.simpleMessage("Hotline"),
        "huy_tat_ca": MessageLookupByLibrary.simpleMessage("Cancel all"),
        "iAgreeTerms": MessageLookupByLibrary.simpleMessage(
            "I agree with the terms of VNPT Vinaphone\'s personal data protection policy "),
        "iAgreeWith": MessageLookupByLibrary.simpleMessage("I agree to "),
        "iDontWantReceive": MessageLookupByLibrary.simpleMessage(
            "I do not want to receive any communications or notifications for the purpose of advertising and marketing from VNPT-Vinaphone."),
        "iOSLockOut": MessageLookupByLibrary.simpleMessage(
            "\'Biometric authentication is disabled. Please lock and unlock your screen to enable it."),
        "iReadAndAgree": MessageLookupByLibrary.simpleMessage(
            "I have read and agree to the Personal Data Protection Policy of VNPT-Vinaphone."),
        "iUnderstand": MessageLookupByLibrary.simpleMessage("I understand"),
        "idEkyc": MessageLookupByLibrary.simpleMessage(
            "Valid Identity Card and not a copy/scanned copy"),
        "idNumber": MessageLookupByLibrary.simpleMessage("Identifier number"),
        "idRepreEkyc": MessageLookupByLibrary.simpleMessage(
            "Identity Card of legal representative  and not a copy/scanned copy"),
        "identification": MessageLookupByLibrary.simpleMessage("Identity"),
        "identificationCardType":
            MessageLookupByLibrary.simpleMessage("Identification card type"),
        "identificationNumber":
            MessageLookupByLibrary.simpleMessage("Identification number"),
        "idleLoading":
            MessageLookupByLibrary.simpleMessage("Pull up to load more"),
        "ifDeletePleaseMake": m10,
        "importantInfo":
            MessageLookupByLibrary.simpleMessage("Full name, ID number"),
        "inProgress": MessageLookupByLibrary.simpleMessage("Processing"),
        "included10VAT":
            MessageLookupByLibrary.simpleMessage("10% VAT included"),
        "individualBusinessHouseholds": MessageLookupByLibrary.simpleMessage(
            "Individual business households"),
        "individualsUnderBusinessOrganizations":
            MessageLookupByLibrary.simpleMessage(
                "Individuals under Business Organizations"),
        "infoBuySignature": MessageLookupByLibrary.simpleMessage(
            "Information to buy signatures packages"),
        "informationOnRegistrationOfDigitalCertificates":
            MessageLookupByLibrary.simpleMessage(
                "Information on registration of digital certificates"),
        "informationRegistration":
            MessageLookupByLibrary.simpleMessage("Information registration"),
        "information_buy_packages":
            MessageLookupByLibrary.simpleMessage("Order package infomation"),
        "initialTime": MessageLookupByLibrary.simpleMessage("Create time"),
        "initializePIN": MessageLookupByLibrary.simpleMessage("Initialize PIN"),
        "initializePINTitle": MessageLookupByLibrary.simpleMessage(
            "Personal PIN is used to protect your digital signature"),
        "initializingKeyPair":
            MessageLookupByLibrary.simpleMessage("Initializing key pair"),
        "initializingKeyPairDescription": MessageLookupByLibrary.simpleMessage(
            "The system is initializing the key pair.\nPlease wait a moment..."),
        "initializingTheService":
            MessageLookupByLibrary.simpleMessage("Initializing the service"),
        "inputNameDoc":
            MessageLookupByLibrary.simpleMessage("Enter document name"),
        "inputOTP":
            MessageLookupByLibrary.simpleMessage("Enter authentication code"),
        "inputOTPVerify": MessageLookupByLibrary.simpleMessage(
            "Enter OTP for authentication"),
        "inputReferralCode":
            MessageLookupByLibrary.simpleMessage("Type referral code"),
        "inputRequired": m11,
        "introEkycTitle": MessageLookupByLibrary.simpleMessage(
            "Your account needs identity verification, please prepare:"),
        "introPinCode": MessageLookupByLibrary.simpleMessage(
            "PIN code that authenticates your digital signature transactions and protects your digital certificate key pair!"),
        "invalidPIN": MessageLookupByLibrary.simpleMessage("Invalid PIN"),
        "invalidParameter":
            MessageLookupByLibrary.simpleMessage("Invalid Parameter."),
        "invalidToken": MessageLookupByLibrary.simpleMessage("Invalid token"),
        "invoiceInformation":
            MessageLookupByLibrary.simpleMessage("Invoice information"),
        "issueDate": MessageLookupByLibrary.simpleMessage("Issue Date"),
        "issuer": MessageLookupByLibrary.simpleMessage("Issuer"),
        "kieu_hien_thi": MessageLookupByLibrary.simpleMessage("Display style"),
        "ky_boi": MessageLookupByLibrary.simpleMessage("Signed by"),
        "ky_nang_cao": MessageLookupByLibrary.simpleMessage("Advanced signing"),
        "ky_tat_ca": MessageLookupByLibrary.simpleMessage("Sign all"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "linkSystem": MessageLookupByLibrary.simpleMessage("Link system"),
        "link_view_service_pack_order_history_page":
            MessageLookupByLibrary.simpleMessage(
                "View the history buy service packages"),
        "linking": MessageLookupByLibrary.simpleMessage("Linking"),
        "listFileEmpty":
            MessageLookupByLibrary.simpleMessage("Have no file to preview"),
        "listLinkSystem":
            MessageLookupByLibrary.simpleMessage("List of link systems"),
        "listOfDocumentToBeSigned": MessageLookupByLibrary.simpleMessage(
            "List of documents to be signed"),
        "listPacks": m12,
        "listTransactions":
            MessageLookupByLibrary.simpleMessage("List of transactions"),
        "list_document_sign_empty": MessageLookupByLibrary.simpleMessage(
            "No sign transaction information"),
        "list_document_sign_limited": MessageLookupByLibrary.simpleMessage(
            "Each digital signing transaction can only take up to 10 files"),
        "listsigned": MessageLookupByLibrary.simpleMessage("Signed list"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "loadingCert": MessageLookupByLibrary.simpleMessage(
            "Getting certificate, please wait a moment..."),
        "loginDetailIntro": MessageLookupByLibrary.simpleMessage(
            "You can switch and use multiple accounts on one device"),
        "loginIntro": MessageLookupByLibrary.simpleMessage(
            "Sign in to multiple accounts on one device"),
        "luot": MessageLookupByLibrary.simpleMessage("turn"),
        "makePaymentAgain":
            MessageLookupByLibrary.simpleMessage("Make payment again"),
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "maxLength": m13,
        "maxSizeUpload": MessageLookupByLibrary.simpleMessage("Max size: 15MB"),
        "maybeLater": MessageLookupByLibrary.simpleMessage("Maybe Later"),
        "minLength": m14,
        "missingCorner":
            MessageLookupByLibrary.simpleMessage("Advoid take missing-conrner"),
        "money": MessageLookupByLibrary.simpleMessage("Money"),
        "month_text": MessageLookupByLibrary.simpleMessage("Month"),
        "msgAccountActived": m15,
        "msgAccountNotFound": m16,
        "nameBusiness": MessageLookupByLibrary.simpleMessage(
            "Name of Agency/Organization/Enterprise"),
        "nameBusinessPersonal": MessageLookupByLibrary.simpleMessage(
            "Name of Agency/Organization/Individual"),
        "nameContact":
            MessageLookupByLibrary.simpleMessage("Contact person\'s name"),
        "nameDoc": MessageLookupByLibrary.simpleMessage("Document name"),
        "nameFor": MessageLookupByLibrary.simpleMessage("Name for"),
        "nameForCTS":
            MessageLookupByLibrary.simpleMessage("Rename certificate"),
        "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
        "newCertOrder":
            MessageLookupByLibrary.simpleMessage("Buy digital certificate"),
        "newFeatures": MessageLookupByLibrary.simpleMessage("New Features"),
        "newImplement": MessageLookupByLibrary.simpleMessage("New implement"),
        "newPassIsEmpty": MessageLookupByLibrary.simpleMessage(
            "Field new password is not empty"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "newRegistration":
            MessageLookupByLibrary.simpleMessage("New Registration"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "nextAssignKey":
            MessageLookupByLibrary.simpleMessage("Next step: Activate keypair"),
        "nextSignBbnt": MessageLookupByLibrary.simpleMessage(
            "Next step: Sign acceptance minutes"),
        "nextStepPin":
            MessageLookupByLibrary.simpleMessage("Next step: Create PIN"),
        "nha_noi_dung_chu_ky":
            MessageLookupByLibrary.simpleMessage("Enter content"),
        "nhap_ten": MessageLookupByLibrary.simpleMessage("Enter a name"),
        "noAccount": MessageLookupByLibrary.simpleMessage("No account"),
        "noInternet":
            MessageLookupByLibrary.simpleMessage("No Internet Connection."),
        "noStep": m17,
        "noSystemsLinkYet": MessageLookupByLibrary.simpleMessage(
            "No systems have been linked yet.\nPlease follow the instructions "),
        "no_exist_cert_valid": MessageLookupByLibrary.simpleMessage(
            "There is no active digital certificate"),
        "notAuthenticated":
            MessageLookupByLibrary.simpleMessage("Not Authenticated."),
        "notFoundUid": MessageLookupByLibrary.simpleMessage(
            "User\'s information not found"),
        "notPhysicalDevice": MessageLookupByLibrary.simpleMessage(
            "You are running the application on a virtual device. Please install the app on a real device."),
        "notSecureDevice": MessageLookupByLibrary.simpleMessage(
            "Your device is not secure enough to run the application."),
        "notSupportBiometrics": MessageLookupByLibrary.simpleMessage(
            "Device does not support biometrics"),
        "notSupportExt": MessageLookupByLibrary.simpleMessage(
            "The application does not support preview of "),
        "notSupportViewFile": MessageLookupByLibrary.simpleMessage(
            "Does not support viewing unconfirmed transaction documents"),
        "notUseeSeal": MessageLookupByLibrary.simpleMessage(
            "Accounts without Digital Certificates use the integration package."),
        "noteEkyc": MessageLookupByLibrary.simpleMessage("Note:"),
        "noteIdentifier": MessageLookupByLibrary.simpleMessage(
            "Note: This identification number is used as the UserName!"),
        "noteInformationAddress": MessageLookupByLibrary.simpleMessage(
            "Note: The address information will be displayed on the digital certificate. In case of change, please choose again"),
        "notePhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Note: This phone number will be used to receive the transaction verification code!"),
        "noticeOfInvoice":
            MessageLookupByLibrary.simpleMessage("Notice of Invoice"),
        "noticeWhenPasswordChange": MessageLookupByLibrary.simpleMessage(
            "Your password has changed. Please login again."),
        "notice_cert_action_for_business_account": m18,
        "notice_support_business_customer_change_info":
            MessageLookupByLibrary.simpleMessage(
                "Please contact Hotline 18001260 (branch 1) toll-free for support in changing digital certificate information for businesses"),
        "notifActiveCerOtherDevice": MessageLookupByLibrary.simpleMessage(
            "The certificate is not registered on this device. Please use the registered device to continue activating the certificate. In case of loss or change of device, click Confirm to activate the certificate on the new device!"),
        "notify_extend_personal_sign_success":
            MessageLookupByLibrary.simpleMessage(
                "Initialization service package successful!"),
        "numberOfSignatures":
            MessageLookupByLibrary.simpleMessage("Number of signatures"),
        "numberOfUnusedTurns":
            MessageLookupByLibrary.simpleMessage("Number of Unused Turns"),
        "numberWaitingActiveCer": m19,
        "oldPassIsEmpty": MessageLookupByLibrary.simpleMessage(
            "Field old password is not empty"),
        "oldPassword": MessageLookupByLibrary.simpleMessage("Old password"),
        "oldPasswordWrong":
            MessageLookupByLibrary.simpleMessage("Wrong old password"),
        "orSelectScanQRCodeToAutomaticallyEnterInformation":
            MessageLookupByLibrary.simpleMessage(
                "Or select Scan QR code to automatically enter information!"),
        "orderAPPROVE_REQUEST_CERT_ERROR":
            MessageLookupByLibrary.simpleMessage("Browse request failed"),
        "orderAPPROVE_REQUEST_CERT_WAITING":
            MessageLookupByLibrary.simpleMessage(
                "Waiting for digital certificate approval"),
        "orderCANCELED": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "orderCONTRACT_CREATE_ERROR":
            MessageLookupByLibrary.simpleMessage("Contract creation failed"),
        "orderCONTRACT_CREATE_WAITING": MessageLookupByLibrary.simpleMessage(
            "Waiting for contract generation"),
        "orderCONTRACT_SIGN_ERROR":
            MessageLookupByLibrary.simpleMessage("Contract signing failed"),
        "orderCONTRACT_SIGN_WAITING": MessageLookupByLibrary.simpleMessage(
            "Waiting for contract signing"),
        "orderCode": MessageLookupByLibrary.simpleMessage("Order code"),
        "orderDONE": MessageLookupByLibrary.simpleMessage("Done"),
        "orderDate": MessageLookupByLibrary.simpleMessage("Order time"),
        "orderDetailCert": MessageLookupByLibrary.simpleMessage(
            "Digital certificate package information"),
        "orderEKYC_ERROR":
            MessageLookupByLibrary.simpleMessage("eKYC validation failed"),
        "orderEKYC_WAITING": MessageLookupByLibrary.simpleMessage(
            "Waiting for eKYC verification"),
        "orderKEY_ASSIGN_ERROR": MessageLookupByLibrary.simpleMessage(
            "Initialization of key pair failed"),
        "orderKEY_ASSIGN_WATING": MessageLookupByLibrary.simpleMessage(
            "Waiting for key pair initialization"),
        "orderList": MessageLookupByLibrary.simpleMessage("My Orders"),
        "orderNoteContent": MessageLookupByLibrary.simpleMessage(
            "Please contact Call Center (18001260) branch 1 if the order is in the following states:"),
        "orderNoteContentState1":
            MessageLookupByLibrary.simpleMessage("Contract creation failed."),
        "orderNoteContentState2":
            MessageLookupByLibrary.simpleMessage("Contract signing failed."),
        "orderNoteContentState3":
            MessageLookupByLibrary.simpleMessage("Request creation failed."),
        "orderNoteContentState4":
            MessageLookupByLibrary.simpleMessage("Record sync failed."),
        "orderONEBSS_SUBMIT_ERROR":
            MessageLookupByLibrary.simpleMessage("Profile sync failed"),
        "orderONEBSS_SUBMIT_WAITING": MessageLookupByLibrary.simpleMessage(
            "Waiting for submission to OneBSS"),
        "orderOTP_ERROR":
            MessageLookupByLibrary.simpleMessage("OTP validation failed"),
        "orderOTP_WAITING": MessageLookupByLibrary.simpleMessage(
            "Waiting for OTP authentication"),
        "orderPAYMENT_ERROR":
            MessageLookupByLibrary.simpleMessage("Payment failed"),
        "orderPAYMENT_WAITING":
            MessageLookupByLibrary.simpleMessage("Waiting for online payment"),
        "orderREJECT_REQUEST_CERT":
            MessageLookupByLibrary.simpleMessage("Deny request"),
        "orderREQUESTCERT_ERROR": MessageLookupByLibrary.simpleMessage(
            "Generation request renewal failed"),
        "orderREQUESTCERT_WATING": MessageLookupByLibrary.simpleMessage(
            "Waiting for a request to create a digital certificate"),
        "order_canceled": MessageLookupByLibrary.simpleMessage("Canceled"),
        "order_free": MessageLookupByLibrary.simpleMessage("Free"),
        "order_history_page_title":
            MessageLookupByLibrary.simpleMessage("Order history"),
        "order_new":
            MessageLookupByLibrary.simpleMessage("Wait for initialization"),
        "order_paid":
            MessageLookupByLibrary.simpleMessage("Wait for initialization"),
        "order_success": MessageLookupByLibrary.simpleMessage("Success"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "otpExpiredTime": MessageLookupByLibrary.simpleMessage(
            "Authenticate token will expire later"),
        "otpSendToPhone": MessageLookupByLibrary.simpleMessage(
            "OTP has been sent to the phone number"),
        "package": MessageLookupByLibrary.simpleMessage("Package"),
        "package_information":
            MessageLookupByLibrary.simpleMessage("Package information"),
        "page_servive_pack_order_desc": MessageLookupByLibrary.simpleMessage(
            "You have successfully purchased the service package."),
        "page_servive_pack_order_title":
            MessageLookupByLibrary.simpleMessage("Payment orders"),
        "passport": MessageLookupByLibrary.simpleMessage("Passport"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordDuplicate": MessageLookupByLibrary.simpleMessage(
            "New password duplicate with the old password"),
        "passwordNotMatch":
            MessageLookupByLibrary.simpleMessage("Password does not match"),
        "pause": MessageLookupByLibrary.simpleMessage("Pause"),
        "pay": MessageLookupByLibrary.simpleMessage("Pay"),
        "paymentDone": MessageLookupByLibrary.simpleMessage("Paid"),
        "paymentFailed": MessageLookupByLibrary.simpleMessage("Payment failed"),
        "paymentSuccess":
            MessageLookupByLibrary.simpleMessage("Payment success"),
        "paymentWaiting": MessageLookupByLibrary.simpleMessage("Not yet paid"),
        "personal": MessageLookupByLibrary.simpleMessage("Personal"),
        "personalDataProtectionPolicy": MessageLookupByLibrary.simpleMessage(
            "Personal data protection policy"),
        "personalInBusiness": MessageLookupByLibrary.simpleMessage("Staff"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone number"),
        "phoneContact":
            MessageLookupByLibrary.simpleMessage("Contact phone number"),
        "phoneNumberIncorrect":
            MessageLookupByLibrary.simpleMessage("Incorrect phone number"),
        "phoneNumberVerification":
            MessageLookupByLibrary.simpleMessage("Phone number verification"),
        "pinCodeJustInclude": MessageLookupByLibrary.simpleMessage(
            "PIN code contains only numeric characters, does not include spaces and alphanumeric characters, special characters."),
        "pinCodeNotInclude": MessageLookupByLibrary.simpleMessage(
            "PIN code does not include consecutive or duplicate numbers."),
        "pinDialogButton": MessageLookupByLibrary.simpleMessage("Confirm"),
        "pinDialogConfirmCancel": MessageLookupByLibrary.simpleMessage(
            "Please enter your PIN to cancel transaction"),
        "pinDialogConfirmSignDigitalTitle":
            MessageLookupByLibrary.simpleMessage(
                "Please enter your PIN to confirm transaction"),
        "pinDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Enter the PIN to activate the digital signing key pair"),
        "pinValidateNotMatch":
            MessageLookupByLibrary.simpleMessage("PIN code does not match"),
        "pinValidateSequence": MessageLookupByLibrary.simpleMessage(
            "PIN codes cannot be consecutive numbers"),
        "pinValidateSixDigit": MessageLookupByLibrary.simpleMessage(
            "Please enter a 6-digit PIN codes"),
        "pinValidateTheSame": MessageLookupByLibrary.simpleMessage(
            "PIN codes cannot be the same numbers"),
        "placeOfIssue": MessageLookupByLibrary.simpleMessage("Place of issue"),
        "pleaseAddYourSignature":
            MessageLookupByLibrary.simpleMessage("Please add your signature"),
        "pleaseCheckTheCorrectInformation":
            MessageLookupByLibrary.simpleMessage(
                "Please check the correct information: "),
        "pleaseChooseDateValid": MessageLookupByLibrary.simpleMessage(
            "Start date must be earlier than end date!"),
        "pleaseChooseEndDate":
            MessageLookupByLibrary.simpleMessage("Please choose an end date!"),
        "pleaseChooseRegisterCert": MessageLookupByLibrary.simpleMessage(
            "Please choose to register for a digital certificate to use the VNPT SmartCA remote digital signing service"),
        "pleaseChooseStartDate":
            MessageLookupByLibrary.simpleMessage("Please choose a start date!"),
        "pleaseDrawSign": MessageLookupByLibrary.simpleMessage(
            "Please draw your signature before confirm"),
        "pleaseMakePaymentAgain": MessageLookupByLibrary.simpleMessage(
            "Please make the payment again.\nThank you!"),
        "pleaseSelectDataInList":
            MessageLookupByLibrary.simpleMessage("Please select data in list"),
        "pleaseTryAgainInAFewMinutes": MessageLookupByLibrary.simpleMessage(
            "Please try again in a few minutes"),
        "pleaseUserTheOfficialEmailAndPhoneNumber":
            MessageLookupByLibrary.simpleMessage(
                "Please use the official email and phone number to keep the service information secure!"),
        "please_input_different_name": MessageLookupByLibrary.simpleMessage(
            "The new name cannot be the same as the old name."),
        "please_input_full_name":
            MessageLookupByLibrary.simpleMessage("Please enter full name."),
        "prepareFullDocument": MessageLookupByLibrary.simpleMessage(
            "Please prepare all documents before starting!"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "processingGenKey": MessageLookupByLibrary.simpleMessage(
            "The system is initializing the key.\nPlease wait ..."),
        "processingPackageSignature": MessageLookupByLibrary.simpleMessage(
            "The system is initializing the signing package service.\nPlease wait a moment!"),
        "processingRequest":
            MessageLookupByLibrary.simpleMessage("Processing the request"),
        "processingRequestChangeDevice": MessageLookupByLibrary.simpleMessage(
            "The system is processing the device change request. \nPlease wait a moment..."),
        "processingRequestDescription": MessageLookupByLibrary.simpleMessage(
            "Your order is being processed.\nPlease wait a moment..."),
        "product_money": MessageLookupByLibrary.simpleMessage("Money:"),
        "product_name": MessageLookupByLibrary.simpleMessage("Name:"),
        "product_price": MessageLookupByLibrary.simpleMessage("Price:"),
        "product_quantity": MessageLookupByLibrary.simpleMessage("Quantity:"),
        "progressProcessing":
            MessageLookupByLibrary.simpleMessage("Please wait a moment..."),
        "province": MessageLookupByLibrary.simpleMessage("Province"),
        "provinceCity": MessageLookupByLibrary.simpleMessage("Province/City"),
        "qrCodeInvalid":
            MessageLookupByLibrary.simpleMessage("QR Code invalid"),
        "qrCodeInvalidDescription": MessageLookupByLibrary.simpleMessage(
            "Please use QR code on Citizen ID to get information!"),
        "qrCodeIsRegistered": m20,
        "qrCodeIsWaitingActive": m21,
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "reEnterNewPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter new password"),
        "reEnterNewPasswordNotCorrect": MessageLookupByLibrary.simpleMessage(
            "Re-enter new password is not correct"),
        "reEnterPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter password"),
        "rePinValidateSixDigit": MessageLookupByLibrary.simpleMessage(
            "Please enter confirm a 6-digit PIN codes"),
        "re_create_service_order": MessageLookupByLibrary.simpleMessage(
            "Re initialize service package"),
        "reactivateAccount":
            MessageLookupByLibrary.simpleMessage("Reactivate account?"),
        "reactivation_notified": MessageLookupByLibrary.simpleMessage(
            "Use account reactivation in case of device change, device loss, forgot PIN or loss of authentication key information."),
        "reactiveFail":
            MessageLookupByLibrary.simpleMessage("Change request failed"),
        "recall": MessageLookupByLibrary.simpleMessage("Recall"),
        "recentTransactions":
            MessageLookupByLibrary.simpleMessage("Recent transactions"),
        "reciveOTP": MessageLookupByLibrary.simpleMessage(
            "Didn\'t you receive the code?"),
        "referralCode": MessageLookupByLibrary.simpleMessage("Referral code"),
        "refreshTokenFailed": MessageLookupByLibrary.simpleMessage(
            "Failed to retrieve refresh token for authentication."),
        "registerAccountContactHotline": m22,
        "registerCert": MessageLookupByLibrary.simpleMessage(
            "Register digital certificate"),
        "registerDetailIntro": MessageLookupByLibrary.simpleMessage(
            "Use identification and face authentication to register for an account"),
        "registerIntro": MessageLookupByLibrary.simpleMessage(
            "Register an account online using eKYC"),
        "registerServiceSuccess": MessageLookupByLibrary.simpleMessage(
            "Service registration successful!"),
        "registerServiceSuccessGuideNextStep": m23,
        "registrationCardType":
            MessageLookupByLibrary.simpleMessage("Registration card type"),
        "reject": MessageLookupByLibrary.simpleMessage("Reject"),
        "remainTimeToSign":
            MessageLookupByLibrary.simpleMessage("Remain time to sign"),
        "remaining_to_sign_equal_zero": MessageLookupByLibrary.simpleMessage(
            "You currently have 0 signatures; Please purchase a Signature on the SmartCA app to continue using the service"),
        "renewCertOrder":
            MessageLookupByLibrary.simpleMessage("Renew digital certificate"),
        "requestAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "Request to accept the terms of the personal data protection policy"),
        "requestAgreeBill": MessageLookupByLibrary.simpleMessage(
            "Request to agree with the content on the Application Form"),
        "requestBiometricDesc": m24,
        "requestLinkSuccess": MessageLookupByLibrary.simpleMessage(
            "The request to link was successful"),
        "requestOrderType":
            MessageLookupByLibrary.simpleMessage("Request type"),
        "requestSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Request send successfully"),
        "requestTime": MessageLookupByLibrary.simpleMessage("Request time"),
        "requestUnlinkSuccess": MessageLookupByLibrary.simpleMessage(
            "The request to unlink was successful"),
        "resendOTP": MessageLookupByLibrary.simpleMessage("Resend OTP"),
        "resendOTPLater":
            MessageLookupByLibrary.simpleMessage("Resend the otp code later"),
        "result": MessageLookupByLibrary.simpleMessage("Result"),
        "resultPacks": m25,
        "retry": MessageLookupByLibrary.simpleMessage("Try again"),
        "revoked": MessageLookupByLibrary.simpleMessage("Revoked"),
        "revoked_alter_message": MessageLookupByLibrary.simpleMessage(
            "Customer\'s certificate has been revoked. Please register a new certificate to make the purchase of signatures"),
        "scanQR": MessageLookupByLibrary.simpleMessage("Scan QR"),
        "scanQRCode": MessageLookupByLibrary.simpleMessage("Scan QR code"),
        "scanQRDescription": MessageLookupByLibrary.simpleMessage(
            "Please scan the QR Code on the ID\ncitizens to get information"),
        "scanQRGuide": MessageLookupByLibrary.simpleMessage(
            "Please put the QR Code in the center\nof the frame"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "searchAdvance":
            MessageLookupByLibrary.simpleMessage("Advanced search"),
        "searchFilters": MessageLookupByLibrary.simpleMessage("Search Filters"),
        "second": MessageLookupByLibrary.simpleMessage("second"),
        "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
        "selectCertToSign": MessageLookupByLibrary.simpleMessage(
            "Select a digital certificate to purchase signatures"),
        "selectCertificate":
            MessageLookupByLibrary.simpleMessage("Select certificate"),
        "selectCertificatePack":
            MessageLookupByLibrary.simpleMessage("Select certificate package"),
        "selectData": MessageLookupByLibrary.simpleMessage("Select data"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
        "selectObject": MessageLookupByLibrary.simpleMessage("Select object"),
        "select_cert_to_change_info": MessageLookupByLibrary.simpleMessage(
            "Select the digital certificate whose information needs to be changed!"),
        "select_cert_to_extend": MessageLookupByLibrary.simpleMessage(
            "Select the digital certificate to extend!"),
        "select_time_to_extend":
            MessageLookupByLibrary.simpleMessage("Select renewal period"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendSupportRequest":
            MessageLookupByLibrary.simpleMessage("Send a support request"),
        "sentServiceRequestSuccess": MessageLookupByLibrary.simpleMessage(
            "Submit request for issuance of Digital Certificate successfully. Please check your email in a few minutes to activate the service."),
        "serial": MessageLookupByLibrary.simpleMessage("Serial"),
        "serialNumber": MessageLookupByLibrary.simpleMessage("Serial number"),
        "serviceCannotVerifyApp":
            MessageLookupByLibrary.simpleMessage("Cannot verify app"),
        "serviceCharge": MessageLookupByLibrary.simpleMessage("Service charge"),
        "serviceExpireToken": MessageLookupByLibrary.simpleMessage(
            "Your session is expired. Please signin again"),
        "serviceGenerateKAKFail":
            MessageLookupByLibrary.simpleMessage("Generate KAK failed"),
        "serviceGeneratingKAK":
            MessageLookupByLibrary.simpleMessage("Creating KAK"),
        "serviceInitialization":
            MessageLookupByLibrary.simpleMessage("Service Initialization"),
        "serviceLockPINOverEnter": MessageLookupByLibrary.simpleMessage(
            "Your PIN has been locked because enter wrong over accept times."),
        "serviceLostConnection": MessageLookupByLibrary.simpleMessage(
            "Connection errors. Please check your network connection again"),
        "serviceNoAccessTokenFound":
            MessageLookupByLibrary.simpleMessage("No accessToken found"),
        "serviceNotExistedTransactionHis": MessageLookupByLibrary.simpleMessage(
            "Have not existed transaction history"),
        "serviceNotExistedUserInfo": MessageLookupByLibrary.simpleMessage(
            "Have not existed user information"),
        "serviceNotFoundDevice":
            MessageLookupByLibrary.simpleMessage("No device found"),
        "serviceNotFoundFCMToken": MessageLookupByLibrary.simpleMessage(
            "Cannot register to receive notify"),
        "serviceRejectFail":
            MessageLookupByLibrary.simpleMessage("Reject failed"),
        "serviceRequestForm":
            MessageLookupByLibrary.simpleMessage("Service Request Form"),
        "serviceSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Please try again later"),
        "serviceVerifyAppFail":
            MessageLookupByLibrary.simpleMessage("Verify fail app"),
        "service_pack_create_order_failed":
            MessageLookupByLibrary.simpleMessage("Error: Order failed."),
        "service_pack_get_failed": MessageLookupByLibrary.simpleMessage(
            "Error: Failed to get sign package information."),
        "service_pack_order_status":
            MessageLookupByLibrary.simpleMessage("Status:"),
        "service_pack_payment_failed": MessageLookupByLibrary.simpleMessage(
            "Error: Payment integration failed."),
        "service_pack_reject_message": MessageLookupByLibrary.simpleMessage(
            "Your account is not purchased as signed!"),
        "service_pack_signatures":
            MessageLookupByLibrary.simpleMessage("Signatures"),
        "service_pack_total_amount":
            MessageLookupByLibrary.simpleMessage("Total"),
        "service_pack_total_signature":
            MessageLookupByLibrary.simpleMessage("Total signatures:"),
        "service_pack_vat_included":
            MessageLookupByLibrary.simpleMessage("(Included 10% VAT)"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "setupPasswordAccount":
            MessageLookupByLibrary.simpleMessage("Setup password for account"),
        "setupPinCode": MessageLookupByLibrary.simpleMessage("Setup PIN"),
        "shareDetailIntro": MessageLookupByLibrary.simpleMessage(
            "You can receive files from other applications to Create transactions and Reshare digitally signed files"),
        "shareIntro": MessageLookupByLibrary.simpleMessage(
            "Sign, Receive Files, Share Files directly on the app"),
        "sign": MessageLookupByLibrary.simpleMessage("Sign all"),
        "sign769TranTypeDesc":
            MessageLookupByLibrary.simpleMessage("Sign hash 769"),
        "signBbnt":
            MessageLookupByLibrary.simpleMessage("Sign acceptance minutes"),
        "signChangeRequest": MessageLookupByLibrary.simpleMessage(
            "Sign the change request form"),
        "signConfirm":
            MessageLookupByLibrary.simpleMessage("Sign confirmation"),
        "signDetailIntro": MessageLookupByLibrary.simpleMessage(
            "You can buy unlimited and choose Digital Certificates when Signing"),
        "signError": MessageLookupByLibrary.simpleMessage("Sign error"),
        "signErrorInvalid": MessageLookupByLibrary.simpleMessage(
            "Error Signing BBNT, signature is invalid"),
        "signFailed": MessageLookupByLibrary.simpleMessage("Sign failed"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signInFieldWarning": m26,
        "signIntro": MessageLookupByLibrary.simpleMessage(
            "Unlimited ownership of digital certificates"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signOutConfirm": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to sign out this device?"),
        "signTheProposalForm":
            MessageLookupByLibrary.simpleMessage("Sign the proposal"),
        "signToQD769":
            MessageLookupByLibrary.simpleMessage("Sign to QD-769-BTTTT"),
        "signTranTypeDesc":
            MessageLookupByLibrary.simpleMessage("Document Signing"),
        "signTransactionDone": MessageLookupByLibrary.simpleMessage(
            "Your transaction has been signed successfully"),
        "sign_ticket_extension_title":
            MessageLookupByLibrary.simpleMessage("Sign extension request form"),
        "sign_tranaction_success": m27,
        "signatureOption":
            MessageLookupByLibrary.simpleMessage("Signature option"),
        "signedSuccess": MessageLookupByLibrary.simpleMessage("Signed success"),
        "signer": MessageLookupByLibrary.simpleMessage("Signer"),
        "signerTranTypeDesc": MessageLookupByLibrary.simpleMessage("Signer"),
        "signingInformation":
            MessageLookupByLibrary.simpleMessage("Signing Information"),
        "size": MessageLookupByLibrary.simpleMessage("Size"),
        "startVerifying":
            MessageLookupByLibrary.simpleMessage("Start Verifying"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "streetName": MessageLookupByLibrary.simpleMessage("Street name"),
        "strongPasswordValid": MessageLookupByLibrary.simpleMessage(
            "Use 8-30 characters including uppercase, lowercase, numbers, special characters ~!@#\$%^&*_-+=`|(){}[]:;”<>,.? /"),
        "subject": MessageLookupByLibrary.simpleMessage("Subject"),
        "subscriber_information":
            MessageLookupByLibrary.simpleMessage("Subscriber information"),
        "subscriber_name":
            MessageLookupByLibrary.simpleMessage("Subscriber name"),
        "successNotirce": MessageLookupByLibrary.simpleMessage("Success !"),
        "successfulAccountRegistration": MessageLookupByLibrary.simpleMessage(
            "Successful account registration"),
        "suggested_extension":
            MessageLookupByLibrary.simpleMessage("Suggested extension"),
        "support": MessageLookupByLibrary.simpleMessage("Support"),
        "sureToQuitReactive": MessageLookupByLibrary.simpleMessage(
            "Are your sure to quit reactive account process?"),
        "suspended": MessageLookupByLibrary.simpleMessage("Suspended"),
        "suspended_alter_message": MessageLookupByLibrary.simpleMessage(
            "Customer\'s certificate is on hold. Please contact your administrator for assistance."),
        "syncBBNTFailure":
            MessageLookupByLibrary.simpleMessage("Synchronization failed"),
        "systemVerifying": MessageLookupByLibrary.simpleMessage(
            "The system is verifying the information.\nPlease wait a moment..."),
        "tai_anh_chu_ky": MessageLookupByLibrary.simpleMessage("Upload"),
        "tai_hinh_nen":
            MessageLookupByLibrary.simpleMessage("Upload image background"),
        "tai_mau_dinh_kem":
            MessageLookupByLibrary.simpleMessage("Upload attached sample"),
        "takePhotoBrightClear": MessageLookupByLibrary.simpleMessage(
            "Take photos that are bright and clear"),
        "taxCode": MessageLookupByLibrary.simpleMessage("Tax code"),
        "ten_chung_thu":
            MessageLookupByLibrary.simpleMessage("Certificate name"),
        "termOfUseService":
            MessageLookupByLibrary.simpleMessage("terms of service"),
        "theFeatureAreImprovingPleaseTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "The feature are improving\nPlease try again later!"),
        "theSystemIsInitializingTheContract": MessageLookupByLibrary.simpleMessage(
            "The system is initializing the contract\nPlease wait a moment..."),
        "theSystemIsInitializingTheServicePleaseWaitAMoment":
            MessageLookupByLibrary.simpleMessage(
                "The system is initializing the service,\nplease wait a moment...."),
        "theSystemWillAutomaticallySign": MessageLookupByLibrary.simpleMessage(
            "The system will automatically sign the number when you choose to open. Turn off the feature when no longer in use."),
        "them_chu_ky": MessageLookupByLibrary.simpleMessage("Add signature"),
        "them_mau_chu_ky":
            MessageLookupByLibrary.simpleMessage("Add signature temp"),
        "thereIsDeviceChangeRequest": m28,
        "time": MessageLookupByLibrary.simpleMessage("Time"),
        "timeToDate": MessageLookupByLibrary.simpleMessage("Time to date"),
        "toDate": MessageLookupByLibrary.simpleMessage("To Date"),
        "toPerformSystemLinking":
            MessageLookupByLibrary.simpleMessage(" to perform system linking"),
        "to_chu_xac_thuc":
            MessageLookupByLibrary.simpleMessage("Authorization organization"),
        "tokenExpired": MessageLookupByLibrary.simpleMessage("Token expired"),
        "totalNumberSignatures": m29,
        "totalRecord": m30,
        "totalResult": m31,
        "transExpired": MessageLookupByLibrary.simpleMessage(
            "Transaction expired or cancel signing cannot be viewed!"),
        "transPending": MessageLookupByLibrary.simpleMessage(
            "Transaction pending signing cannot be viewed!"),
        "transactionDate":
            MessageLookupByLibrary.simpleMessage("Transaction date"),
        "transactionDesc":
            MessageLookupByLibrary.simpleMessage("Transaction Description"),
        "transactionDetail":
            MessageLookupByLibrary.simpleMessage("Transaction detail"),
        "transactionHistory":
            MessageLookupByLibrary.simpleMessage("Transaction history"),
        "transactionStatus":
            MessageLookupByLibrary.simpleMessage("Transaction status"),
        "transactionType":
            MessageLookupByLibrary.simpleMessage("Transaction type"),
        "transaction_request_group_title": m32,
        "transactionhistoryinfo": MessageLookupByLibrary.simpleMessage(
            "Transaction history information"),
        "transactions": MessageLookupByLibrary.simpleMessage("Transactions"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Please try again!"),
        "turn": m33,
        "turnOff": MessageLookupByLibrary.simpleMessage("Turn off"),
        "turnOn": MessageLookupByLibrary.simpleMessage("Turn on"),
        "tutorialRegisterAccount":
            MessageLookupByLibrary.simpleMessage("Register account tutorial"),
        "tuy_chon_vi_tri_ky":
            MessageLookupByLibrary.simpleMessage("Signature Location Options"),
        "typeOfCertificate":
            MessageLookupByLibrary.simpleMessage("Type of certificate"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "unlimitedNumberOfSignatures": MessageLookupByLibrary.simpleMessage(
            "Unlimited number of signatures"),
        "unuseds_ignatures":
            MessageLookupByLibrary.simpleMessage("Unused signatures"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "updateHistory": MessageLookupByLibrary.simpleMessage("Update History"),
        "updateVersionMsg":
            MessageLookupByLibrary.simpleMessage("Update this app to"),
        "useTheAddress": MessageLookupByLibrary.simpleMessage(
            "Use the address where you live or work for the fastest support"),
        "usedTime": MessageLookupByLibrary.simpleMessage("Used Time"),
        "userManual": MessageLookupByLibrary.simpleMessage("User Manual"),
        "userName": MessageLookupByLibrary.simpleMessage("Username"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernamePlacehoder":
            MessageLookupByLibrary.simpleMessage("Enter ID number or tax code"),
        "validate10or13": MessageLookupByLibrary.simpleMessage("10 or 13"),
        "validate_passport_error": MessageLookupByLibrary.simpleMessage(
            "Passport is not in the correct format"),
        "validity": MessageLookupByLibrary.simpleMessage("Valid"),
        "ve_chu_ky_tai_day":
            MessageLookupByLibrary.simpleMessage("Draw signature here"),
        "verifyFail":
            MessageLookupByLibrary.simpleMessage("Authentication failed!"),
        "verifyFailDetail": MessageLookupByLibrary.simpleMessage(
            "An error occurred, please try again later!"),
        "verifyInfo":
            MessageLookupByLibrary.simpleMessage("Verify information"),
        "verifyInfoError": MessageLookupByLibrary.simpleMessage(
            "Verification of information failed!"),
        "verifyInfoErrorCauseContent":
            MessageLookupByLibrary.simpleMessage("Portrait is not real!"),
        "verifyInfoErrorCauseContent2":
            MessageLookupByLibrary.simpleMessage("Face does not match"),
        "verifyInfoErrorCauseGuide": MessageLookupByLibrary.simpleMessage(
            "You only have a maximum of 03 eKYC executions."),
        "verifyInfoErrorCauseLabel":
            MessageLookupByLibrary.simpleMessage("Reason:"),
        "verifyInfoErrorDescription": MessageLookupByLibrary.simpleMessage(
            "Sorry, we were unable to verify your information."),
        "verifyInfoErrorSolution": MessageLookupByLibrary.simpleMessage(
            "Please contact Call Center 18001260 (branch 1) for free for assistance in verifying information at the counter!"),
        "verifyInfoErrorSolution2": MessageLookupByLibrary.simpleMessage(
            "Please follow the instructions exactly for the verification to work properly."),
        "verifyInformationAccount":
            MessageLookupByLibrary.simpleMessage("Verify account information"),
        "verifyTranTypeDesc": MessageLookupByLibrary.simpleMessage("Confirm"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "versionNewest": MessageLookupByLibrary.simpleMessage(
            "You are using the latest version"),
        "versionNumber": m34,
        "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
        "viewFileHash": MessageLookupByLibrary.simpleMessage(
            "The preview feature does not support signed hash transactions!"),
        "viewMore": MessageLookupByLibrary.simpleMessage("View more"),
        "viewOrderDetail": MessageLookupByLibrary.simpleMessage("Order detail"),
        "viewTransactionInfo":
            MessageLookupByLibrary.simpleMessage("View information"),
        "view_detail": MessageLookupByLibrary.simpleMessage("View detail"),
        "vnd": m35,
        "waitingActivate":
            MessageLookupByLibrary.simpleMessage("Waiting activate"),
        "waitingApprove":
            MessageLookupByLibrary.simpleMessage("Waiting for approval"),
        "waitingCapCTS": MessageLookupByLibrary.simpleMessage(
            "Your application will be approved within 30 minutes (during office hours). Results will be announced via VNPT SmartCA application!"),
        "waitingConfig": MessageLookupByLibrary.simpleMessage("Waiting config"),
        "waitingForAcceptCertDescription": MessageLookupByLibrary.simpleMessage(
            "Your profile will be approved within\n30 minutes (during office hours).\nResults will be notified via email!"),
        "waitingForAcceptCertTitle": MessageLookupByLibrary.simpleMessage(
            "Waiting for approval of registration request\ndigital certificate!"),
        "waitingForAcceptChangeDeviceTitle":
            MessageLookupByLibrary.simpleMessage(
                "Waiting for change request approval\ndevice!"),
        "waitingForAcceptChangeInfoTitle": MessageLookupByLibrary.simpleMessage(
            "Waiting for approval of request to change\ndigital certificate information"),
        "waitingForAcceptExtendTitle": MessageLookupByLibrary.simpleMessage(
            "Waiting for approval of extension request\ndigital certificate!"),
        "waitingForActivation":
            MessageLookupByLibrary.simpleMessage("Waiting for activation"),
        "waitingForApproval": MessageLookupByLibrary.simpleMessage(
            "VNPT SmartCA has received your documents. Please wait for the approval and issue the digital certificate"),
        "waitingForSignerConfirm":
            MessageLookupByLibrary.simpleMessage("Wait for confirm"),
        "waitingGenerateCertificate": MessageLookupByLibrary.simpleMessage(
            "Waiting generate certificate"),
        "waitingGenerateKeyPair":
            MessageLookupByLibrary.simpleMessage("Waiting generate keypair"),
        "waitingSignAcceptanceMinutes": MessageLookupByLibrary.simpleMessage(
            "Waiting sign acceptance minutes"),
        "waitingSyncBBNT": MessageLookupByLibrary.simpleMessage(
            "Experience Record Synchronization Flag"),
        "waitingUserActive":
            MessageLookupByLibrary.simpleMessage("Waiting for user activation"),
        "wards": MessageLookupByLibrary.simpleMessage("Wards"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "warning_number_sign": m36,
        "whatYouNeedTKnow":
            MessageLookupByLibrary.simpleMessage("What you need to know"),
        "whenTheTermExpires": MessageLookupByLibrary.simpleMessage(
            "When the term expires, please reconfigure to continue using"),
        "youCanNotBuySignature": MessageLookupByLibrary.simpleMessage(
            "No digital certificate exists Pay as you sign in active state"),
        "youDontHaveCert": MessageLookupByLibrary.simpleMessage(
            "You do not have a digital certificate"),
        "youKnowOne": MessageLookupByLibrary.simpleMessage(
            "Digital certificates do not include signatures. The number of subscriptions will be according to the subscription package purchased separately"),
        "youKnowTwo": MessageLookupByLibrary.simpleMessage(
            "Free digital signature when making transactions on the national public service portal."),
        "you_need_know":
            MessageLookupByLibrary.simpleMessage("You need to know")
      };
}
