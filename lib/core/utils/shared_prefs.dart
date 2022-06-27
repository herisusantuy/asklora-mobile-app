import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  SharedPrefs._internal();

  factory SharedPrefs() => SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String getData(String key) => _sharedPrefs.getString(key) ?? '';

  void saveData(String key, String value) {
    _sharedPrefs.setString(key, value);
  }
}

final sharedPrefs = SharedPrefs();
