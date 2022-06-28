import '../../utils/storage/secure_storage.dart';

class AuthRepository {
  static const String keyAuthTokenAccess = 'auth_token_key_access';
  static const String keyAuthTokenRefresh = 'auth_token_key_refresh';

  static final AuthRepository _appRepository = AuthRepository._internal();

  final _secureStorage = SecureStorage();

  factory AuthRepository() {
    return _appRepository;
  }

  AuthRepository._internal();

  void saveAccessToken(String token) {
    _secureStorage.writeSecureData(keyAuthTokenAccess, token);
  }

  void saveDetailToken(String token) {
    _secureStorage.writeSecureData(keyAuthTokenRefresh, token);
  }

  Future<String?> getAccessToken() async =>
      await _secureStorage.readSecureData(keyAuthTokenAccess);

  Future<String?> getDetailToken() async =>
      await _secureStorage.readSecureData(keyAuthTokenRefresh);
}
