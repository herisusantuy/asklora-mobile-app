import '../../utils/storage/secure_storage.dart';

class TokenRepository {
  static const String keyAuthTokenAccess = 'auth_token_key_access';
  static const String keyAuthTokenRefresh = 'auth_token_key_refresh';

  static final TokenRepository _appRepository = TokenRepository._internal();

  final _secureStorage = SecureStorage();

  factory TokenRepository() {
    return _appRepository;
  }

  TokenRepository._internal();

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
