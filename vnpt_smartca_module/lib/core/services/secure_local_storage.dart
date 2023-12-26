import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorageService {
  final FlutterSecureStorage flutterSecureStorage;

  SecureLocalStorageService(this.flutterSecureStorage);

  Future<String?> getLastData(String key) async {
    final jsonString = await flutterSecureStorage.read(key: key);
    return jsonString;
  }

  Future removeData(String key) async {
    await flutterSecureStorage.delete(key: key);
  }

  Future removeAll() async {
    await flutterSecureStorage.deleteAll();
  }

  Future saveData(String key, String? data, [bool deleteBefore = false]) async {
    await flutterSecureStorage.write(key: key, value: data);
  }
}
