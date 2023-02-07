import 'package:shared_preferences/shared_preferences.dart';

import 'storage.dart';

class SharedPreference implements Storage {
  static final SharedPreference _sharedPreference =
      SharedPreference._internal();

  factory SharedPreference() {
    return _sharedPreference;
  }

  SharedPreference._internal();

  Future<SharedPreferences> _getPreference() async =>
      await SharedPreferences.getInstance();

  @override
  Future<void> deleteAllData() async =>
      await _getPreference().then((v) => v.clear());

  @override
  Future<void> deleteData(String key) async =>
      await _getPreference().then((v) => v.remove(key));

  @override
  Future<String?> readData(String key) async =>
      await _getPreference().then((v) => v.getString(key));

  @override
  Future<bool> writeData(String key, String value) async =>
      await _getPreference().then((v) => v.setString(key, value));
}
