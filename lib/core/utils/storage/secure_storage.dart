import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage.dart';

class SecureStorage implements Storage {
  static final SecureStorage _secureStorage = SecureStorage._internal();

  factory SecureStorage() {
    return _secureStorage;
  }

  SecureStorage._internal();

  final _flutterSecureStorage = const FlutterSecureStorage();

  @override
  Future<void> writeSecureData(String key, String value) async =>
      await _flutterSecureStorage.write(
          key: key, value: value, aOptions: _getAndroidOptions());

  @override
  Future<String?> readSecureData(String key) async =>
      await _flutterSecureStorage.read(
          key: key, aOptions: _getAndroidOptions());

  @override
  Future<void> deleteSecureData(String key) async =>
      _flutterSecureStorage.delete(key: key, aOptions: _getAndroidOptions());

  @override
  Future<void> deleteAllSecureData() async =>
      await _flutterSecureStorage.deleteAll(aOptions: _getAndroidOptions());

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
