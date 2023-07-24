import '../../../core/utils/storage/shared_preference.dart';

class BackdoorRepository {
  final SharedPreference _sharedPreference = SharedPreference();

  static const String _baseUrlKey = 'baseUrlKey';

  Future<void> saveBaseUrl(String baseUrl) async {
    await _sharedPreference.writeData(_baseUrlKey, baseUrl);
  }

  Future<String?> getBaseUrl() async {
    return await _sharedPreference.readData(_baseUrlKey);
  }
}
