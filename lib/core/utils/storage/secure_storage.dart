import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _secureStorage = SecureStorage._internal();

  factory SecureStorage() {
    return _secureStorage;
  }

  SecureStorage._internal();

  final _flutterSecureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(String key, String value) async =>
      await _flutterSecureStorage.write(
          key: key, value: value, aOptions: _getAndroidOptions());

  Future<String?> readSecureData(String key) async =>
      await _flutterSecureStorage.read(
          key: key, aOptions: _getAndroidOptions());

  Future<void> deleteSecureData(String key) async =>
      _flutterSecureStorage.delete(key: key, aOptions: _getAndroidOptions());

  Future<void> deleteAllSecureData() async =>
      await _flutterSecureStorage.deleteAll(aOptions: _getAndroidOptions());

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
