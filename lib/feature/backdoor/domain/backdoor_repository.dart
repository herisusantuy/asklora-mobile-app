import '../../../core/utils/storage/shared_preference.dart';
import '../../../core/utils/storage/storage_keys.dart';

class BackdoorRepository {
  final SharedPreference _sharedPreference = SharedPreference();

  static const String _baseUrlKey = 'baseUrlKey';

  Future<void> saveBaseUrl(String baseUrl) async {
    await _sharedPreference.writeData(_baseUrlKey, baseUrl);
  }

  Future<String?> getBaseUrl() async {
    return await _sharedPreference.readData(_baseUrlKey);
  }

  Future<bool> isOtpLoginDisabled() async {
    bool? response = await _sharedPreference.readBoolData(sfKeyLoginVersion);
    return response ?? true;
  }

  Future<bool> otpLoginVersion(bool value) async {
    bool response =
        await _sharedPreference.writeBoolData(sfKeyLoginVersion, value);
    return response;
  }
}
