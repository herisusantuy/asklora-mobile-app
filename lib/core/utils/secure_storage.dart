import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future saveSecureData(String key, String value) async {
    var saveData = await storage.write(key: key, value: value);
    return saveData;
  }

  Future readSecureData(String key) async {
    var readData = await storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await storage.delete(key: key);
    return deleteData;
  }
}

final secureStorage = SecureStorage();
