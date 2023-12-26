import 'dart:io';

class FileModel {
  final String name;
  final String size;
  final String data;
  final File? file;
  final String path;
  final double? sizeMb;

  FileModel(
      {required this.name,
      required this.data,
      required this.size,
      required this.file,
      required this.path,
      this.sizeMb});

  static FileModel? fromDoc(Map element) {
    try {
      return FileModel(
          name: element['name'],
          size: element['size'],
          data: element['data'] ?? element["dataSigned"] ?? "",
          file: File(""),
          path: element['name']);
    } catch (e) {}
    return null;
  }
}

List<FileModel> lstFileModel = [];
