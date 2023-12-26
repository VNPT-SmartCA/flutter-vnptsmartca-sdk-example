import '../../../views/i18n/generated_locales/l10n.dart';

class SignatureDropdownViewType {
  int value;
  String text;

  SignatureDropdownViewType({required this.value, required this.text});
}

List<SignatureDropdownViewType> listDropview = [
  SignatureDropdownViewType(
    value: 1,
    text: AppLocalizations.current.chi_hien_thi_text,
  ),
  SignatureDropdownViewType(
    value: 2,
    text: AppLocalizations.current.hien_thi_text_logo_ben_trai,
  ),
  SignatureDropdownViewType(
    value: 3,
    text: AppLocalizations.current.chi_hien_thi_logo,
  ),
  SignatureDropdownViewType(
    value: 4,
    text: AppLocalizations.current.hien_thi_text_logo_tren,
  ),
  SignatureDropdownViewType(
    value: 5,
    text: AppLocalizations.current.hien_thi_text_hinh_nen,
  ),
  SignatureDropdownViewType(
    value: 6,
    text: AppLocalizations.current.hien_thi_text_logo_ben_trai_chu,
  ),
];

List<SignatureDropdownViewType> listDropviewVN = [
  SignatureDropdownViewType(
    value: 1,
    text: "1. Chỉ hiển thị text",
  ),
  SignatureDropdownViewType(
    value: 2,
    text: "2. Hiển thị text và logo bên trái",
  ),
  SignatureDropdownViewType(
    value: 3,
    text: "3. Chỉ hiển thị logo",
  ),
  SignatureDropdownViewType(
    value: 4,
    text: "4. Hiển thị text và logo phía trên",
  ),
  SignatureDropdownViewType(
    value: 5,
    text: "5. Hiển thị text và hình nền",
  ),
  SignatureDropdownViewType(
    value: 6,
    text: "6. Hiển thị text, logo bên trái và chữ ký",
  ),
];

List<SignatureDropdownViewType> listDropviewEN = [
  SignatureDropdownViewType(
    value: 1,
    text: "1. Show only text",
  ),
  SignatureDropdownViewType(
    value: 2,
    text: "2. Display text and logo on the left",
  ),
  SignatureDropdownViewType(
    value: 3,
    text: "3. Show only the logo",
  ),
  SignatureDropdownViewType(
    value: 4,
    text: "4. Display text and logo above",
  ),
  SignatureDropdownViewType(
    value: 5,
    text: "5. Display text and background",
  ),
  SignatureDropdownViewType(
    value: 6,
    text: "6. Display text, logo on the left and signature",
  ),
];
