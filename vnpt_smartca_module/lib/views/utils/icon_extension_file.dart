import 'package:flutter_svg/svg.dart';
import '../../../gen/assets.gen.dart';

class ExtensionTypeIcon {
  static const List<String> fileExtensions = [
    '.docx',
    '.xlsx',
    '.pptx',
    '.pdf',
    '.xml',
    '.DOCX',
    '.XLSX',
    '.PDF',
    '.XML'
  ];
  static SvgPicture extensionTypeIcon(String extension) {
    if (!extension.contains(".")) extension = ".$extension";
    switch (extension.toLowerCase()) {
      case '.docx':
      case '.doc':
        return Assets.images.word.svg();
      case '.xlsx':
      case '.xls':
        return Assets.images.xlsx.svg();
      case '.pptx':
        return Assets.images.pptx.svg();
      case '.xml':
        return Assets.images.xml.svg();
      case '.pdf':
      default:
        return Assets.images.pdf.svg();
    }
  }

  static String extensionImageIcon(String extension) {
    switch (extension.toLowerCase()) {
      case '.pdf':
        return 'assets/images/document/pdf.png';
      case '.docx':
      case '.doc':
        return 'assets/images/document/docx.png';
      case '.xlsx':
      case '.xls':
        return 'assets/images/document/xlsx.png';
      case '.ppt':
        return 'assets/images/document/pptx.png';
      case '.pptx':
        return 'assets/images/document/pptx.png';
      case '.xml':
        return 'assets/images/document/xml.png';
      default:
        return 'assets/images/document/default.png';
    }
  }
}
