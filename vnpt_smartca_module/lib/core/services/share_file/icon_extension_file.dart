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
  static String extensionTypeIcon(String extension) {
    switch (extension.toLowerCase()) {
      case '.pdf':
        return 'assets/svg/pdf.svg';
        break;
      case '.docx':
        return 'assets/svg/docx.svg';
        break;
      case '.doc':
        return 'assets/svg/docx.svg';
        break;
      case '.xlsx':
        return 'assets/svg/xlsx.svg';
        break;
      case '.xls':
        return 'assets/svg/xlsx.svg';
        break;
      case '.ppt':
        return 'assets/svg/pptx.svg';
        break;
      case '.xlsx':
        return 'assets/svg/xlsx.svg';
        break;
      case '.pptx':
        return 'assets/svg/pptx.svg';
        break;
      case '.xml':
        return 'assets/svg/xml.svg';
        break;
      default:
        return 'assets/svg/pdf.svg';
        break;
    }
  }

  static String extensionImageIcon(String extension) {
    switch (extension.toLowerCase()) {
      case '.pdf':
        return 'assets/images/document/pdf.png';
        break;
      case '.docx':
      case '.doc':
        return 'assets/images/document/docx.png';
        break;
      case '.xlsx':
      case '.xls':
        return 'assets/images/document/xlsx.png';
        break;
      case '.ppt':
        return 'assets/images/document/pptx.png';
        break;
      case '.pptx':
        return 'assets/images/document/pptx.png';
        break;
      case '.xml':
        return 'assets/images/document/xml.png';
        break;
      default:
        return 'assets/images/document/default.png';
        break;
    }
  }
}
