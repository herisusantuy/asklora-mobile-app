abstract class Repository {
  static const String keyAuthTokenAccess = 'auth_token_key_access';
  static const String keyAuthTokenRefresh = 'auth_token_key_refresh';

  void saveAccessToken(String token);

  void saveDetailToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getDetailToken();
}
