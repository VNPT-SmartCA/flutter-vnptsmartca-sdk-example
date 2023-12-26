import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/app/file_model.dart';

class ShareFiles {
  static bool isFileExists = false;
  static List<FileModel> listFile = [];
  static var files;

  static String getSizeOfFile(String filepath, int decimals) {
    var file = File(filepath);
    try {
      int bytes = file.lengthSync();
      if (bytes <= 0) return "0 B";
      const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
      var i = (log(bytes) / log(1024)).floor();
      return ('${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}')
          .toString();
    } catch (e, StackTrace) {
      return '';
    }
  }

  static double getSizeFile(String filepath, int decimals) {
    var file = File(filepath);
    int bytes = file.lengthSync();
    if (bytes <= 0) {
      return 0;
    } else {
      return (bytes / (1024 * 1024));
    }
  }

  static Future<void> deleteAll(String folder) async {
    final directory = await localTempPath;
    Directory dirApp = Directory('$directory/$folder');
    bool directoryExists = await dirApp.exists();
    if (directoryExists) {
      try {
        dirApp.deleteSync(recursive: true);
      } catch (e, stackTrace) {
        print('Delete all file===>' + stackTrace.toString());
      }
    }
  }

  static Future<bool> fileExists(String filename) async {
    final directory = await localTempPath;
    Directory dirApp = Directory(directory);
    var listFile = dirApp.listSync(recursive: true, followLinks: false);
    if (listFile.isNotEmpty) {
      for (int k = 0; k < listFile.length; k++) {
        String fileFormat = listFile[k].path.split('/').last;
        if (fileFormat == filename) {
          isFileExists = true;
          break;
        } else {
          isFileExists = false;
        }
      }
    } else {
      isFileExists = false;
    }
    return isFileExists;
  }

  // Temporary directory
  static Future<String> get localTempPath async {
    final directory = await getTemporaryDirectory();
    Directory dirApp = Directory(directory.path);
    return dirApp.path;
  }

  //TempDirectory get enum intDirApp or extPublicDir
  static Future<int?> deleteFile(String TempDirectory, String Filename) async {
    final directory = await localTempPath;
    Directory dirApp;
    if (TempDirectory.isEmpty) {
      dirApp = Directory('$directory/$Filename');
    } else {
      dirApp = Directory('$directory/$TempDirectory/$Filename');
    }
    try {
      final file = File(dirApp.path);
      if (file.existsSync()) file.delete();
      //await Timer(Duration(days: 1), () => {file.delete()});
    } catch (e, stackTrace) {
      return 0;
    }
  }

  static Future<void> saveFile(String fileDataBase64, String filename) async {
    final filePath = await localTempPath;
    Directory dirApp = Directory(filePath);
    if (!Directory('${dirApp.path}/Documents').existsSync()) {
      Directory('${dirApp.path}/Documents').createSync(recursive: true);
    }
    try {
      final Uint8List byte = base64.decode(fileDataBase64);
      //String filename = FileName.replaceAll(RegExp(' '), '_');
      String fileLocal = '${dirApp.path}/Documents/$filename';
      File docFile = new File(fileLocal);
      docFile.writeAsBytesSync(byte);
    } catch (e, stackTrace) {}
  }

  static Future<void> downloadFile(String url, String fileName) async {
    HttpClient httpClient = new HttpClient();
    File file;
    final filePath = await localTempPath;

    if (!Directory('$filePath/Download').existsSync()) {
      Directory('$filePath/Download').createSync(recursive: true);
    }
    Directory dirApp = Directory('$filePath/Download');
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        file = File('{$dirApp}/$fileName');
        await file.writeAsBytes(bytes);
      } else
        print('Error code: ' + response.statusCode.toString());
    } catch (e, stackTrace) {}
  }

  static Future<void> shareFiles(String filename) async {
    final directory = await localTempPath;
    Directory dirApp = Directory('$directory/Documents');
    try {
      Share.shareXFiles(
          ['${dirApp.path}/$filename'].map((e) => XFile(e)).toList(),
          subject: filename
          // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
          );
    } catch (e, stackTrace) {}
  }

  static Future<void> readFile(String fileName) async {
    final directory = await localTempPath;
    Directory dirApp = Directory('$directory/Documents');
    try {
      final result = await OpenFile.open('${dirApp.path}/$fileName');
      print(result);
    } catch (e, stackTrace) {
      print(stackTrace.toString());
    }
  }
}
